#' Get course-level participation data from Canvas LMS API
#'
#' Fetches the participation data for a specific course from the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course for which to retrieve the participation data.
#'
#' @return The participation data for the specified course retrieved from the Canvas LMS API.
#' @export
#'
get_course_participation <- function(canvas, course_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/analytics/activity")

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve course participation data. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  participation_data <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the participation data
  return(participation_data)
}
