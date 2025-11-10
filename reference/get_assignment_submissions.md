# Lists assignment submissions for a course.

This function retrieves a list of assignment submissions for a specific
course in the Canvas LMS API.

## Usage

``` r
get_assignment_submissions(
  canvas,
  course_id,
  assignment_id = NULL,
  per_page = 100
)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to list assignment submissions.

- assignment_id:

  (Optional) The ID of a specific assignment for which to list
  submissions.

- per_page:

  (Optional) The number of submissions to retrieve per page of results
  (default is 100).

## Value

A data frame of assignment submissions for the specified course and
assignment.
