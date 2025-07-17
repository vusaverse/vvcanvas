#' Get list of available reports for an account
#'
#' This function retrieves the list of available reports for a specific account from the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param account_id The ID of the account for which to retrieve available reports.
#' @param per_page (Optional) The number of reports to retrieve per page of results (default is 100).
#'
#' @return A data frame containing available reports for the specified account.
#' @export
#'
get_available_reports <- function(canvas, account_id, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/accounts/", account_id, "/reports")
  
  # Build query parameters
  params <- list(per_page = per_page)
  
  # Make the API request
  response <- httr::GET(url, 
                       query = params,
                       httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve available reports. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  reports <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    as.data.frame() %>%
    dplyr::mutate(account_id = account_id)

  # Return the reports data frame
  return(reports)
}