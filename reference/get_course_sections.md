# Retrieves course sections.

This function retrieves a list of sections for a specific course in the
Canvas LMS API.

## Usage

``` r
get_course_sections(canvas, course_id, per_page = 100)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to retrieve sections.

- per_page:

  (Optional) The number of sections to retrieve per page of results
  (default is 100).

## Value

A data frame of course sections.
