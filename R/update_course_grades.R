#' Updates assignment grades in a course.
#'
#' @description This function updates the assignment grades of a specific assignment in a specific
#' course in the Canvas LMS API.
#'
#' @details It updates the grading on multiple students' assignment submissions in an
#' asynchronous job. The user must have permission to manage grades in the course.
#' The \href{https://canvas.instructure.com/doc/api/submissions.html#method.submissions_api.update}{API documentation}
#' describes the following types of scores:
#'    \describe{
#'       \item{points}{A floating point or integral value, such as "13.5". The grade
#'          will be interpreted directly as the score of the assignment.
#'          Values above assignment.points_possible are allowed, for awarding
#'          extra credit.}
#'       \item{percentage}{A floating point value appended with a percent sign, such as
#'           "40%". The grade will be interpreted as a percentage score on the
#'           assignment, where 100% == assignment.points_possible. Values above 100%
#'           are allowed, for awarding extra credit.}
#'       \item{letter grade}{A letter grade, following the assignment's defined letter
#'           grading scheme. For example, "A-". The resulting score will be the high
#'           end of the defined range for the letter grade. For instance, if "B" is
#'           defined as 86% to 84%, a letter grade of "B" will be worth 86%. The
#'           letter grade will be rejected if the assignment does not have a defined
#'           letter grading scheme. For more fine-grained control of scores, pass in
#'           points or percentage rather than the letter grade.}
#'       \item{pass/complete/fail/incomplete}{A string value of "pass" or "complete"
#'           will give a score of 100%. "fail" or "incomplete" will give a score of 0.}
#'}
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the
#' `canvas_authenticate` function.
#' @param course_id The ID of the course for which to generate the gradebook.
#' @param assignment_id The ID of the assignment for which the grades are updated.
#' @param student_ids The IDs of the students for whom the grades are updated.
#' @param posted_grades The values of the (updated) grades.
#'
#' @return A confirmation message indicating that the grades have been updated.
#' @seealso [update_section_grades()]
#' @export
update_course_grades <- function(canvas, course_id, assignment_id, student_ids, posted_grades)
{
  if (length(student_ids) != length(posted_grades)) {
    stop("student_ids and posted_grades have unequal length. Please check your data.")
  }
  parameters <- paste0("grade_data[", student_ids, "][posted_grade]")
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/assignments/", assignment_id,
    "/submissions/update_grades"
  )
  payload <- as.list(posted_grades)
  names(payload) <- parameters
  response <- httr::POST(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)),
    body = payload, encode = "multipart")
  if (httr::status_code(response) != 200) {
    stop("Failed to update grades. Please check your authentication and API endpoint.")
  }
  message("The assignment grades have been succesfully updated.")
}
