# Get Course Details from Canvas LMS API

Retrieves detailed information about a specific course from the Canvas
LMS API.

## Usage

``` r
get_course_details(canvas, course_id)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course for which to retrieve the details.

## Value

A dataframe containing the detailed information about the course.
