# Modify an existing quiz.

This function modifies an existing quiz in a specific course in the
Canvas LMS API.

## Usage

``` r
update_quiz(canvas, course_id, quiz_id, quiz_params)
```

## Arguments

- canvas:

  An object containing the Canvas API key and base URL, obtained through
  the `canvas_authenticate` function.

- course_id:

  The ID of the course containing the quiz to be modified.

- quiz_id:

  The ID of the quiz to be modified.

- quiz_params:

  A named list of quiz parameters to update. This list can include:

  title

  :   (string) The quiz title.

  description

  :   (string) A description of the quiz.

  quiz_type

  :   (string) The type of quiz. Allowed values: `"practice_quiz"`,
      `"assignment"`, `"graded_survey"`, `"survey"`.

  assignment_group_id

  :   (integer) The assignment group id to put the assignment in.
      Defaults to the top assignment group in the course. Only valid if
      the quiz is graded.

  time_limit

  :   (integer) Time limit to take this quiz, in minutes. Set to `NULL`
      for no time limit. Defaults to `NULL`.

  shuffle_answers

  :   (boolean) If `TRUE`, quiz answers for multiple choice questions
      will be randomized for each student. Defaults to `FALSE`.

  hide_results

  :   (string) Dictates whether or not quiz results are hidden from
      students. Allowed values: `"always"`,
      `"until_after_last_attempt"`. Defaults to `NULL`.

  show_correct_answers

  :   (boolean) If `FALSE`, hides correct answers from students when
      quiz results are viewed. Defaults to `TRUE`.

  show_correct_answers_last_attempt

  :   (boolean) If `TRUE`, hides correct answers from students until
      they submit the last attempt for the quiz. Defaults to `FALSE`.

  show_correct_answers_at

  :   (DateTime) The correct answers will be visible by students only
      after this date.

  hide_correct_answers_at

  :   (DateTime) The correct answers will stop being visible once this
      date has passed.

  allowed_attempts

  :   (integer) Number of times a student is allowed to take a quiz. Set
      to `-1` for unlimited attempts. Defaults to `1`.

  scoring_policy

  :   (string) Scoring policy for a quiz that students can take multiple
      times. Allowed values: `"keep_highest"`, `"keep_latest"`.

  one_question_at_a_time

  :   (boolean) If `TRUE`, shows quiz to student one question at a time.
      Defaults to `FALSE`.

  cant_go_back

  :   (boolean) If `TRUE`, questions are locked after answering.
      Defaults to `FALSE`.

  access_code

  :   (string) Restricts access to the quiz with a password. For no
      access code restriction, set to `NULL`.

  ip_filter

  :   (string) Restricts access to the quiz to computers in a specified
      IP range.

  due_at

  :   (DateTime) The day/time the quiz is due. Accepts times in ISO 8601
      format, e.g., `"2011-10-21T18:48Z"`.

  lock_at

  :   (DateTime) The day/time the quiz is locked for students.

  unlock_at

  :   (DateTime) The day/time the quiz is unlocked for students.

  published

  :   (boolean) Whether the quiz should be published.

  one_time_results

  :   (boolean) Whether students should be prevented from viewing their
      quiz results past the first time. Defaults to `FALSE`.

  only_visible_to_overrides

  :   (boolean) Whether this quiz is only visible to overrides. Defaults
      to `FALSE`.

  notify_of_update

  :   (boolean) If `TRUE`, notifies users that the quiz has changed.
      Defaults to `TRUE`.

## Value

A list representing the updated quiz object.
