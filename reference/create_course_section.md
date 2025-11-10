# Create a Course Section in Canvas LMS

Creates a new course section in a specific course using the Canvas LMS
API.

## Usage

``` r
create_course_section(
  canvas,
  course_id,
  section_name,
  section_start_date = NULL,
  section_end_date = NULL
)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course in which to create the section.

- section_name:

  The name of the section.

- section_start_date:

  (Optional) The start date of the section.

- section_end_date:

  (Optional) The end date of the section.

## Value

A confirmation message that the section has been created.
