#' Retrieves a paginated list of all courses visible in the public index.
#'
#' This function retrieves a paginated list of all courses visible in the public index
#' using the Canvas LMS API.
#' *NOTE* This function might take a while to finish.
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param per_page (Optional) The number of courses to retrieve per page of results (default is 100).
#'
#' @return A data frame of courses visible in the public index.
#' @export
get_all_courses <- function(canvas, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/search/all_courses?per_page=", per_page)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  courses_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  all_courses <- dplyr::bind_rows(courses_list)

  # Return the data frame of courses
  return(all_courses)
}
