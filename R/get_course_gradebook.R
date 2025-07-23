#' Get course gradebook with all assignment and quiz submissions
#'
#' This function retrieves all assignment and quiz submissions for a course and combines them
#' into a single data frame. This is inspired by Jon Vik's work and provides a comprehensive
#' view of all student submissions in a course.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to retrieve all submissions.
#' @param per_page (Optional) The number of submissions to retrieve per page of results (default is 100).
#' @param include_quizzes (Optional) Whether to include quiz submissions (default is TRUE).
#' @param include_assignments (Optional) Whether to include assignment submissions (default is TRUE).
#'
#' @return A data frame containing all submissions (assignments and quizzes) for the specified course.
#' @export
#'
get_course_gradebook <- function(canvas, course_id, per_page = 100, include_quizzes = TRUE, include_assignments = TRUE) {
  gradebook_data <- list()
  
  # Get assignments and their submissions
  if (include_assignments) {
    tryCatch({
      assignments <- get_assignments(canvas, course_id)
      
      if (nrow(assignments) > 0) {
        assignment_submissions <- list()
        
        for (i in 1:nrow(assignments)) {
          assignment_id <- assignments$id[i]
          assignment_name <- assignments$name[i]
          
          tryCatch({
            submissions <- get_submissions(canvas, course_id, "assignments", assignment_id, per_page)
            
            if (length(submissions) > 0 && nrow(submissions) > 0) {
              submissions$assignment_name <- assignment_name
              submissions$assignment_id <- assignment_id
              submissions$submission_type <- "assignment"
              assignment_submissions[[as.character(assignment_id)]] <- submissions
            }
          }, error = function(e) {
            message("Warning: Failed to get submissions for assignment ", assignment_id, ": ", e$message)
          })
        }
        
        if (length(assignment_submissions) > 0) {
          gradebook_data$assignments <- do.call(rbind, assignment_submissions)
        }
      }
    }, error = function(e) {
      message("Warning: Failed to get assignments: ", e$message)
    })
  }
  
  # Get quizzes and their submissions
  if (include_quizzes) {
    tryCatch({
      quizzes <- get_course_quizzes(canvas, course_id, per_page)
      
      if (nrow(quizzes) > 0) {
        quiz_submissions <- list()
        
        for (i in 1:nrow(quizzes)) {
          quiz_id <- quizzes$id[i]
          quiz_name <- quizzes$title[i]
          
          tryCatch({
            submissions <- get_submissions(canvas, course_id, "quizzes", quiz_id, per_page)
            
            if (length(submissions) > 0 && nrow(submissions) > 0) {
              submissions$quiz_name <- quiz_name
              submissions$quiz_id <- quiz_id
              submissions$submission_type <- "quiz"
              quiz_submissions[[as.character(quiz_id)]] <- submissions
            }
          }, error = function(e) {
            message("Warning: Failed to get submissions for quiz ", quiz_id, ": ", e$message)
          })
        }
        
        if (length(quiz_submissions) > 0) {
          gradebook_data$quizzes <- do.call(rbind, quiz_submissions)
        }
      }
    }, error = function(e) {
      message("Warning: Failed to get quizzes: ", e$message)
    })
  }
  
  # Combine all submissions
  if (length(gradebook_data) > 0) {
    combined_data <- do.call(rbind, gradebook_data)
    combined_data$course_id <- course_id
    return(combined_data)
  } else {
    message("No submissions found for course ", course_id)
    return(data.frame())
  }
}