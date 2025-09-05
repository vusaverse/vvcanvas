#' Retrieves conversations.
#'
#' This function retrieves all details concerning conversations of the user.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the
#' `canvas_authenticate` function.
#'
#' @return Returns a data frame containing the details of conversations for the current user, most
#' recent ones first.
#' @seealso [get_single_conversation()] and [create_conversation()].
#' @export
get_conversations <- function(canvas) {
  url <- paste0(canvas$base_url, "/api/v1/conversations/")
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve conversations. Please check your authentication and API endpoint.")
  }

  responses <- paginate(response, canvas$api_key)

  conversation_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame() %>%
      dplyr::select(c(
        "id", "subject", "workflow_state", "last_message",
        "last_message_at", "last_authored_message", "last_authored_message_at", "message_count",
        "subscribed", "private", "starred", "properties", "audience", "avatar_url", "participants",
        "visible", "context_code", "context_name"
      ))
  })

  conversations <- dplyr::bind_rows(conversation_list)

  return(conversations)
}
