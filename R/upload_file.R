#' Upload a file in Canvas LMS.
#'
#' This function uploads a file to the files folder of a specific course.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course where the file will be uploaded.
#' @param file_name The file to be uploaded.
#'
#' @return A confirmation message indicating that the file has been uploaded.
upload_file <- function(canvas, course_id, file_name) {
  if (!file.exists(file_name)) stop(paste0(file_name, " cannot be found."))
  file_size <- file.size(file_name)
  file_path <- file.path(file_name)
  file_type <- mime::guess_type(file_name)
  # Preparing and asking permission to upload
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/files")
  payload <- list(content_type = file_type, name = file_name, size = file_size)
  response <- httr::POST(url, httr::add_headers(Authorization = paste(
    "Bearer",
    canvas$api_key
  )), body = payload, encode = "multipart")
  if (httr::status_code(response) != 200) {
    stop("Failed to create file upload. Please check your authentication and API endpoint.")
  }
  # Attempt the actual upload
  upload_data <- httr::content(response)
  upload_url <- upload_data$upload_url
  upload_params <- upload_data$upload_params
  upload_response <- httr::POST(upload_url,
    body = list(file = httr::upload_file(file_path)),
    encode = "multipart", query = upload_params
  )
  if (httr::status_code(upload_response) != 201) {
    stop("Failed to upload the file. Please check the file path and upload parameters.")
  }
  message("The file has been succesfully uploaded.")
  return(httr::content(upload_response))
}
