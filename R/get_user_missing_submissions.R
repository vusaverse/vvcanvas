#' Get list of missing submissions for a user
#'
#' This function retrieves the list of missing submissions for a specific user from the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param user_id The ID of the user for which to retrieve missing submissions.
#' @param per_page (Optional) The number of missing submissions to retrieve per page of results (default is 100).
#' @param include (Optional) Include additional data. Options: "course", "assignment".
#' @param filter (Optional) Filter results. Options: "submittable" (only assignments that can be submitted).
#' @param course_ids (Optional) Restrict results to specific course IDs (vector of course IDs).
#'
#' @return A data frame of missing submissions for the specified user.
#' @export
#'
get_user_missing_submissions <- function(canvas, user_id, per_page = 100, include = NULL, 
                                        filter = NULL, course_ids = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/users/", user_id, "/missing_submissions")
  
  # Build query parameters
  params <- list(per_page = per_page)
  
  if (!is.null(include)) {
    params$include <- include
  }
  if (!is.null(filter)) {
    params$filter <- filter
  }
  if (!is.null(course_ids)) {
    params$course_ids <- course_ids
  }
  
  # Make the API request
  response <- httr::GET(url, 
                       query = params,
                       httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve user missing submissions. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  missing_submissions <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    as.data.frame() %>%
    dplyr::mutate(user_id = user_id)

  # Return the missing submissions data frame
  return(missing_submissions)
}