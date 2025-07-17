#' Get assignment submissions
#'
#' This function retrieves submissions for a specific assignment from the Canvas LMS API.
#' This is a convenience wrapper around get_submissions() for assignments.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to retrieve assignment submissions.
#' @param assignment_id The ID of the assignment for which to retrieve submissions.
#' @param per_page (Optional) The number of submissions to retrieve per page of results (default is 100).
#'
#' @return A data frame of submissions for the specified assignment.
#' @export
#'
get_assignment_submissions_new <- function(canvas, course_id, assignment_id, per_page = 100) {
  return(get_submissions(canvas, course_id, "assignments", assignment_id, per_page))
}

#' Get quiz submissions
#'
#' This function retrieves submissions for a specific quiz from the Canvas LMS API.
#' This is a convenience wrapper around get_submissions() for quizzes.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to retrieve quiz submissions.
#' @param quiz_id The ID of the quiz for which to retrieve submissions.
#' @param per_page (Optional) The number of submissions to retrieve per page of results (default is 100).
#'
#' @return A data frame of submissions for the specified quiz.
#' @export
#'
get_quiz_submissions <- function(canvas, course_id, quiz_id, per_page = 100) {
  return(get_submissions(canvas, course_id, "quizzes", quiz_id, per_page))
}