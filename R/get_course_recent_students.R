#' Get recently logged in students for a course
#'
#' This function retrieves the list of recently logged in students for a specific course from the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to retrieve recently logged in students.
#' @param per_page (Optional) The number of students to retrieve per page of results (default is 100).
#'
#' @return A data frame containing recently logged in students for the specified course.
#' @export
#'
get_course_recent_students <- function(canvas, course_id, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/recent_students")
  
  # Build query parameters
  params <- list(per_page = per_page)
  
  # Make the API request
  response <- httr::GET(url, 
                       query = params,
                       httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve course recent students. Please check your authentication and API endpoint.")
  }

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  recent_students_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  recent_students <- dplyr::bind_rows(recent_students_list) %>%
    dplyr::mutate(course_id = course_id)

  # Return the recent students data frame
  return(recent_students)
}