# Get student summaries for a course from Canvas LMS API

Retrieves the student summaries for a specific course from the Canvas
LMS API.

## Usage

``` r
get_student_summaries(canvas, course_id, per_page = 100)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course for which to retrieve the student summaries.

- per_page:

  Number of student summaries to retrieve per page. Default is 100.

## Value

A list of student summaries retrieved from the Canvas LMS API.
