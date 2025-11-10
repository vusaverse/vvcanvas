# Creates a new conversation with one or more recipients.

Canvas allows for an e-mail like communication with students, called
'conversations', which can be handled from the API.

## Usage

``` r
create_conversation(
  canvas,
  recipients = NULL,
  subject = " ",
  body = " ",
  force_new = TRUE,
  group_conversation = FALSE,
  attachments = NULL,
  attachment_ids = NULL,
  media_comment_id = NULL,
  media_comment_type = NULL,
  mode = "sync",
  scope = NULL,
  filter = NULL,
  filter_mode = NULL,
  context_code = NULL
)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL,

- recipients:

  An array of recipient ids.

- subject:

  The subject of the conversation. Maximum length is 255 characters.

- body:

  The message to be sent. Unfortunately, Canvas only allows for plain
  text.

- force_new:

  logical. Forces a new message to be created, even if there is an
  existing private conversation.

- group_conversation:

  logical. Defaults to `FALSE`. When false, individual private
  conversations will be created with each recipient. If true, this will
  be a group conversation (i.e. all recipients may see all messages and
  replies). Must be set true if the number of recipients is over the set
  maximum (default is 100).

- attachments:

  An array of paths to local files that should be uploaded.

- attachment_ids:

  An array of attachments ids. These must be files that have been
  previously uploaded to the sender's 'conversation attachments' folder.

- media_comment_id:

  Media comment id of an audio or video file to be associated with this
  message.

- media_comment_type:

  Type of the associated media file, values allowed are `audio` or
  `video`.

- mode:

  Determines whether the messages will be created/sent synchronously or
  asynchronously. Defaults to `sync`.

- scope:

  Used when generating 'visible' in the API response, values allowed are
  `unread`, `starred`, `archived`.

- filter:

  Used when generating 'visible' in the API response.

- filter_mode:

  Used when generating 'visible' in the API response, values allowed are
  `and`, `or` (default).

- context_code:

  The course or group that is the context for this conversation. Same
  format as courses or groups in the recipients argument.

## Value

A confirmation message indicating that the message has been successfully
send.

## Details

Note that the user should have rights to access the folder.

## See also

[`get_single_conversation()`](https://vusaverse.github.io/vvcanvas/reference/get_single_conversation.md)
and
[`get_conversations()`](https://vusaverse.github.io/vvcanvas/reference/get_conversations.md).
