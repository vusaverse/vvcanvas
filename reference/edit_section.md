# Edit a Course Section in Canvas LMS

Modifies an existing course section using the Canvas LMS API.

## Usage

``` r
edit_section(
  canvas,
  section_id,
  section_name = NULL,
  sis_section_id = NULL,
  integration_id = NULL,
  section_start_date = NULL,
  section_end_date = NULL,
  restrict_enrollments_to_section_dates = NULL,
  override_sis_stickiness = NULL
)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- section_id:

  The ID of the section to edit.

- section_name:

  The new name of the section (optional).

- sis_section_id:

  The new SIS ID of the section (optional).

- integration_id:

  The new integration ID of the section (optional).

- section_start_date:

  The new start date of the section (optional).

- section_end_date:

  The new end date of the section (optional).

- restrict_enrollments_to_section_dates:

  Whether to restrict user enrollments to the start and end dates of the
  section (optional).

- override_sis_stickiness:

  Whether to override SIS stickiness (optional).

## Value

A confirmation message that the section has been edited.
