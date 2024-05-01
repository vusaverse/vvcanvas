
#' Retrieves the media objects in a course.
#'
#' This function retrieves the media objects associated with a specific course in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to fetch the media objects.
#' @param per_page The number of entries to show per page.
#'
#' @return A data frame containing the media objects in the specified course.
#' @export
#'
get_course_media_objects <- function(canvas, course_id, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/media_objects?per_page=", per_page)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve course media objects. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  media_objects <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    as.data.frame() %>%
    dplyr::mutate(course_id = course_id)

  # Return the list of media objects
  return(media_objects)
}
