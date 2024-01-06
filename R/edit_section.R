#' Edit a Course Section in Canvas LMS
#'
#' Modifies an existing course section using the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param section_id The ID of the section to edit.
#' @param section_name The new name of the section (optional).
#' @param sis_section_id The new SIS ID of the section (optional).
#' @param integration_id The new integration ID of the section (optional).
#' @param section_start_date The new start date of the section (optional).
#' @param section_end_date The new end date of the section (optional).
#' @param restrict_enrollments_to_section_dates Whether to restrict user enrollments to the start and end dates of the section (optional).
#' @param override_sis_stickiness Whether to override SIS stickiness (optional).
#'
#' @return A confirmation message that the section has been edited.
#' @export
#'
edit_section <- function(canvas, section_id, section_name = NULL, sis_section_id = NULL, integration_id = NULL, section_start_date = NULL, section_end_date = NULL, restrict_enrollments_to_section_dates = NULL, override_sis_stickiness = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/sections/", section_id)

  # Create the request payload
  payload <- list()
  if (!is.null(section_name)) payload$course_section$name <- section_name
  if (!is.null(sis_section_id)) payload$course_section$sis_section_id <- sis_section_id
  if (!is.null(integration_id)) payload$course_section$integration_id <- integration_id
  if (!is.null(section_start_date)) payload$course_section$start_at <- section_start_date
  if (!is.null(section_end_date)) payload$course_section$end_at <- section_end_date
  if (!is.null(restrict_enrollments_to_section_dates)) payload$course_section$restrict_enrollments_to_section_dates <- restrict_enrollments_to_section_dates
  if (!is.null(override_sis_stickiness)) payload$override_sis_stickiness <- override_sis_stickiness

  # Make the API request
  response <- httr::PUT(url,
                        httr::add_headers(Authorization = paste("Bearer", canvas$api_key)),
                        body = payload,
                        encode = "json")

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to edit course section. Please check your authentication and API endpoint.")
  }

  # Return a confirmation message
  return("The course section has been edited.")
}
