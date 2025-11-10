# Create an Assignment Group in Canvas LMS

Creates a new assignment group in a specific course using the Canvas LMS
API.

## Usage

``` r
create_assignment_group(canvas, course_id, group_name, group_position = NULL)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course in which to create the assignment group.

- group_name:

  The name of the assignment group.

- group_position:

  The position of the assignment group in the course (optional).

## Value

A confirmation message that the assignment group has been created.
