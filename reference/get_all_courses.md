# Retrieves a paginated list of all courses visible in the public index.

This function retrieves a paginated list of all courses visible in the
public index using the Canvas LMS API. *NOTE* This function might take a
while to finish.

## Usage

``` r
get_all_courses(canvas, per_page = 100)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- per_page:

  (Optional) The number of courses to retrieve per page of results
  (default is 100).

## Value

A data frame of courses visible in the public index.
