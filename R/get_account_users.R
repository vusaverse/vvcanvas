#' Get list of users in an account
#'
#' This function retrieves the list of users within a specific account in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param account_id The ID of the account for which to retrieve users.
#' @param per_page (Optional) The number of users to retrieve per page of results (default is 100).
#' @param search_term (Optional) Search term to filter users by name, login ID, or email.
#' @param enrollment_type (Optional) Filter by enrollment type ("student", "teacher", "ta", "observer", "designer").
#' @param sort (Optional) Sort results by "username", "email", "sis_id", or "last_login".
#' @param order (Optional) Sort order ("asc" or "desc").
#'
#' @return A data frame of users in the specified account.
#' @export
#'
get_account_users <- function(canvas, account_id, per_page = 100, search_term = NULL, 
                             enrollment_type = NULL, sort = NULL, order = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/accounts/", account_id, "/users")
  
  # Build query parameters
  params <- list(per_page = per_page)
  
  if (!is.null(search_term)) {
    params$search_term <- search_term
  }
  if (!is.null(enrollment_type)) {
    params$enrollment_type <- enrollment_type
  }
  if (!is.null(sort)) {
    params$sort <- sort
  }
  if (!is.null(order)) {
    params$order <- order
  }
  
  # Make the API request
  response <- httr::GET(url, 
                       query = params,
                       httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve account users. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  users <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    as.data.frame() %>%
    dplyr::mutate(account_id = account_id)

  # Return the users data frame
  return(users)
}