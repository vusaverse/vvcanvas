#' Create a Group Category in Canvas LMS
#'
#' Creates a new group category in a specific course using the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course in which to create the group category.
#' @param category_name The name of the group category.
#' @param allow_self_signup (Optional) Whether to allow self-signup for groups in the category. Defaults to FALSE.
#'
#' @return A confirmation message that the group category has been created.
#' @export
#'
create_group_category <- function(canvas, course_id, category_name, allow_self_signup = FALSE) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/group_categories")

  # Create the request payload
  payload <- list(
    "name" = category_name,
    "self_signup" = allow_self_signup
  )

  # Make the API request
  response <- httr::POST(url,
                         httr::add_headers(Authorization = paste("Bearer", canvas$api_key)),
                         body = payload,
                         encode = "json")

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to create group category. Please check your authentication and API endpoint.")
  }

  # Return a confirmation message
  return("The group category has been created.")
}
