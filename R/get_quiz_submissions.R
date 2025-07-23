#' Get quiz submissions for a course
#'
#' This function retrieves the list of quiz submissions for a specific quiz in a course from the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course containing the quiz.
#' @param quiz_id The ID of the quiz for which to retrieve submissions.
#' @param per_page (Optional) The number of submissions to retrieve per page of results (default is 100).
#' @param include (Optional) Include additional data. Options: "submission", "quiz", "user".
#'
#' @return A data frame containing quiz submissions for the specified quiz.
#' @export
#'
get_quiz_submissions <- function(canvas, course_id, quiz_id, per_page = 100, include = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/quizzes/", quiz_id, "/submissions")
  
  # Build query parameters
  params <- list(per_page = per_page)
  
  if (!is.null(include)) {
    params$include <- include
  }
  
  # Make the API request
  response <- httr::GET(url, 
                       query = params,
                       httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve quiz submissions. Please check your authentication and API endpoint.")
  }

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  submissions_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  submissions <- dplyr::bind_rows(submissions_list) %>%
    dplyr::mutate(course_id = course_id, quiz_id = quiz_id)

  # Return the submissions data frame
  return(submissions)
}