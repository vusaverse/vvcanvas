#' Get activity stream for a course
#'
#' This function retrieves the activity stream for a specific course from the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to retrieve the activity stream.
#' @param per_page (Optional) The number of activity items to retrieve per page of results (default is 100).
#' @param only_active_courses (Optional) If TRUE, only include activities from active courses.
#'
#' @return A data frame containing the activity stream for the specified course.
#' @export
#'
get_course_activity_stream <- function(canvas, course_id, per_page = 100, only_active_courses = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/activity_stream")
  
  # Build query parameters
  params <- list(per_page = per_page)
  
  if (!is.null(only_active_courses)) {
    params$only_active_courses <- only_active_courses
  }
  
  # Make the API request
  response <- httr::GET(url, 
                       query = params,
                       httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve course activity stream. Please check your authentication and API endpoint.")
  }

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  activity_stream_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  activity_stream <- dplyr::bind_rows(activity_stream_list) %>%
    dplyr::mutate(course_id = course_id)

  # Return the activity stream data frame
  return(activity_stream)
}