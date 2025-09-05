#' Get Favorite Courses in Canvas LMS
#'
#' Retrieves the data of favorite courses for the authenticated user using the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param exclude_blueprint_courses When set, only return courses that are not configured as blueprint courses (optional).
#'
#' @return The dataframe of favorite courses.
#' @export
#'
get_favorite_courses <- function(canvas, exclude_blueprint_courses = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/users/self/favorites/courses")

  # Add the query parameter to the URL
  if (!is.null(exclude_blueprint_courses)) {
    url <- httr::modify_url(url, query = list(exclude_blueprint_courses = exclude_blueprint_courses))
  }

  # Make the API request
  response <- httr::GET(
    url,
    httr::add_headers(Authorization = paste("Bearer", canvas$api_key))
  )

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve favorite courses. Please check your authentication and API endpoint.")
  }

  # Parse the response
  favorite_courses <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the list of favorite courses
  return(favorite_courses)
}
