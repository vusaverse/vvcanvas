# Extracts the 'next' URL from a Link header

Extracts the 'next' URL from a Link header

## Usage

``` r
extract_next_url(link_header)
```

## Arguments

- link_header:

  The Link header string from an httr response.

## Value

The URL (character) for the next page, or NULL if not present.
