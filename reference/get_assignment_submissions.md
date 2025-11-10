# Retrieves assignment submissions.

This function retrieves the submissions to a specific assignment in a
specific course in the Canvas LMS API.

## Usage

``` r
get_assignment_submissions(canvas, course_id, assignment_id, per_page = 100)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to fetch submissions.

- assignment_id:

  The ID of the assignment for which to fetch the submissions.

- per_page:

  (Optional) The number of submissions to retrieve per page of results
  (default is 100).

## Value

A data frame containing the submission data.
