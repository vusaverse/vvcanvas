# Get all users from an account

Retrieves users from a specific account in the Canvas LMS API with
optional filtering and pagination.

## Usage

``` r
get_users(
  canvas,
  account_id = "self",
  per_page = 100,
  search_term = NULL,
  enrollment_type = NULL,
  sort = NULL,
  order = NULL,
  include_deleted_users = NULL,
  uuids = NULL,
  include = NULL
)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- account_id:

  The ID of the account. Defaults to "self" for the current user's
  account.

- per_page:

  The number of entries to show per page. Default is 100.

- search_term:

  Optional. The partial name or full ID of the users to match and return
  in the results list. Must be at least 3 characters.

- enrollment_type:

  Optional. When set, only return users enrolled with the specified
  course-level base role. Possible values: 'student', 'teacher', 'ta',
  'observer', or 'designer'.

- sort:

  Optional. The column to sort results by. Possible values: 'username',
  'email', 'sis_id', 'integration_id', 'last_login', 'id'.

- order:

  Optional. The order to sort the given column by. Possible values:
  'asc', 'desc'.

- include_deleted_users:

  Optional. When set to TRUE, returns users who have deleted pseudonyms
  for the context.

- uuids:

  Optional. A vector of UUIDs. When set, only return users with the
  specified UUIDs. UUIDs after the first 100 are ignored.

- include:

  Optional. A vector of additional information to include. Possible
  values include: "email", "enrollments", "avatar_url", "bio",
  "last_login", "time_zone", "locale", "uuid".

## Value

A data frame containing the users matching the specified criteria.

## Examples

``` r
if (FALSE) { # \dontrun{
# Authenticate with Canvas
canvas <- canvas_authenticate()

# Get all users from the default account
users <- get_users(canvas)

# Get users with a search term
users <- get_users(canvas, search_term = "John")

# Get users with email addresses included
users <- get_users(canvas, include = c("email", "enrollments"))
} # }
```
