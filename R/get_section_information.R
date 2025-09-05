#' Get Section Information in Canvas LMS
#'
#' Retrieves information about a specific course section using the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course.
#' @param section_id The ID of the section.
#'
#' @return The information about the section.
#' @export
#'
get_section_information <- function(canvas, course_id, section_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/sections/", section_id)

  # Make the API request
  response <- httr::GET(
    url,
    httr::add_headers(Authorization = paste("Bearer", canvas$api_key))
  )

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve section information. Please check your authentication and API endpoint.")
  }

  # Parse the response
  section_info <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    dplyr::bind_rows()

  # Return the section information
  return(section_info)
}
