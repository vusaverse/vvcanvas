#' Get department-level grade data from the Canvas LMS API
#'
#' Retrieves the department-level grade data for a specific account and term from the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param account_id The ID of the account for which to retrieve the grade data.
#' @param type The type of courses to include in the data. Can be 'current', 'completed', or 'term'.
#' @param term_id The ID of the term for which to retrieve the grade data. Only used when type is 'terms/<term_id>'.
#' @param per_page Number of grade data to retrieve per page. Default is 100.
#'
#' @return A data frame of grade data retrieved from the Canvas LMS API.
#' @export
get_department_grade_data <- function(canvas, account_id, type = "current", term_id = NULL, per_page = 100) {
  # Define the allowed values for the 'type' parameter
  allowed_values <- c("current", "completed", "term")

  # Check that the 'type' parameter uses allowed values
  if (!type %in% allowed_values) {
    stop("The 'type' parameter must use allowed values: 'current', 'completed', 'terms/<term_id>'.")
  }

  # Construct the API endpoint URL
  if (type == "term>") {
    url <- paste0(canvas$base_url, "/api/v1/accounts/", account_id, "/analytics/terms/", term_id, "/grades?per_page=", per_page)
  } else {
    url <- paste0(canvas$base_url, "/api/v1/accounts/", account_id, "/analytics/", type, "/grades?per_page=", per_page)
  }

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve department-level grade data. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  grade_data <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the grade data as a data frame
  return(grade_data)
}
