#' Get Single Account Rubric from Canvas LMS API
#'
#' Fetches a single rubric by ID from a specific account in the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param account_id The ID of the account containing the rubric.
#' @param rubric_id The ID of the rubric to retrieve.
#'
#' @return A rubric object retrieved from the Canvas LMS API.
#' @export
#'
get_account_rubric <- function(canvas, account_id, rubric_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/accounts/", account_id, "/rubrics/", rubric_id)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve account rubric. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  rubric <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the rubric
  return(rubric)
}