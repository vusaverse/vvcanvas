#' Get list of active courses in an account
#'
#' This function retrieves the list of active courses within a specific account in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param account_id The ID of the account for which to retrieve courses.
#' @param per_page (Optional) The number of courses to retrieve per page of results (default is 100).
#' @param enrollment_type (Optional) Filter by enrollment type (e.g., "student", "teacher", "ta", "observer", "designer").
#' @param published (Optional) Filter by published status. TRUE for published courses, FALSE for unpublished.
#' @param completed (Optional) Filter by completed status. TRUE for completed courses, FALSE for active courses.
#' @param blueprint (Optional) Filter by blueprint status. TRUE for blueprint courses, FALSE for regular courses.
#' @param blueprint_associated (Optional) Filter by blueprint association. TRUE for courses associated with a blueprint.
#' @param state (Optional) Filter by workflow state ("created", "claimed", "available", "completed", "deleted").
#'
#' @return A data frame of active courses in the specified account.
#' @export
#'
get_account_courses <- function(canvas, account_id, per_page = 100, enrollment_type = NULL, 
                               published = NULL, completed = NULL, blueprint = NULL, 
                               blueprint_associated = NULL, state = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/accounts/", account_id, "/courses")
  
  # Build query parameters
  params <- list(per_page = per_page)
  
  if (!is.null(enrollment_type)) {
    params$enrollment_type <- enrollment_type
  }
  if (!is.null(published)) {
    params$published <- published
  }
  if (!is.null(completed)) {
    params$completed <- completed
  }
  if (!is.null(blueprint)) {
    params$blueprint <- blueprint
  }
  if (!is.null(blueprint_associated)) {
    params$blueprint_associated <- blueprint_associated
  }
  if (!is.null(state)) {
    params$state <- state
  }
  
  # Make the API request
  response <- httr::GET(url, 
                       query = params,
                       httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve account courses. Please check your authentication and API endpoint.")
  }

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  courses_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  courses <- dplyr::bind_rows(courses_list) %>%
    dplyr::mutate(account_id = account_id)

  # Return the courses data frame
  return(courses)
}