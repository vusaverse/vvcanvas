#' Get submissions for assignments or quizzes
#'
#' This function retrieves submissions for assignments or quizzes from a specific course in the Canvas LMS API.
#' It can handle both assignment submissions and quiz submissions using the correct API endpoints.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to retrieve submissions.
#' @param type The type of submission to retrieve. Must be either "assignments" or "quizzes".
#' @param id The ID of the assignment or quiz for which to retrieve submissions.
#' @param per_page (Optional) The number of submissions to retrieve per page of results (default is 100).
#'
#' @return A data frame of submissions for the specified assignment or quiz.
#' @export
#'
get_submissions <- function(canvas, course_id, type, id, per_page = 100) {
  # Validate the type parameter
  if (!type %in% c("quizzes", "assignments")) {
    stop("type must be 'quizzes' or 'assignments'")
  }
  
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/", 
                type, "/", id, "/submissions?per_page=", per_page)
  
  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))
  
  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve submissions. Please check your authentication and API endpoint.")
  }
  
  # Parse the response as JSON
  content_text <- httr::content(response, "text", encoding = "UTF-8")
  
  if (type == "quizzes") {
    # For quizzes, the response structure is different - need to access the first element
    submissions <- jsonlite::fromJSON(content_text, flatten = TRUE)
    if (is.list(submissions) && length(submissions) > 0) {
      submissions <- submissions[[1]]
    }
  } else {
    # For assignments, parse normally
    submissions <- jsonlite::fromJSON(content_text, flatten = TRUE)
  }
  
  # Return the submissions data
  return(submissions)
}