# Post a New Discussion in Canvas LMS

Creates a new discussion topic in a specific course using the Canvas LMS
API.

## Usage

``` r
post_new_discussion(
  canvas,
  course_id,
  discussion_title,
  discussion_message,
  discussion_is_announcement = FALSE
)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course in which to create the discussion.

- discussion_title:

  The title of the discussion topic.

- discussion_message:

  The initial message content of the discussion topic.

- discussion_is_announcement:

  (Optional) Whether the discussion should be an announcement. Defaults
  to FALSE.

## Value

A confirmation message that the discussion has been created.
