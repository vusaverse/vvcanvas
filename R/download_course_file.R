#' Downloads a file from a given URL.
#'
#' This function downloads a file from a specified URL and saves it locally.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param file_url The URL of the file to download.
#' @param download_path The path where the file should be downloaded.
#'
#' @return The path of the downloaded file.
#' @export
#' @examples
#' \dontrun{
#' # Download a file from a given URL
#' canvas <- canvas_authenticate(api_key, base_url)
#' file_url <- "https://example.com/file.pdf"
#' download_path <- "path/to/save/file.pdf"
#' file_path <- download_course_file(canvas, file_url, download_path)
#' }
#' @importFrom utils download.file
download_course_file <- function(canvas, file_url, download_path) {
  # Get the filename from the URL
  response <- httr::GET(file_url)

  # Extract filename including extension from the response url
  filename <- stringr::str_extract(response$url, paste0("\\b\\w+\\.(?i)(pdf|txt|csv|ppt|pptx)\\b"))

  # Set the path for the downloaded file
  file_path <- file.path(download_path, filename)

  # Download the file
  download_result <- tryCatch(
    {
      download.file(file_url, destfile = file_path, mode = "wb")
      file_path
    },
    error = function(e) {
      stop(paste("Failed to download file from URL:", file_url))
    }
  )

  return(download_result)
}
