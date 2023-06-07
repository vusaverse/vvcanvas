#' Retrieves course sections.
#'
#' This function retrieves a list of sections for a specific course in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to retrieve sections.
#' @param per_page (Optional) The number of sections to retrieve per page of results (default is 100).
#'
#' @return A data frame of course sections.
#' @export
#'
get_course_sections <- function(canvas, course_id, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/sections?per_page=", per_page)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve course sections. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  sections <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the data frame of sections
  return(sections)
}
