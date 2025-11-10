# Create a Folder in Canvas LMS

Creates a new folder in a specific course using the Canvas LMS API.

## Usage

``` r
create_folder(canvas, course_id, folder_name, parent_folder_id = NULL)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course in which to create the folder.

- folder_name:

  The name of the folder.

- parent_folder_id:

  (Optional) The ID of the parent folder in which to create the folder.

## Value

A confirmation message that the folder has been created.
