#' Get details of a single account
#'
#' This function retrieves detailed information about a specific account in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param account_id The ID of the account to retrieve details for.
#'
#' @return A data frame containing account details.
#' @export
#'
get_account_details <- function(canvas, account_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/accounts/", account_id)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve account details. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  account_data <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    as.data.frame()

  # Return the account details
  return(account_data)
}