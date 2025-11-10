# Delete a Page in Canvas LMS

Deletes a page in a specific course using the Canvas LMS API.

## Usage

``` r
delete_page(canvas, course_id, page_id)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course in which to delete the page.

- page_id:

  The ID of the page.

## Value

A confirmation message that the page has been deleted.
