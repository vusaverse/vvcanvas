#' Uploads a file to a specific folder.
#'
#' This function uploads a specific file to a specific folder.
#'
#' Note that the user should have rights to access the folder.
#'
#' @param canvas An object containing the Canvas API key and base URL,
#' obtained through the `canvas_authenticate` function.
#' @param folder_id The ID of the folder to which the file is uploaded.
#' @param file_name The path to the local file that should be uploaded.
#' @param generate_message A logical expressing whether a message should
#' be shown after a succesful upload; defaults to `TRUE`.
#'
#' @return If `generate_message` is `TRUE`, a confirmation message indicating
#' that the file has been successfully uploaded.
#' @seealso [get_course_root_folder()] and [get_user_folders()]
#' @export
upload_folder_file <- function(canvas, folder_id, file_name, generate_message = TRUE) {
  if (!file.exists(file_name)) {
    stop(paste0(file_name, " cannot be found."))
  }
  file_size <- file.size(file_name)
  file_path <- file.path(file_name)
  file_type <- mime::guess_type(file_name)
  url <- paste0(
    canvas$base_url, "/api/v1/folders/", folder_id,
    "/files"
  )
  payload <- list(
    content_type = file_type, name = file_name,
    size = file_size
  )
  response <- httr::POST(url, httr::add_headers(Authorization = paste(
    "Bearer",
    canvas$api_key
  )), body = payload, encode = "multipart")
  if (httr::status_code(response) != 200) {
    stop("Failed to create file upload. Please check your authentication and API endpoint.")
  }
  upload_data <- httr::content(response)
  upload_url <- upload_data$upload_url
  upload_params <- upload_data$upload_params
  upload_response <- httr::POST(upload_url,
    body = list(file = httr::upload_file(file_path)),
    encode = "multipart", query = upload_params
  )
  if (httr::status_code(upload_response) != 201) {
    stop("Failed to upload the file into the folder. Please check the file path and upload
          parameters.")
  }
  if (generate_message) message("The file has been succesfully uploaded.")
  return(httr::content(upload_response))
}
