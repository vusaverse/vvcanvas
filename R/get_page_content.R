#' Retrieves the content body of a specified page.
#'
#' This function retrieves the content body of a specified page within a course in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course to which the page belongs.
#' @param page_id The ID of the page for which to fetch the content body.
#'
#' @return The content body of the specified page.
#' @export
#'
get_page_content <- function(canvas, course_id, page_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/pages/", page_id)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve page content. Please check your authentication and API endpoint.")
  }

  # Extract the content body from the response
  content_body <- httr::content(response)$body

  # Convert the content body from HTML to plain text
  content_body <- htm2txt::htm2txt(content_body)

  # Return the content body
  return(content_body)
}
