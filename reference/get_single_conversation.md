# Retrieves a single conversation.

This function retrieves all details concerning a specific conversation.

## Usage

``` r
get_single_conversation(canvas, conversation_id)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- conversation_id:

  The id of the specific conversation.

## Value

Returns information for a specific conversation for the current user.
Response includes all fields that are present in the list/index action
as well as messages and extended participant information.

## See also

[`get_conversations()`](https://vusaverse.github.io/vvcanvas/reference/get_conversations.md)
and
[`create_conversation()`](https://vusaverse.github.io/vvcanvas/reference/create_conversation.md).
