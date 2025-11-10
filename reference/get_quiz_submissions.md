# Retrieves quiz submissions.

This function retrieves the submissions to a specific quiz in a specific
course in the Canvas LMS API.

## Usage

``` r
get_quiz_submissions(canvas, course_id, quiz_id)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to fetch submissions.

- quiz_id:

  The ID of the quiz for which to fetch the submissions.

## Value

A data frame containing the submission data.

## See also

[`get_assignment_submissions()`](https://vusaverse.github.io/vvcanvas/reference/get_assignment_submissions.md)
