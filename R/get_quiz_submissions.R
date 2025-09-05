#' Retrieves quiz submissions.
#'
#' This function retrieves the submissions to a specific quiz in a specific course in the Canvas
#' LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the
#' `canvas_authenticate` function.
#' @param course_id The ID of the course for which to fetch submissions.
#' @param quiz_id The ID of the quiz for which to fetch the submissions.
#'
#' @return A data frame containing the submission data.
#' @seealso [get_assignment_submissions()]
#' @export
get_quiz_submissions <- function(canvas, course_id, quiz_id) {
  # Construct the API endpoint URL
  url <- paste0(
    canvas$base_url, "/api/v1/courses/", course_id, "/quizzes/",
    quiz_id, "/submissions?per_page=100"
  )

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste(
    "Bearer",
    canvas$api_key
  )))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve quiz submissions. Please check your authentication and API
    endpoint.")
  }

  responses <- paginate(response, canvas$api_key)

  submissions_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      magrittr::extract2(1) %>%
      as.data.frame()
  })
  submissions <- dplyr::bind_rows(submissions_list)

  return(submissions)
}
