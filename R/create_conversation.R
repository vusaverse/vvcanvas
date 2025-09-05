#' Creates a new conversation with one or more recipients.
#'
#' Canvas allows for an e-mail like communication with students, called 'conversations', which can
#' be handled
#' from the API.
#'
#' Note that the user should have rights to access the folder.
#'
#' @param canvas An object containing the Canvas API key and base URL,
#' @param recipients An array of recipient ids.
#' @param subject The subject of the conversation. Maximum length is 255 characters.
#' @param body The message to be sent. Unfortunately, Canvas only allows for plain text.
#' @param force_new logical. Forces a new message to be created, even if there is an
#' existing private conversation.
#' @param group_conversation logical. Defaults to `FALSE`. When false, individual private
#' conversations will be created with each recipient. If true, this will be a group
#' conversation (i.e. all recipients may see all messages and replies). Must be set true
#' if the number of recipients is over the set maximum (default is 100).
#' @param attachments An array of paths to local files that should be uploaded.
#' @param attachment_ids An array of attachments ids. These must be files that have been previously
#'  uploaded to the sender's 'conversation attachments' folder.
#' @param media_comment_id Media comment id of an audio or video file to be associated with this
#' message.
#' @param media_comment_type Type of the associated media file, values allowed are `audio` or
#' `video`.
#' @param mode Determines whether the messages will be created/sent synchronously or
#' asynchronously. Defaults to `sync`.
#' @param scope Used when generating 'visible' in the API response, values allowed are `unread`,
#' `starred`, `archived`.
#' @param filter Used when generating 'visible' in the API response.
#' @param filter_mode Used when generating 'visible' in the API response, values allowed are `and`, `or`
#'  (default).
#' @param context_code The course or group that is the context for this conversation. Same format
#' as courses or groups in the recipients argument.
#' @return A confirmation message indicating that the message has been successfully send.
#' @seealso [get_single_conversation()] and [get_conversations()].
#' @export
create_conversation <- function(canvas, recipients = NULL, subject = " ", body = " ",
                                force_new = TRUE, group_conversation = FALSE, attachments = NULL,
                                attachment_ids = NULL, media_comment_id = NULL,
                                media_comment_type = NULL, mode = "sync", scope = NULL,
                                filter = NULL, filter_mode = NULL, context_code = NULL) {
  if (!is.null(attachments)) {
    folders <- get_user_folders(canvas)
    folder_id <- folders[folders$name == "conversation attachments", "id"]
    for (i in 1:length(attachments)) {
      response <- upload_folder_file(canvas, folder_id, attachments[i],
        generate_message = FALSE
      )
      attachment_ids <- c(attachment_ids, response$id)
    }
  }
  url <- paste0(canvas$base_url, "/api/v1/conversations")
  payload <- list(
    recipients, subject, body, force_new, group_conversation, attachment_ids,
    media_comment_id, media_comment_type, mode, scope, filter, filter_mode, context_code
  )
  names(payload) <- c(
    "recipients[]", "subject", "body", "force_new", "group_conversation",
    "attachment_ids[]", "media_comment_id", "media_comment_type", "mode", "scope", "filter[]",
    "filter_mode", "context_code"
  )
  response <- httr::POST(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)), body = payload, encode = "multipart")
  if (httr::status_code(response) != 201) {
    stop("Failed to create conversation. Please check your authentication and API endpoint.")
  }
  return("The message has been send.")
}
