#' Get list of enrollments for a user
#'
#' This function retrieves the list of enrollments for a specific user from the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param user_id The ID of the user for which to retrieve enrollments.
#' @param per_page (Optional) The number of enrollments to retrieve per page of results (default is 100).
#' @param type (Optional) Filter by enrollment type ("StudentEnrollment", "TeacherEnrollment", "TaEnrollment", "DesignerEnrollment", "ObserverEnrollment").
#' @param role (Optional) Filter by enrollment role.
#' @param role_id (Optional) Filter by enrollment role ID.
#' @param state (Optional) Filter by enrollment state ("active", "invited", "creation_pending", "deleted", "rejected", "completed", "inactive").
#' @param include (Optional) Include additional data. Options: "avatar_url", "group_ids", "locked", "observed_users", "can_be_removed", "uuid", "current_points".
#'
#' @return A data frame of enrollments for the specified user.
#' @export
#'
get_user_enrollments <- function(canvas, user_id, per_page = 100, type = NULL, 
                                role = NULL, role_id = NULL, state = NULL, include = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/users/", user_id, "/enrollments")
  
  # Build query parameters
  params <- list(per_page = per_page)
  
  if (!is.null(type)) {
    params$type <- type
  }
  if (!is.null(role)) {
    params$role <- role
  }
  if (!is.null(role_id)) {
    params$role_id <- role_id
  }
  if (!is.null(state)) {
    params$state <- state
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
    stop("Failed to retrieve user enrollments. Please check your authentication and API endpoint.")
  }

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  enrollments_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  enrollments <- dplyr::bind_rows(enrollments_list) %>%
    dplyr::mutate(user_id = user_id)

  # Return the enrollments data frame
  return(enrollments)
}