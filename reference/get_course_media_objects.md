# Retrieves the media objects in a course.

This function retrieves the media objects associated with a specific
course in the Canvas LMS API.

## Usage

``` r
get_course_media_objects(canvas, course_id, per_page = 100)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to fetch the media objects.

- per_page:

  The number of entries to show per page.

## Value

A data frame containing the media objects in the specified course.
