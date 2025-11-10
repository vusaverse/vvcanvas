# Get group memberships

This function retrieves the memberships for a specific group in the
Canvas LMS API.

## Usage

``` r
get_group_memberships(canvas, group_id)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- group_id:

  The ID of the group for which to retrieve the memberships.

## Value

A data frame of memberships in the specified group.
