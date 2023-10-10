#' Get user-in-a-course-level participation data from the Canvas LMS API
#'
#' Retrieves user-in-a-course-level participation data for a specific course and student from the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course for which to retrieve the participation data.
#' @param student_id The ID of the student for which to retrieve the participation data.
#'
#' @return A list of user-in-a-course-level participation data retrieved from the Canvas LMS API.
#' @export
get_user_course_participation_data <- function(canvas, course_id, student_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/analytics/users/", student_id, "/activity")

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve user-in-a-course-level participation data. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  participation_data <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the participation data
  return(participation_data)
}
