#' Get group categories for a context
#'
#' This function retrieves the group categories for a specific context (e.g., course) in the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course for which to retrieve the group categories.
#'
#' @return A data frame of group categories in the specified context.
#' @export
#'
get_group_categories <- function(canvas, course_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/group_categories")

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve group categories. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  group_categories <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the data frame of group categories
  return(group_categories)
}
