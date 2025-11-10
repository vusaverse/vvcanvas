# Create a Module in Canvas LMS

Creates a new module in a specific course using the Canvas LMS API.

## Usage

``` r
create_module(canvas, course_id, module_name, position = NULL)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course in which to create the module.

- module_name:

  The title of the module.

- position:

  (Optional) The position of this module in the course

## Value

A confirmation message that the module has been created.
