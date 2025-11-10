# Retrieves conversations.

This function retrieves all details concerning conversations of the
user.

## Usage

``` r
get_conversations(canvas)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

## Value

Returns a data frame containing the details of conversations for the
current user, most recent ones first.

## See also

[`get_single_conversation()`](https://vusaverse.github.io/vvcanvas/reference/get_single_conversation.md)
and
[`create_conversation()`](https://vusaverse.github.io/vvcanvas/reference/create_conversation.md).
