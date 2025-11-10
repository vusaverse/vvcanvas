# Delete a Course Section in Canvas LMS

Deletes an existing course section using the Canvas LMS API.

## Usage

``` r
delete_course_section(canvas, section_id)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- section_id:

  The ID of the section to delete.

## Value

A confirmation message that the section has been deleted.
