# Create a Module Item in Canvas LMS

Creates a new item in a specific module in a specifc course using the
Canvas LMS API.

## Usage

``` r
create_module_item(
  canvas,
  course_id,
  module_id,
  item_title,
  item_type = "Page",
  position = NULL,
  page_url = NULL,
  page_id = NULL
)
```

## Arguments

- canvas:

  A list containing the 'api_key' and 'base_url' for authentication.

- course_id:

  The ID of the course in which to create the module item.

- module_id:

  The ID of the module in which to create the item.

- item_title:

  The title of the new item within the module.

- item_type:

  The type of item. Defaults to "Page".

- position:

  (Optional) The position of the item within the module. Defaults to 1.

- page_url:

  (Optional) The url of the page.

- page_id:

  (Optional) The id of the page.

## Value

A confirmation message that the page has been created.
