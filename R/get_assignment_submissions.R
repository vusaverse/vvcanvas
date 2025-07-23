#' Lists assignment submissions for a course.
#'
#' This function retrieves a list of assignment submissions for a specific course in the Canvas LMS API.
#' If an assignment_id is provided, it will use the specific assignment endpoint. Otherwise, it will
#' attempt to get all submissions using the students/submissions endpoint, which may not be available
#' in all Canvas systems.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to list assignment submissions.
#' @param assignment_id (Optional) The ID of a specific assignment for which to list submissions. If provided, uses the more reliable assignment-specific endpoint.
#' @param per_page (Optional) The number of submissions to retrieve per page of results (default is 100).
#'
#' @return A data frame of assignment submissions for the specified course and assignment.
#' @export
get_assignment_submissions <- function(canvas, course_id, assignment_id = NULL, per_page = 100) {
  # If assignment_id is provided, use the specific assignment endpoint
  if (!is.null(assignment_id)) {
    # Use the new get_submissions function for specific assignment
    return(get_submissions(canvas, course_id, "assignments", assignment_id, per_page))
  } else {
    # For getting all submissions, try the students/submissions endpoint first
    # and fall back to iterating through assignments if it fails
    url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/students/submissions?per_page=", per_page)
    
      # Make the API request
      response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

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
