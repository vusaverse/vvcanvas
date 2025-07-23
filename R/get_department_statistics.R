#' Get department-level statistics from the Canvas LMS API
#'
#' Retrieves department-level statistics for a specific account and term from the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param account_id The ID of the account for which to retrieve the statistics.
#' @param type The type of courses to include in the data. Can be 'current', 'completed', or 'term'.
#' @param term_id The ID of the term for which to retrieve the statistics. Only used when type is 'terms/<term_id>'.
#'
#' @return A list of department-level statistics retrieved from the Canvas LMS API.
#' @export
get_department_statistics <- function(canvas, account_id, type = "current", term_id = NULL) {
  # Define the allowed values for the 'type' parameter
  allowed_values <- c("current", "completed", "term")

  # Check that the 'type' parameter uses allowed values
  if (!type %in% allowed_values) {
    stop("The 'type' parameter must use allowed values: 'current', 'completed', 'term'.")
  }

  # Construct the API endpoint URL
  if (type == "term") {
    url <- paste0(canvas$base_url, "/api/v1/accounts/", account_id, "/analytics/terms/", term_id, "/statistics")
  } else {
    url <- paste0(canvas$base_url, "/api/v1/accounts/", account_id, "/analytics/", type, "/statistics")
  }

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  statistics_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  statistics <- dplyr::bind_rows(statistics_list)

  # Return the statistics
  return(statistics)
}
