# Get Assignments from Canvas LMS API

Fetches a list of assignments within a specific course from the Canvas
LMS API.

## Usage

``` r
get_assignments(canvas, course_id)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course for which to retrieve the assignments.

## Value

A list of assignments retrieved from the Canvas LMS API.
