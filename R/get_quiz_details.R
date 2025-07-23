#' Get details of a single quiz
#'
#' This function retrieves detailed information about a specific quiz in a course from the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course containing the quiz.
#' @param quiz_id The ID of the quiz to retrieve details for.
#'
#' @return A data frame containing quiz details.
#' @export
#'
get_quiz_details <- function(canvas, course_id, quiz_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/quizzes/", quiz_id)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve quiz details. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  quiz_data <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    as.data.frame() %>%
    dplyr::mutate(course_id = course_id)

  # Return the quiz details
  return(quiz_data)
}