#' Get details of a single user
#'
#' This function retrieves detailed information about a specific user in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param user_id The ID of the user to retrieve details for.
#'
#' @return A data frame containing user details.
#' @export
#'
get_user_details <- function(canvas, user_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/users/", user_id)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve user details. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  user_data <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    as.data.frame()

  # Return the user details
  return(user_data)
}