# Get Assignment Details from Canvas LMS API

Retrieves detailed information about a specific assignment from the
Canvas LMS API.

## Usage

``` r
get_assignment_details(canvas, course_id, assignment_id)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course in which the assignment resides.

- assignment_id:

  The ID of the assignment for which to retrieve the details.

## Value

A dataframe containing the detailed information about the assignment.
