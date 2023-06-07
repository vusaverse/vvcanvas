#' Get Courses from Canvas LMS API
#'
#' Retrieves a list of courses from the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param per_page Number of courses to retrieve per page. Default is 100.
#'
#' @return A list of courses retrieved from the Canvas LMS API.
#' @export
#'
get_courses <- function(canvas, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses?per_page=", per_page)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve courses. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  courses <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the list of courses
  return(courses)
}


