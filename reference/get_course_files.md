# Retrieves a list of files within a course.

This function retrieves a list of files within a specific course in the
Canvas LMS API.

## Usage

``` r
get_course_files(canvas, course_id, per_page = 100)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to fetch the files.

- per_page:

  (Optional) The number of files to retrieve per page of results
  (default is 100).

## Value

A data frame of files within the specified course.
