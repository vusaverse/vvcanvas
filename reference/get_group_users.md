# Get users in a group

This function retrieves the users in a specific group in the Canvas LMS
API.

## Usage

``` r
get_group_users(canvas, group_id)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- group_id:

  The ID of the group for which to retrieve the users.

## Value

A data frame of users in the specified group.
