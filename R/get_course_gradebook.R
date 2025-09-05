#' Constructs the gradebook of a course.
#'
#' This function generates a gradebook for the assignments in a specific course in the Canvas LMS
#' API.
#'
#' The gradebook shown in Canvas is not accessible through the API. Here it is reconstructed using
#' the (visible) assignments and students in the course. It may be useful for performing more
#' advanced grade calculations (like allowing for conditional extra credit) before adjusting
#' assignment grades (see, \code{\link{update_course_grades}} and
#' \code{\link{update_section_grades}}).
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the
#' `canvas_authenticate` function.
#' @param course_id The ID of the course for which to generate the gradebook.
#'
#' @return A data frame containing the gradebook with student in rows (identifiable through
#' `canvas_user_id`) and assignments in columns (identifiable through assigment names).
#' @seealso [get_assignments()], and [get_assignment_submissions()].
#' @export
get_course_gradebook <- function(canvas, course_id)
{
  # Obtain enrolled students
  students <- get_course_students(canvas, course_id)
  if (!any(grepl("sis_user_id", names(students)))) {
    stop("This course has no enrolled students.")
  }

  # Obtain all visible course assignments
  assignments <- get_assignments(canvas, course_id)
  assignments <- assignments[assignments$visible_to_everyone, ]

  # Evaluate availability of assignments
  if (length(assignments) == 0 || nrow(assignments) == 0){
    stop("This course has no assignments.")
  }

  # Loop through assignment submissions
  assignment_list <- apply(assignments, 1, function(x) {
    grades <- get_assignment_submissions(canvas, course_id, x$id) %>%
      as.data.frame() %>% dplyr::select(c("user_id", "score")) %>%
      `colnames<-`(c("canvas_user_id", x$name))
  })

  # Merge assignment grades
  grades <- assignment_list %>% purrr::reduce(dplyr::left_join, by = "canvas_user_id")

  return(grades)
}
