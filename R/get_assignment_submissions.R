#' Lists assignment submissions for a course.
#'
#' This function retrieves a list of assignment submissions for a specific course in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to list assignment submissions.
#' @param assignment_id (Optional) The ID of a specific assignment for which to list submissions.
#' @param per_page (Optional) The number of submissions to retrieve per page of results (default is 100).
#'
#' @return A data frame of assignment submissions for the specified course and assignment.
#' @export
get_assignment_submissions <- function(canvas, course_id, assignment_id = NULL, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/students/submissions?per_page=", per_page)

  # Append the assignment_id if provided
  if (!is.null(assignment_id)) {
    url <- paste0(url, "&assignment_id=", assignment_id)
  }

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve assignment submissions. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  submissions <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    tidyr::unnest(names_sep = ".")

  # Return the data frame of submissions
  return(submissions)
}
