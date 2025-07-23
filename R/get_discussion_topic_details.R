#' Get details of a single discussion topic
#'
#' This function retrieves detailed information about a specific discussion topic in a course from the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course containing the discussion topic.
#' @param topic_id The ID of the discussion topic to retrieve details for.
#' @param include (Optional) Include additional data. Options: "all_dates", "sections", "sections_user_count", "overrides".
#'
#' @return A data frame containing discussion topic details.
#' @export
#'
get_discussion_topic_details <- function(canvas, course_id, topic_id, include = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/discussion_topics/", topic_id)
  
  # Build query parameters
  params <- list()
  
  if (!is.null(include)) {
    params$include <- include
  }
  
  # Make the API request
  response <- httr::GET(url, 
                       query = params,
                       httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve discussion topic details. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  topic_data <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    as.data.frame() %>%
    dplyr::mutate(course_id = course_id)

  # Return the topic details
  return(topic_data)
}