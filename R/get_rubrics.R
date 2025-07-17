#' Get Rubrics from Canvas LMS API
#'
#' Fetches a list of rubrics within a specific course from the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course for which to retrieve the rubrics.
#' @param per_page Number of rubrics to retrieve per page. Default is 100.
#'
#' @return A list of rubrics retrieved from the Canvas LMS API.
#' @export
#'
get_rubrics <- function(canvas, course_id, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/rubrics?per_page=", per_page)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve rubrics. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  rubrics <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the list of rubrics
  return(rubrics)
}