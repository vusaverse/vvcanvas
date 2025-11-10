# Retrieves course folders.

This function retrieves a list of folders for a specific course in the
Canvas LMS API.

## Usage

``` r
get_course_folders(canvas, course_id, per_page = 100)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to retrieve folders.

- per_page:

  Number of courses to retrieve per page. Default is 100.

## Value

A data frame of course folders.
