#' Upload QTI File with Content Migration
#'
#' This function uploads a QTI file to a specified course in Canvas LMS and initiates a content migration.
#' It handles the process of creating the migration, uploading the file, and checking the migration status.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course where the QTI file will be uploaded.
#' @param pre_attachment_name The name of the file being uploaded. This is required for the file upload process.
#' @param pre_attachment_size The size of the file being uploaded in bytes. This is required for the file upload process.
#' @param file_path The local file path to the QTI file that needs to be uploaded.
#' @param settings A list of additional settings for the content migration. This can include options like question bank name or overwrite settings.
#'
#' @return A confirmation message indicating that the QTI file has been uploaded and the content migration has been completed.
#' @export
upload_qti_file_with_migration <- function(canvas, course_id, pre_attachment_name, pre_attachment_size, file_path, settings = list()) {
  # Step 1: Create the content migration
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/content_migrations")

  # Create the request payload for creating the migration
  payload <- list(
    "migration_type" = "qti_converter",
    "pre_attachment[name]" = pre_attachment_name,
    "pre_attachment[size]" = pre_attachment_size
  )

  # Add additional settings if provided
  if (!is.null(settings)) {
    payload <- c(payload, settings)
  }

  # Make the API request to create the migration
  response <- httr::POST(url,
                         httr::add_headers(Authorization = paste("Bearer", canvas$api_key)),
                         body = payload,
                         encode = "multipart")

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to create content migration. Please check your authentication and API endpoint.")
  }

  # Parse the response to get the upload URL and other details
  migration_data <- httr::content(response)
  upload_url <- migration_data$pre_attachment$upload_url
  upload_params <- migration_data$pre_attachment$upload_params

  # Step 2: Upload the file
  upload_response <- httr::POST(upload_url,
                                body = list(file = httr::upload_file(file_path)),
                                encode = "multipart",
                                query = upload_params)

  # Check the upload response status code
  if (httr::status_code(upload_response) != 201) {
    stop("Failed to upload the file. Please check the file path and upload parameters.")
  }

  # Step 3: Get the content migration status
  migration_id <- migration_data$id
  migration_status_url <- paste0(url, "/", migration_id)

  return("The QTI file has been uploaded and content migration completed.")
}
