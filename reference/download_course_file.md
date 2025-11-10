# Downloads a file from a given URL.

This function downloads a file from a specified URL and saves it
locally.

## Usage

``` r
download_course_file(canvas, file_url, download_path)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- file_url:

  The URL of the file to download.

- download_path:

  The path where the file should be downloaded.

## Value

The path of the downloaded file.

## Examples

``` r
if (FALSE) { # \dontrun{
# Download a file from a given URL
canvas <- canvas_authenticate(api_key, base_url)
file_url <- "https://example.com/file.pdf"
download_path <- "path/to/save/file.pdf"
file_path <- download_course_file(canvas, file_url, download_path)
} # }
```
