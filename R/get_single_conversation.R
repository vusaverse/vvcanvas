#' Retrieves a single conversation.
#'
#' This function retrieves all details concerning a specific conversation.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the
#' `canvas_authenticate` function.
#' @param conversation_id The id of the specific conversation.
#'
#' @return Returns information for a specific conversation for the current user. Response includes
#' all fields that are present in the list/index action as well as messages and extended
#' participant information.
#' @seealso [get_conversations()] and [create_conversation()].
#' @export
get_single_conversation <- function(canvas, conversation_id) {
  url <- paste0(canvas$base_url, "/api/v1/conversations/", conversation_id)
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve conversation. Please check your authentication and API endpoint.")
  }
  conversation <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)
  return(conversation)
}
