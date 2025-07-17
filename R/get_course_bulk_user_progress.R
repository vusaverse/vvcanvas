#' Get bulk user progress for a course
#'
#' This function retrieves the bulk user progress data for all students in a specific course from the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to retrieve bulk user progress.
#' @param per_page (Optional) The number of progress records to retrieve per page of results (default is 100).
#'
#' @return A data frame containing bulk user progress data for the specified course.
#' @export
#'
get_course_bulk_user_progress <- function(canvas, course_id, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/bulk_user_progress")
  
  # Build query parameters
  params <- list(per_page = per_page)
  
  # Make the API request
  response <- httr::GET(url, 
                       query = params,
                       httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve course bulk user progress. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  progress_data <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    as.data.frame() %>%
    dplyr::mutate(course_id = course_id)

  # Return the progress data frame
  return(progress_data)
}