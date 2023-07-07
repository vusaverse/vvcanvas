#' Create a Course Section in Canvas LMS
#'
#' Creates a new course section in a specific course using the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course in which to create the section.
#' @param section_name The name of the section.
#' @param section_start_date (Optional) The start date of the section.
#' @param section_end_date (Optional) The end date of the section.
#'
#' @return A confirmation message that the section has been created.
#' @export
#'
create_course_section <- function(canvas, course_id, section_name, section_start_date = NULL, section_end_date = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/sections")

  # Create the request payload
  payload <- list(
    "course_section" = list(
      "name" = section_name,
      "start_at" = section_start_date,
      "end_at" = section_end_date
    )
  )

  # Make the API request
  response <- httr::POST(url,
                         httr::add_headers(Authorization = paste("Bearer", canvas$api_key)),
                         body = payload,
                         encode = "json")

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to create course section. Please check your authentication and API endpoint.")
  }

  # Return a confirmation message
  return("The course section has been created.")
}
