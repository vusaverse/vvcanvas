# Update a Page in Canvas LMS

Updates an existing page in a specific course using the Canvas LMS API.

## Usage

``` r
update_page(canvas, course_id, page_id, page_params)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course in which to create the page.

- page_id:

  The ID of the page.

- page_params:

  A named list of page parameters to update. This list can include:

  title

  :   (string) The title for the updated page.

  body

  :   (string) The content for the updated page.

  published

  :   (boolean) Whether the page is published (`TRUE`) or draft state
      (`FALSE`).

  published_at

  :   (DateTime) Schedule a future date/time to publish the page.

## Value

A confirmation message that the page has been updated.
