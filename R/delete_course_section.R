#' Delete a Course Section in Canvas LMS
#'
#' Deletes an existing course section using the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param section_id The ID of the section to delete.
#'
#' @return A confirmation message that the section has been deleted.
#' @export
#'
delete_course_section <- function(canvas, section_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/sections/", section_id)

  # Make the API request
  response <- httr::DELETE(
    url,
    httr::add_headers(Authorization = paste("Bearer", canvas$api_key))
  )

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to delete course section. Please check your authentication and API endpoint.")
  }

  # Return a confirmation message
  return("The course section has been deleted.")
}
