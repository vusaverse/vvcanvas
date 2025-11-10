# Retrieves the items within a specific module.

This function retrieves the items within a specific module of a course
in the Canvas LMS API.

## Usage

``` r
get_module_items(canvas, course_id, module_id)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course containing the module.

- module_id:

  The ID of the module for which to fetch the items.

## Value

A list of items within the specified module.
