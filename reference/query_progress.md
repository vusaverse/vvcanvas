# Queries progress.

This function queries the progress of asynchronous API operations.

## Usage

``` r
query_progress(canvas, progress_url, attempts = 10)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- progress_url:

  The url where a progress update can be retrieved.

- attempts:

  The number of times it is allowed to check progress.

## Value

a message indicating completion and status information about the
asynchronous job.

## Details

It performs 10 attempts with a pause of 6 seconds between them.
