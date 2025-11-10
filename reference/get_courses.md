# Get Courses from Canvas LMS API

Retrieves a list of courses from the Canvas LMS API.

## Usage

``` r
get_courses(canvas, per_page = 100)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- per_page:

  Number of courses to retrieve per page. Default is 100.

## Value

A list of courses retrieved from the Canvas LMS API.
