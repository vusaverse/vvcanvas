# Retrieves the users in a course.

This function retrieves the users enrolled in a specific course in the
Canvas LMS API.

## Usage

``` r
get_course_users(
  canvas,
  course_id,
  per_page = 100,
  include = c("enrollments", "locked", "avatar_url", "test_student", "bio",
    "custom_links", "current_grading_period_scores", "uuid")
)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to fetch the users.

- per_page:

  The number of entries to show per page.

- include:

  Optional parameters to include in the response. Possible values:
  "enrollments", "locked", "avatar_url", "test_student", "bio",
  "custom_links", "current_grading_period_scores", "uuid".

## Value

A data frame containing the users in the specified course.
