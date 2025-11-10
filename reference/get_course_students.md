# Retrieves the list of students in a course.

This function retrieves the list of students enrolled in a specific
course in the Canvas LMS API.

## Usage

``` r
get_course_students(canvas, course_id, per_page = 100)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to fetch the students.

- per_page:

  (Optional) The number of students to retrieve per page of results
  (default is 100).

## Value

A data frame of students enrolled in the specified course.
