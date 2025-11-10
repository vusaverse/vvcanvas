# Constructs the gradebook of a course.

This function generates a gradebook for the assignments in a specific
course in the Canvas LMS API.

## Usage

``` r
get_course_gradebook(canvas, course_id)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course for which to generate the gradebook.

## Value

A data frame containing the gradebook with student in rows (identifiable
through `canvas_user_id`) and assignments in columns (identifiable
through assigment names).

## Details

The gradebook shown in Canvas is not accessible through the API. Here it
is reconstructed using the (visible) assignments and students in the
course. It may be useful for performing more advanced grade calculations
(like allowing for conditional extra credit) before adjusting assignment
grades (see,
[`update_course_grades`](https://vusaverse.github.io/vvcanvas/reference/update_course_grades.md)
and
[`update_section_grades`](https://vusaverse.github.io/vvcanvas/reference/update_section_grades.md)).

## See also

[`get_assignments()`](https://vusaverse.github.io/vvcanvas/reference/get_assignments.md),
and
[`get_assignment_submissions()`](https://vusaverse.github.io/vvcanvas/reference/get_assignment_submissions.md).
