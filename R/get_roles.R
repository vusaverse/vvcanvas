#' Retrieve Roles for a Canvas Account
#'
#' This function retrieves a paginated list of the roles available to a specific account in the Canvas LMS system.
#'
#' @param canvas A list containing the base URL and API key for the Canvas LMS instance.
#' @param account_id The ID of the account for which you want to retrieve the roles.
#' @param per_page The number of roles to retrieve per page (default is 100).
#'
#' @return A data frame containing the roles available to the specified account.
#'
#'
#' @export
get_roles <- function(canvas, account_id, per_page = 100) {
  url <- paste0(canvas$base_url, "/api/v1/accounts/", account_id, "/roles?per_page=", per_page)
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve roles. Please check your authentication and API endpoint.")
  }

  roles <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  return(roles)
}
