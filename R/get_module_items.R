#' Retrieves the items within a specific module.
#'
#' This function retrieves the items within a specific module of a course in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course containing the module.
#' @param module_id The ID of the module for which to fetch the items.
#'
#' @return A list of items within the specified module.
#' @export
#'
get_module_items <- function(canvas, course_id, module_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/modules/", module_id, "/items")

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  items_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  items <- dplyr::bind_rows(items_list)

  # Return the list of items
  return(items)
}
