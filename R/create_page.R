#' Create a Page in Canvas LMS
#'
#' Creates a new page in a specific course using the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course in which to create the page.
#' @param page_title The title of the page.
#' @param page_body The body/content of the page.
#' @param published (Optional) Whether the page should be published. Defaults to FALSE.
#'
#' @return A confirmation message that the page has been created.
#' @export
#'
create_page <- function(canvas, course_id, page_title, page_body, published = FALSE) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/pages")

  # Create the request payload
  payload <- list(
    "wiki_page" = list(
      "title" = page_title,
      "body" = page_body,
      "published" = published
    )
  )

  # Make the API request
  response <- httr::POST(url,
                         httr::add_headers(Authorization = paste("Bearer", canvas$api_key)),
                         body = payload,
                         encode = "json")

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to create page. Please check your authentication and API endpoint.")
  }

  # Return a confirmation message
  return("The page has been created.")
}
