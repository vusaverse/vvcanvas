# Retrieves the discussion topics within a course.

This function retrieves the discussion topics within a specific course
in the Canvas LMS API.

## Usage

``` r
get_discussions(canvas, course_id, per_page = 100)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to fetch the discussion topics.

- per_page:

  The number of entries to show

## Value

A list of discussion topics within the specified course.
