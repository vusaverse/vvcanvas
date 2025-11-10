# Retrieves the assignment groups within a course.

This function retrieves the assignment groups within a specific course
in the Canvas LMS API.

## Usage

``` r
get_assignment_groups(canvas, course_id, per_page = 100)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to fetch the assignment groups.

- per_page:

  The number of entries to show per page.

## Value

A list of assignment groups within the specified course.
