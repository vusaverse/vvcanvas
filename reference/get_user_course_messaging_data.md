# Get user-in-a-course-level messaging data from the Canvas LMS API

Retrieves user-in-a-course-level messaging data for a specific course
and student from the Canvas LMS API.

## Usage

``` r
get_user_course_messaging_data(canvas, course_id, student_id)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course for which to retrieve the messaging data.

- student_id:

  The ID of the student for which to retrieve the messaging data.

## Value

A list of user-in-a-course-level messaging data retrieved from the
Canvas LMS API.
