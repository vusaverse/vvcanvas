# Get course-level assignment data from the Canvas LMS API

Retrieves the course-level assignment data for a specific course from
the Canvas LMS API.

## Usage

``` r
get_assignment_data(canvas, course_id, per_page = 100)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course for which to retrieve the assignment data.

- per_page:

  Number of assignment data to retrieve per page. Default is 100.

## Value

A list of assignment data retrieved from the Canvas LMS API.
