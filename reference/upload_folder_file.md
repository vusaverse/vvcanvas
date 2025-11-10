# Uploads a file to a specific folder.

This function uploads a specific file to a specific folder.

## Usage

``` r
upload_folder_file(canvas, folder_id, file_name, generate_message = TRUE)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- folder_id:

  The ID of the folder to which the file is uploaded.

- file_name:

  The path to the local file that should be uploaded.

- generate_message:

  A logical expressing whether a message should be shown after a
  succesful upload; defaults to `TRUE`.

## Value

If `generate_message` is `TRUE`, a confirmation message indicating that
the file has been successfully uploaded.

## Details

Note that the user should have rights to access the folder.

## See also

[`get_course_root_folder()`](https://vusaverse.github.io/vvcanvas/reference/get_course_root_folder.md)
and
[`get_user_folders()`](https://vusaverse.github.io/vvcanvas/reference/get_user_folders.md)
