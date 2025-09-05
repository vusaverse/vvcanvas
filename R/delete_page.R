#' Delete a Page in Canvas LMS
#'
#' Deletes a page in a specific course using the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course in which to delete the page.
#' @param page_id The ID of the page.
#'
#' @return A confirmation message that the page has been deleted.
#' @export
#'
delete_page <- function(canvas, course_id, page_id) {
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/pages/", page_id)
  response <- httr::DELETE(url, httr::add_headers(Authorization = paste(
    "Bearer",
    canvas$api_key
  )))
  if (httr::status_code(response) != 200) {
    stop("Failed to delete page. Please check your authentication and API endpoint.")
  }
  return("The page has been deleted.")
}
