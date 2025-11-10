# Retrieves folders of the current user.

This function retrieves all folders associated with the user accessing
the API.

## Usage

``` r
get_user_folders(canvas)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

## Value

Returns a data frame containing the details on the folders available to
the user accessing the API.

## Details

Returns a list of all folders 'owned by' the current user. Note that
since `self` replaces `user_id`, the id of the user accessing the API
does not need to be specified. The highest level folder name is
`my folder`.

## See also

[`get_course_root_folder()`](https://vusaverse.github.io/vvcanvas/reference/get_course_root_folder.md)
and
[`get_course_folders()`](https://vusaverse.github.io/vvcanvas/reference/get_course_folders.md)
