#' Post a New Discussion in Canvas LMS
#'
#' Creates a new discussion topic in a specific course using the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course in which to create the discussion.
#' @param discussion_title The title of the discussion topic.
#' @param discussion_message The initial message content of the discussion topic.
#' @param discussion_is_announcement (Optional) Whether the discussion should be an announcement. Defaults to FALSE.
#'
#' @return A confirmation message that the discussion has been created.
#' @export
#'
post_new_discussion <- function(canvas, course_id, discussion_title, discussion_message, discussion_is_announcement = FALSE) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/discussion_topics")

  # Create the request payload
  payload <- list(
    "title" = discussion_title,
    "message" = discussion_message,
    "is_announcement" = discussion_is_announcement
  )

  # Make the API request
  response <- httr::POST(url,
                         httr::add_headers(Authorization = paste("Bearer", canvas$api_key)),
                         body = payload,
                         encode = "json")

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to post new discussion. Please check your authentication and API endpoint.")
  }

  # Return a confirmation message
  return("The discussion has been created.")
}
