# Retrieves the course enrollments for a course.

This function retrieves the enrollments of students and other roles in a
specific course in the Canvas LMS API.

## Usage

``` r
get_course_enrollments(canvas, course_id, per_page = 100)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to fetch the enrollments.

- per_page:

  (Optional) The number of enrollments to retrieve per page of results
  (default is 100).

## Value

A data frame of course enrollments for the specified course.
