# Retrieves the pages within a course.

This function retrieves the pages within a specific course in the Canvas
LMS API.

## Usage

``` r
get_course_pages(canvas, course_id, per_page = 100)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to fetch the pages.

- per_page:

  (Optional) The number of pages to retrieve per page of results
  (default is 50).

## Value

A list of pages within the specified course.
