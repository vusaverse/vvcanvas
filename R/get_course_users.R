#' Retrieves the users in a course.
#'
#' This function retrieves the users enrolled in a specific course in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to fetch the users.
#' @param per_page The number of entries to show per page.
#' @param include Optional parameters to include in the response. Possible values: "enrollments", "locked", "avatar_url", "test_student", "bio", "custom_links", "current_grading_period_scores", "uuid".
#'
#' @return A data frame containing the users in the specified course.
#' @export
#'
get_course_users <- function(canvas, course_id, per_page = 100, include = c("enrollments", "locked", "avatar_url", "test_student", "bio", "custom_links", "current_grading_period_scores", "uuid")) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/users?per_page=", per_page)

  # Add the include parameters to the URL
  if (length(include) > 0) {
    url <- paste0(url, "&include[]=", paste(include, collapse = "&include[]="))
  }

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  users_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  users <- dplyr::bind_rows(users_list) %>%
    dplyr::mutate(course_id = course_id)

  # Return the list of users
  return(users)
}
