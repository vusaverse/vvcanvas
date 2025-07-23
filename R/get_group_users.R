#' Get users in a group
#'
#' This function retrieves the users in a specific group in the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param group_id The ID of the group for which to retrieve the users.
#'
#' @return A data frame of users in the specified group.
#' @export
#'
get_group_users <- function(canvas, group_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/groups/", group_id, "/users")

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  users_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  users <- dplyr::bind_rows(users_list)

  # Return the data frame of users
  return(users)
}
