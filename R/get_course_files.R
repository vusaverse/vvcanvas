#' Retrieves a list of files within a course.
#'
#' This function retrieves a list of files within a specific course in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to fetch the files.
#' @param per_page (Optional) The number of files to retrieve per page of results (default is 100).
#'
#' @return A data frame of files within the specified course.
#' @export
#'
get_course_files <- function(canvas, course_id, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/files?per_page=", per_page)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  files_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  files <- dplyr::bind_rows(files_list) %>%
    dplyr::mutate(course_id = course_id)

  # Return the data frame of files
  return(files)
}
