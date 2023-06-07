#' Get Assignment Details from Canvas LMS API
#'
#' Retrieves detailed information about a specific assignment from the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course in which the assignment resides.
#' @param assignment_id The ID of the assignment for which to retrieve the details.
#'
#' @return A dataframe containing the detailed information about the assignment.
#' @export
#'
get_assignment_details <- function(canvas, course_id, assignment_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/assignments/", assignment_id)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve assignment details. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  assignment_details <- httr::content(response, "text", encoding = "UTF-8")

  # Return the assignment details as a list
  return(assignment_details)
}






