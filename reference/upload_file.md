# Upload a file in Canvas LMS.

This function uploads a file to the files folder of a specific course.

## Usage

``` r
upload_file(canvas, course_id, file_name)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course where the file will be uploaded.

- file_name:

  The file to be uploaded.

## Value

A confirmation message indicating that the file has been uploaded.
