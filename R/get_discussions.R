#' Retrieves the discussion topics within a course.
#'
#' This function retrieves the discussion topics within a specific course in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to fetch the discussion topics.
#' @param per_page The number of entries to show
#'
#' @return A list of discussion topics within the specified course.
#' @export
#'
get_discussions <- function(canvas, course_id, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/discussion_topics?per_page=", per_page)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve discussion topics. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  discussions <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the list of discussion topics
  return(discussions)
}
