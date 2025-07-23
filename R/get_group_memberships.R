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

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  memberships_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })
  memberships <- dplyr::bind_rows(memberships_list)

  # Return the data frame of memberships
  return(memberships)
}
