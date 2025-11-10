# Retrieve Roles for a Canvas Account

This function retrieves a paginated list of the roles available to a
specific account in the Canvas LMS system.

## Usage

``` r
get_roles(canvas, account_id, per_page = 100)
```

## Arguments

- canvas:

  A list containing the base URL and API key for the Canvas LMS
  instance.

- account_id:

  The ID of the account for which you want to retrieve the roles.

- per_page:

  The number of roles to retrieve per page (default is 100).

## Value

A data frame containing the roles available to the specified account.
