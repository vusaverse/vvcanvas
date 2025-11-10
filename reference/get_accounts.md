# Get a list of accounts from the Canvas LMS API

Retrieves a paginated list of accounts that the current user can view or
manage.

## Usage

``` r
get_accounts(canvas, include = NULL, per_page = 100)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- include:

  A vector of additional information to include. Default is NULL.

- per_page:

  Number of accounts to retrieve per page. Default is 100.

## Value

A list of accounts retrieved from the Canvas LMS API.
