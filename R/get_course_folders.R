#' Retrieves course folders.
#'
#' This function retrieves a list of folders for a specific course in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to retrieve folders.
#' @param per_page Number of courses to retrieve per page. Default is 100.
#'
#' @return A data frame of course folders.
#' @export
#'
get_course_folders <- function(canvas, course_id, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/folders?per_page=", per_page)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  folders_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  folders <- dplyr::bind_rows(folders_list) %>%
    dplyr::mutate(course_id = course_id)

  # Return the data frame of folders
  return(folders)
}
