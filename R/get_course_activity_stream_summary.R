#' Get activity stream summary for a course
#'
#' This function retrieves the activity stream summary for a specific course from the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to retrieve the activity stream summary.
#' @param only_active_courses (Optional) If TRUE, only include activities from active courses.
#'
#' @return A data frame containing the activity stream summary for the specified course.
#' @export
#'
get_course_activity_stream_summary <- function(canvas, course_id, only_active_courses = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/activity_stream/summary")
  
  # Build query parameters
  params <- list()
  
  if (!is.null(only_active_courses)) {
    params$only_active_courses <- only_active_courses
  }
  
  # Make the API request
  response <- httr::GET(url, 
                       query = params,
                       httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve course activity stream summary. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  activity_summary <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    as.data.frame() %>%
    dplyr::mutate(course_id = course_id)

  # Return the activity summary data frame
  return(activity_summary)
}