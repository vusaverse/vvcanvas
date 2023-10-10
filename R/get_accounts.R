#' Get a list of accounts from the Canvas LMS API
#'
#' Retrieves a paginated list of accounts that the current user can view or manage.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param include A vector of additional information to include. Default is NULL.
#' @param per_page Number of accounts to retrieve per page. Default is 100.
#'
#' @return A list of accounts retrieved from the Canvas LMS API.
#' @export
get_accounts <- function(canvas, include = NULL, per_page = 100) {
  # Define the legal values for the 'include' parameter
  legal_values <- c("lti_guid", "registration_settings", "services")

  # Check that the 'include' parameter uses legal values
  if (!is.null(include)) {
    if (any(!include %in% legal_values)) {
      stop("The 'include' parameter must use legal values: 'lti_guid', 'registration_settings', 'services'.")
    }
  }

  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/accounts?per_page=", per_page)

  # Add the 'include' parameter to the URL if it's not NULL
  if (!is.null(include)) {
    url <- paste0(url, "&include[]=", paste(include, collapse = "&include[]="))
  }

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve the list of accounts. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  accounts <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the list of accounts
  return(accounts)
}
