#' Get Account Rubrics from Canvas LMS API
#'
#' Fetches a list of rubrics within a specific account from the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param account_id The ID of the account for which to retrieve the rubrics.
#' @param per_page Number of rubrics to retrieve per page. Default is 100.
#'
#' @return A list of rubrics retrieved from the Canvas LMS API.
#' @export
#'
get_account_rubrics <- function(canvas, account_id, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/accounts/", account_id, "/rubrics?per_page=", per_page)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve account rubrics. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  rubrics <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the list of rubrics
  return(rubrics)
}