# List All Enrollment Terms

This function retrieves a paginated list of all enrollment terms for a
specified account in Canvas LMS.

## Usage

``` r
list_all_enrollment_terms(canvas, account_id, per_page = 100)
```

## Arguments

- canvas:

  A list containing Canvas API configuration:

  - base_url: The base URL of your Canvas instance

  - api_key: Your Canvas API key

- account_id:

  The ID of the account for which to retrieve enrollment terms

- per_page:

  The number of terms to retrieve per page (default is 100)

## Value

A dataframe containing all enrollment terms details
