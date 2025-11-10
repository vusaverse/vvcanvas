# Retrieve Students in a Section

This function retrieves a list of students enrolled in a specific
section of a course in Canvas LMS.

## Usage

``` r
get_section_students(canvas, section_id, per_page = 100)
```

## Arguments

- canvas:

  A list containing the Canvas API key and base URL, typically obtained
  through a `canvas_authenticate` function.

- section_id:

  The ID of the section for which to retrieve students.

- per_page:

  (Optional) The number of student records to retrieve per page of
  results. Defaults to 100.

## Value

A data frame containing details of students enrolled in the specified
section.

## Examples

``` r
if (FALSE) { # \dontrun{
canvas <- list(base_url = "https://your_canvas_instance.instructure.com", api_key = "your_api_key")
section_id <- "67890"
students <- get_section_students(canvas, section_id)
print(students)
} # }
```
