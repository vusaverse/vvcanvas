# Retrieves root folder of a course.

This function retrieves the root folder associated with a course.

## Usage

``` r
get_course_root_folder(canvas, course_id)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to fetch associated folders.

## Value

Returns a data frame containing the details on the root folder
associated with the specified course.

## See also

[`get_course_folders()`](https://vusaverse.github.io/vvcanvas/reference/get_course_folders.md)
and
[`get_user_folders()`](https://vusaverse.github.io/vvcanvas/reference/get_user_folders.md)
