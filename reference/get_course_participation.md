# Get course-level participation data from Canvas LMS API

Fetches the participation data for a specific course from the Canvas LMS
API.

## Usage

``` r
get_course_participation(canvas, course_id)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course for which to retrieve the participation data.

## Value

The participation data for the specified course retrieved from the
Canvas LMS API.
