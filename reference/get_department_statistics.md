# Get department-level statistics from the Canvas LMS API

Retrieves department-level statistics for a specific account and term
from the Canvas LMS API.

## Usage

``` r
get_department_statistics(canvas, account_id, type = "current", term_id = NULL)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- account_id:

  The ID of the account for which to retrieve the statistics.

- type:

  The type of courses to include in the data. Can be 'current',
  'completed', or 'term'.

- term_id:

  The ID of the term for which to retrieve the statistics. Only used
  when type is 'terms/\<term_id\>'.

## Value

A list of department-level statistics retrieved from the Canvas LMS API.
