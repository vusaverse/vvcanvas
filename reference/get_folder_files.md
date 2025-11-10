# Retrieves files in a specific folder.

This function lists all files available in a specific folder.

## Usage

``` r
get_folder_files(canvas, folder_id)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- folder_id:

  The ID of the folder for which to fetch associated files.

## Value

Returns a data frame containing the details on the files stored in the
specified folder.
