# Get user-in-a-course-level assignment data from the Canvas LMS API

Retrieves user-in-a-course-level assignment data for a specific course
and student from the Canvas LMS API.

## Usage

``` r
get_user_course_assignment_data(canvas, course_id, student_id)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course for which to retrieve the assignment data.

- student_id:

  The ID of the student for which to retrieve the assignment data.

## Value

A list of user-in-a-course-level assignment data retrieved from the
Canvas LMS API.
