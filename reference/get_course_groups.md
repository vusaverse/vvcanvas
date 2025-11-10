# Retrieves the list of groups in a course.

This function retrieves the list of groups in a specific course in the
Canvas LMS API.

## Usage

``` r
get_course_groups(canvas, course_id, per_page = 100)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course for which to fetch the groups.

- per_page:

  (Optional) The number of groups to retrieve per page of results
  (default is 100).

## Value

A data frame of groups in the specified course.
