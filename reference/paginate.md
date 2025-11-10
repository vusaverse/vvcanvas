# Helper to paginate Canvas API GET requests

Follows 'next' links in the Link header to retrieve all pages. Returns a
list of all responses.

## Usage

``` r
paginate(initial_response, access_token, showProgress = TRUE)
```

## Arguments

- initial_response:

  The initial httr response object from the first GET request.

- access_token:

  The Canvas API access token (string).

- showProgress:

  Logical; whether to print progress as pages are fetched. Default is
  TRUE.

## Value

A list of httr response objects, one for each page.
