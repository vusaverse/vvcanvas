#' Get Assignments from Canvas LMS API
#'
#' Fetches a list of assignments within a specific course from the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course for which to retrieve the assignments.
#'
#' @return A list of assignments retrieved from the Canvas LMS API.
#' @export
#' @importFrom tidyr unnest
#'
get_assignments <- function(canvas, course_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/assignments")

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  assignments_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  assignments <- dplyr::bind_rows(assignments_list)

  # Return the list of assignments
  return(assignments)
}
