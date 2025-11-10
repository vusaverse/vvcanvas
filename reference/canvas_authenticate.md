# Authenticate with Canvas LMS API

This function handles authentication with the Canvas LMS API. It uses
the provided API key and base URL, or falls back to the `CANVAS_API_KEY`
and `CANVAS_BASE_URL` environment variables if none are provided.

## Usage

``` r
canvas_authenticate(api_key = canvas_api_key(), base_url = canvas_base_url())
```

## Arguments

- api_key:

  The API key for authenticating with the Canvas LMS API. Defaults to
  the `CANVAS_API_KEY` environment variable.

- base_url:

  The base URL of the Canvas instance. Defaults to the `CANVAS_BASE_URL`
  environment variable.

## Value

A list containing the authenticated 'api_key' and 'base_url'.

## Note

The function verifies authentication by making a test request to the
`/api/v1/users/self` endpoint of the Canvas instance. If the response
status code is not 200, it throws an error message indicating that
authentication failed.

## Examples

``` r
if (FALSE) { # \dontrun{
# Authenticate with the Canvas LMS API
api_key <- "your_api_key"
base_url <- "https://canvas.example.com"
canvas <- canvas_authenticate(api_key, base_url)
} # }
```
