#' Retrieves the list of groups in a course.
#'
#' This function retrieves the list of groups in a specific course in the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course for which to fetch the groups.
#' @param per_page (Optional) The number of groups to retrieve per page of results (default is 100).
#'
#' @return A data frame of groups in the specified course.
#' @export
#'
get_course_groups <- function(canvas, course_id, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/groups?per_page=", per_page)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve course groups. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  groups <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the data frame of groups
  return(groups)
}
