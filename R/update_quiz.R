library(httr)

#' Modify an existing quiz.
#'
#' This function modifies an existing quiz in a specific course in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course containing the quiz to be modified.
#' @param quiz_id The ID of the quiz to be modified.
#' @param quiz_params A named list of quiz parameters to update. This list can include:
#'   \describe{
#'     \item{title}{(string) The quiz title.}
#'     \item{description}{(string) A description of the quiz.}
#'     \item{quiz_type}{(string) The type of quiz. Allowed values: \code{"practice_quiz"}, \code{"assignment"}, \code{"graded_survey"}, \code{"survey"}.}
#'     \item{assignment_group_id}{(integer) The assignment group id to put the assignment in. Defaults to the top assignment group in the course. Only valid if the quiz is graded.}
#'     \item{time_limit}{(integer) Time limit to take this quiz, in minutes. Set to \code{NULL} for no time limit. Defaults to \code{NULL}.}
#'     \item{shuffle_answers}{(boolean) If \code{TRUE}, quiz answers for multiple choice questions will be randomized for each student. Defaults to \code{FALSE}.}
#'     \item{hide_results}{(string) Dictates whether or not quiz results are hidden from students. Allowed values: \code{"always"}, \code{"until_after_last_attempt"}. Defaults to \code{NULL}.}
#'     \item{show_correct_answers}{(boolean) If \code{FALSE}, hides correct answers from students when quiz results are viewed. Defaults to \code{TRUE}.}
#'     \item{show_correct_answers_last_attempt}{(boolean) If \code{TRUE}, hides correct answers from students until they submit the last attempt for the quiz. Defaults to \code{FALSE}.}
#'     \item{show_correct_answers_at}{(DateTime) The correct answers will be visible by students only after this date.}
#'     \item{hide_correct_answers_at}{(DateTime) The correct answers will stop being visible once this date has passed.}
#'     \item{allowed_attempts}{(integer) Number of times a student is allowed to take a quiz. Set to \code{-1} for unlimited attempts. Defaults to \code{1}.}
#'     \item{scoring_policy}{(string) Scoring policy for a quiz that students can take multiple times. Allowed values: \code{"keep_highest"}, \code{"keep_latest"}.}
#'     \item{one_question_at_a_time}{(boolean) If \code{TRUE}, shows quiz to student one question at a time. Defaults to \code{FALSE}.}
#'     \item{cant_go_back}{(boolean) If \code{TRUE}, questions are locked after answering. Defaults to \code{FALSE}.}
#'     \item{access_code}{(string) Restricts access to the quiz with a password. For no access code restriction, set to \code{NULL}.}
#'     \item{ip_filter}{(string) Restricts access to the quiz to computers in a specified IP range.}
#'     \item{due_at}{(DateTime) The day/time the quiz is due. Accepts times in ISO 8601 format, e.g., \code{"2011-10-21T18:48Z"}.}
#'     \item{lock_at}{(DateTime) The day/time the quiz is locked for students.}
#'     \item{unlock_at}{(DateTime) The day/time the quiz is unlocked for students.}
#'     \item{published}{(boolean) Whether the quiz should be published.}
#'     \item{one_time_results}{(boolean) Whether students should be prevented from viewing their quiz results past the first time. Defaults to \code{FALSE}.}
#'     \item{only_visible_to_overrides}{(boolean) Whether this quiz is only visible to overrides. Defaults to \code{FALSE}.}
#'     \item{notify_of_update}{(boolean) If \code{TRUE}, notifies users that the quiz has changed. Defaults to \code{TRUE}.}
#'   }
#' @return A list representing the updated quiz object.
#' @export
#'
update_quiz <- function(canvas, course_id, quiz_id, quiz_params) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/quizzes/", quiz_id)

  # Make the PUT request to the Canvas API
  response <- httr::PUT(url,
                  httr::add_headers(Authorization = paste("Bearer", canvas$api_key)),
                  body = list(quiz = quiz_params),
                  encode = "json")

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to update quiz. Please check your authentication, course ID, quiz ID, and parameters.")
  }

  # Parse and return the response content
  updated_quiz <- httr::content(response, "parsed")
  return(updated_quiz)
}


