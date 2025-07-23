#' Get gradeable students for an assignment
#'
#' This function retrieves the list of gradeable students for a specific assignment in a course from the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course containing the assignment.
#' @param assignment_id The ID of the assignment for which to retrieve gradeable students.
#' @param per_page (Optional) The number of students to retrieve per page of results (default is 100).
#'
#' @return A data frame containing gradeable students for the specified assignment.
#' @export
#'
get_assignment_gradeable_students <- function(canvas, course_id, assignment_id, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/assignments/", assignment_id, "/gradeable_students")
  
  # Build query parameters
  params <- list(per_page = per_page)
  
  # Make the API request
  response <- httr::GET(url, 
                       query = params,
                       httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve assignment gradeable students. Please check your authentication and API endpoint.")
  }

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  students_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  students <- dplyr::bind_rows(students_list) %>%
    dplyr::mutate(course_id = course_id, assignment_id = assignment_id)

  # Return the students data frame
  return(students)
}