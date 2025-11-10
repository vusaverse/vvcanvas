# Get department-level grade data from the Canvas LMS API

Retrieves the department-level grade data for a specific account and
term from the Canvas LMS API.

## Usage

``` r
get_department_grade_data(
  canvas,
  account_id,
  type = "current",
  term_id = NULL,
  per_page = 100
)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- account_id:

  The ID of the account for which to retrieve the grade data.

- type:

  The type of courses to include in the data. Can be 'current',
  'completed', or 'term'.

- term_id:

  The ID of the term for which to retrieve the grade data. Only used
  when type is 'terms/\<term_id\>'.

- per_page:

  Number of grade data to retrieve per page. Default is 100.

## Value

A data frame of grade data retrieved from the Canvas LMS API.
