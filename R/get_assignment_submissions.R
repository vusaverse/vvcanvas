#' Retrieves assignment submissions.
#'
#' This function retrieves the submissions to a specific assignment in a specific course in the
#' Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to fetch submissions.
#' @param assignment_id The ID of the assignment for which to fetch the submissions.
#' @param per_page (Optional) The number of submissions to retrieve per page of results (default is 100).
#'
#' @return A data frame containing the submission data.
#' @export
get_assignment_submissions <- function (canvas, course_id, assignment_id, per_page = 100)
{
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/assignments/",
    assignment_id, "/submissions?per_page=", per_page)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve assignment submissions. Please check your authentication and API
    endpoint.")
  }

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  submissions_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    as.data.frame()
  })
  submissions <- dplyr::bind_rows(submissions_list)

  # Return the data frame of submissions
  return(submissions)
}
