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

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  media_objects_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  media_objects <- dplyr::bind_rows(media_objects_list) %>%
    dplyr::mutate(course_id = course_id)

  # Return the list of media objects
  return(media_objects)
}
