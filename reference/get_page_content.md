# Retrieves the content body of a specified page.

This function retrieves the content body of a specified page within a
course in the Canvas LMS API.

## Usage

``` r
get_page_content(canvas, course_id, page_id, return_as_plain_text = TRUE)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course to which the page belongs.

- page_id:

  The ID of the page for which to fetch the content body.

- return_as_plain_text:

  A logical value indicating whether to return the content as plain text
  (default is TRUE).

## Value

The content body of the specified page, either as plain text or raw
HTML.
