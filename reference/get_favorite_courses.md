# Get Favorite Courses in Canvas LMS

Retrieves the data of favorite courses for the authenticated user using
the Canvas LMS API.

## Usage

``` r
get_favorite_courses(canvas, exclude_blueprint_courses = NULL)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- exclude_blueprint_courses:

  When set, only return courses that are not configured as blueprint
  courses (optional).

## Value

The dataframe of favorite courses.
