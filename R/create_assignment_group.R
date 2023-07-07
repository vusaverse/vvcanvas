#' Create an Assignment Group in Canvas LMS
#'
#' Creates a new assignment group in a specific course using the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course in which to create the assignment group.
#' @param group_name The name of the assignment group.
#' @param group_position The position of the assignment group in the course (optional).
#'
#' @return A confirmation message that the assignment group has been created.
#' @export
#'
create_assignment_group <- function(canvas, course_id, group_name, group_position = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/assignment_groups")

  # Create the request payload
  payload <- list(
    "name" = group_name,
    "position" = group_position
  )

  # Make the API request
  response <- httr::POST(url,
                         httr::add_headers(Authorization = paste("Bearer", canvas$api_key)),
                         body = payload,
                         encode = "json")

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to create assignment group. Please check your authentication and API endpoint.")
  }

  # Return a confirmation message
  return("The assignment group has been created.")
}
