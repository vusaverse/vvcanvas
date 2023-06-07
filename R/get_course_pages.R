#' Retrieves the pages within a course.
#'
#' This function retrieves the pages within a specific course in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to fetch the pages.
#' @param per_page (Optional) The number of pages to retrieve per page of results (default is 50).
#'
#' @return A list of pages within the specified course.
#' @export
#'
#' @importFrom rlang .data
get_course_pages <- function(canvas, course_id, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/pages?per_page=", per_page)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve course pages. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  pages <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  pages <- pages %>%
    dplyr::mutate(page_body = purrr::map_chr(.data$page_id, ~get_page_content(canvas, course_id, .x)))

  # Return the list of pages
  return(pages)
}
