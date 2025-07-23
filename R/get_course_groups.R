#' Retrieves the list of groups in a course.
#'
#' This function retrieves the list of groups in a specific course in the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course for which to fetch the groups.
#' @param per_page (Optional) The number of groups to retrieve per page of results (default is 100).
#'
#' @return A data frame of groups in the specified course.
#' @export
#'
get_course_groups <- function(canvas, course_id, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/groups?per_page=", per_page)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  groups_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  groups <- dplyr::bind_rows(groups_list)

  # Return the data frame of groups
  return(groups)
}
