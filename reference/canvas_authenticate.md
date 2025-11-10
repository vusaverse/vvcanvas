# Authenticate with Canvas LMS API

Handles authentication with the Canvas LMS API using the provided API
key and base URL.

## Usage

``` r
canvas_authenticate(api_key, base_url)
```

## Arguments

- api_key:

  The API key for authenticating with the Canvas LMS API.

- base_url:

  The base URL of the Canvas instance.

## Value

A list containing the authenticated 'api_key' and 'base_url'.

## Examples

``` r
if (FALSE) { # \dontrun{
# Authenticate with the Canvas LMS API
api_key <- "your_api_key"
base_url <- "https://canvas.example.com"
canvas <- canvas_authenticate(api_key, base_url)
} # }
```
