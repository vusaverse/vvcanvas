# Create a Group Category in Canvas LMS

Creates a new group category in a specific course using the Canvas LMS
API.

## Usage

``` r
create_group_category(
  canvas,
  course_id,
  category_name,
  allow_self_signup = FALSE
)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course in which to create the group category.

- category_name:

  The name of the group category.

- allow_self_signup:

  (Optional) Whether to allow self-signup for groups in the category.
  Defaults to FALSE.

## Value

A confirmation message that the group category has been created.
