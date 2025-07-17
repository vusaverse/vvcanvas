#' Get user activity stream
#'
#' This function retrieves the activity stream for a specific user from the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param user_id The ID of the user for which to retrieve the activity stream. Use "self" for the current user.
#' @param per_page (Optional) The number of activity items to retrieve per page of results (default is 100).
#' @param only_active_courses (Optional) If TRUE, only include activities from active courses.
#'
#' @return A data frame containing the user's activity stream.
#' @export
#'
get_user_activity_stream <- function(canvas, user_id = "self", per_page = 100, only_active_courses = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/users/", user_id, "/activity_stream")
  
  # Build query parameters
  params <- list(per_page = per_page)
  
  if (!is.null(only_active_courses)) {
    params$only_active_courses <- only_active_courses
  }
  
  # Make the API request
  response <- httr::GET(url, 
                       query = params,
                       httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve user activity stream. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  activity_stream <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    as.data.frame() %>%
    dplyr::mutate(user_id = user_id)

  # Return the activity stream data frame
  return(activity_stream)
}