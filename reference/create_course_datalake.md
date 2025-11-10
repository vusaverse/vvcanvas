# Create a data lake for a course.

This function retrieves data from various endpoints for a specific
course in the Canvas LMS API and stores the data as JSON files in a
specified storage location.

## Usage

``` r
create_course_datalake(canvas, course_id, storage_location)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to create the data lake.

- storage_location:

  The path to the storage location where the data files will be saved.

## Value

NULL.

## Note

This function retrieves data from various endpoints. Access to certain
endpoints may require specific roles.
