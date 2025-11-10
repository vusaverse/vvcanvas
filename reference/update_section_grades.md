# Updates assignment grades in a section.

This function updates the assignment grades of a specific assignment in
a specific section in the Canvas LMS API.

## Usage

``` r
update_section_grades(
  canvas,
  section_id,
  assignment_id,
  student_ids,
  posted_grades
)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- section_id:

  The ID of the section for which to generate the gradebook.

- assignment_id:

  The ID of the assignment for which the grades are updated.

- student_ids:

  The IDs of the students for whom the grades are updated.

- posted_grades:

  The values of the (updated) grades.

## Value

A confirmation message indicating that the grades have been updated.

## Details

It updates the grading on multiple students' assignment submissions in
an asynchronous job. The user must have permission to manage grades in
the section. The [API
documentation](https://canvas.instructure.com/doc/api/submissions.html#method.submissions_api.update)
describes the following types of scores:

- points:

  A floating point or integral value, such as "13.5". The grade will be
  interpreted directly as the score of the assignment. Values above
  assignment.points_possible are allowed, for awarding extra credit.

- percentage:

  A floating point value appended with a percent sign, such as "40%".
  The grade will be interpreted as a percentage score on the assignment,
  where 100% == assignment.points_possible. Values above 100% are
  allowed, for awarding extra credit.

- letter grade:

  A letter grade, following the assignment's defined letter grading
  scheme. For example, "A-". The resulting score will be the high end of
  the defined range for the letter grade. For instance, if "B" is
  defined as 86% to 84%, a letter grade of "B" will be worth 86%. The
  letter grade will be rejected if the assignment does not have a
  defined letter grading scheme. For more fine-grained control of
  scores, pass in points or percentage rather than the letter grade.

- pass/complete/fail/incomplete:

  A string value of "pass" or "complete" will give a score of 100%.
  "fail" or "incomplete" will give a score of 0.

## See also

[`update_course_grades()`](https://vusaverse.github.io/vvcanvas/reference/update_course_grades.md)
