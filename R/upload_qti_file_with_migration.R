#' Upload QTI File with Content Migration
#'
#' This function uploads a QTI file to a specified course in Canvas LMS and initiates a content migration.
#' It handles the process of creating the migration, uploading the file, and checking the migration status.
#' Additionally, it allows for obtaining the ID of the resulting quiz within Canvas so that quiz settings
#' are easily updated. In that case, because processing the QTI file (i.e. turning it into a quiz) takes some
#' time, the execution of further commands need to be suspended. If the processing of the uploaded file has not
#' yet resulted in a new quiz ID the user is asked if further waiting is required.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course where the QTI file will be uploaded.
#' @param qti_name The name of the QTI file (without the '.zip' extension) being uploaded.
#' @param wait logical or integer. Defaults to \code{FALSE}, if \code{TRUE} the function suspends retrieving information by 30 seconds. Integer values represent waiting time in seconds.
#' @param settings A list of additional settings for the content migration. This can include options like question bank name or overwrite settings.
#'
#' @return A quiz ID (equal to NULL if wait = FALSE or if no new quiz ID was found) and a confirmation message indicating that the content migration has been completed.
#' @export
upload_qti_file_with_migration <- function (canvas, course_id, qti_name, wait = FALSE, settings = list())
{
  pre_attachment_name <- paste(qti_name, "zip", sep = ".")
  if(!file.exists(pre_attachment_name)) stop(paste0(pre_attachment_name, " cannot be found."))
  pre_attachment_size <- file.size(pre_attachment_name)
  file_path <- file.path(pre_attachment_name)
  if(is.numeric(wait)) {
    wait_sec <- wait
    wait <- TRUE
  } else if(isTRUE(wait)) {
    wait_sec <- 30
  } else {
    wait_sec <- 0
    wait <- FALSE
    quiz_id <- NULL
  }
  # Get number of available quizzes in course
  quiz_n <- nrow(get_course_quizzes(canvas, course_id))
  # Preparing and asking permission to upload
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id,
      "/content_migrations")
  payload <- list(migration_type = "qti_converter", `pre_attachment[name]` = pre_attachment_name,
      `pre_attachment[size]` = pre_attachment_size)
  if (!is.null(settings)) {
    payload <- c(payload, settings)
  }
  response <- httr::POST(url, httr::add_headers(Authorization = paste("Bearer",
      canvas$api_key)), body = payload, encode = "multipart")
  if (httr::status_code(response) != 200) {
    stop("Failed to create content migration. Please check your authentication and API endpoint.")
  }
  # Attempt the actual upload
  migration_data <- httr::content(response)
  upload_url <- migration_data$pre_attachment$upload_url
  upload_params <- migration_data$pre_attachment$upload_params
  upload_response <- httr::POST(upload_url, body = list(file = httr::upload_file(file_path)),
      encode = "multipart", query = upload_params)
  if (httr::status_code(upload_response) != 201) {
    stop("Failed to upload the file. Please check the file path and upload parameters.")
  } else {
      message("The QTI file has been uploaded.")
  }
  # Test if the uploaded material is converted into a quiz yet
  migration_id <- migration_data$id
  migration_status_url <- paste0(url, "/", migration_id)
  while(wait) {
    Sys.sleep(wait_sec)
    migrations <- httr::GET(migration_status_url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))
    status <- httr::content(migrations)$workflow_state
    quiz_list <- get_course_quizzes(canvas, course_id)
    quiz_o <- nrow(quiz_list)
    if(status != "completed") {
        quiz_id <- NULL
    } else if(quiz_o == quiz_n) {
        quiz_id <- NULL
    } else if(quiz_list[order(quiz_list$id), ][quiz_o, "title"] != qti_name){
        quiz_id <- NULL
    } else {
      quiz_id <- quiz_list[order(quiz_list$id), ][quiz_o, "id"]
    }
    if (is.null(quiz_id)) {
      wait <- readline(prompt = "No new quiz_id yet. Do you want to keep waiting? (Y/N)")
      wait <- nchar(wait) < 1L || tolower(substr(wait, 1L, 1L)) == "y"
    } else {
      wait <- FALSE
    }
  }
  quiz_id
}
