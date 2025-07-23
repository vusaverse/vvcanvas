#' Get discussion topic entries
#'
#' This function retrieves the entries (posts) for a specific discussion topic in a course from the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course containing the discussion topic.
#' @param topic_id The ID of the discussion topic for which to retrieve entries.
#' @param per_page (Optional) The number of entries to retrieve per page of results (default is 100).
#' @param sort_by (Optional) Sort entries by "date" or "rating".
#' @param order (Optional) Sort order ("asc" or "desc").
#'
#' @return A data frame containing discussion topic entries.
#' @export
#'
get_discussion_topic_entries <- function(canvas, course_id, topic_id, per_page = 100, 
                                        sort_by = NULL, order = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/discussion_topics/", topic_id, "/entries")
  
  # Build query parameters
  params <- list(per_page = per_page)
  
  if (!is.null(sort_by)) {
    params$sort_by <- sort_by
  }
  if (!is.null(order)) {
    params$order <- order
  }
  
  # Make the API request
  response <- httr::GET(url, 
                       query = params,
                       httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve discussion topic entries. Please check your authentication and API endpoint.")
  }

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  entries_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  entries <- dplyr::bind_rows(entries_list) %>%
    dplyr::mutate(course_id = course_id, topic_id = topic_id)

  # Return the entries data frame
  return(entries)
}