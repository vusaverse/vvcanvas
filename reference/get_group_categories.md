# Get group categories for a context

This function retrieves the group categories for a specific context
(e.g., course) in the Canvas LMS API.

## Usage

``` r
get_group_categories(canvas, course_id)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course for which to retrieve the group categories.

## Value

A data frame of group categories in the specified context.
