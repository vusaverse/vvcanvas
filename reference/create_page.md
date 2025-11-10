# Create a Page in Canvas LMS

Creates a new page in a specific course using the Canvas LMS API.

## Usage

``` r
create_page(canvas, course_id, page_title, page_body, published = FALSE)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course in which to create the page.

- page_title:

  The title of the page.

- page_body:

  The body/content of the page.

- published:

  (Optional) Whether the page should be published. Defaults to FALSE.

## Value

A confirmation message that the page has been created.
