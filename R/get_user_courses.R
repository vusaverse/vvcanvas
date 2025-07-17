#' Get list of courses for a user
#'
#' This function retrieves the list of courses that a specific user is enrolled in from the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param user_id The ID of the user for which to retrieve courses.
#' @param per_page (Optional) The number of courses to retrieve per page of results (default is 100).
#' @param enrollment_type (Optional) Filter by enrollment type ("student", "teacher", "ta", "observer", "designer").
#' @param enrollment_role (Optional) Filter by enrollment role.
#' @param enrollment_role_id (Optional) Filter by enrollment role ID.
#' @param enrollment_state (Optional) Filter by enrollment state ("active", "invited", "creation_pending", "deleted", "rejected", "completed", "inactive").
#' @param include (Optional) Include additional data. Options: "needs_grading_count", "syllabus_body", "public_description", "total_scores", "current_grading_period_scores", "term", "course_progress", "sections", "storage_quota_used_mb", "total_students", "passback_status", "favorites", "teachers", "observed_users", "tabs".
#'
#' @return A data frame of courses for the specified user.
#' @export
#'
get_user_courses <- function(canvas, user_id, per_page = 100, enrollment_type = NULL, 
                            enrollment_role = NULL, enrollment_role_id = NULL, 
                            enrollment_state = NULL, include = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/users/", user_id, "/courses")
  
  # Build query parameters
  params <- list(per_page = per_page)
  
  if (!is.null(enrollment_type)) {
    params$enrollment_type <- enrollment_type
  }
  if (!is.null(enrollment_role)) {
    params$enrollment_role <- enrollment_role
  }
  if (!is.null(enrollment_role_id)) {
    params$enrollment_role_id <- enrollment_role_id
  }
  if (!is.null(enrollment_state)) {
    params$enrollment_state <- enrollment_state
  }
  if (!is.null(include)) {
    params$include <- include
  }
  
  # Make the API request
  response <- httr::GET(url, 
                       query = params,
                       httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve user courses. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  courses <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    as.data.frame() %>%
    dplyr::mutate(user_id = user_id)

  # Return the courses data frame
  return(courses)
}