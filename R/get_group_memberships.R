#' Get group memberships
#'
#' This function retrieves the memberships for a specific group in the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param group_id The ID of the group for which to retrieve the memberships.
#'
#' @return A data frame of memberships in the specified group.
#' @export
#'
get_group_memberships <- function(canvas, group_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/groups/", group_id, "/memberships")

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve group memberships. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  memberships <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the data frame of memberships
  return(memberships)
}
