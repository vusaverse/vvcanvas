#' Queries progress.
#'
#' This function queries the progress of asynchronous API operations.
#'
#' It performs 10 attempts with a pause of 6 seconds between them.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the
#' `canvas_authenticate` function.
#' @param progress_url The url where a progress update can be retrieved.
#' @param attempts The number of times it is allowed to check progress.
#'
#' @return a message indicating completion and status information about the asynchronous job.
#' @export
query_progress <- function(canvas, progress_url, attempts = 10) {
  progress <- FALSE
  while (progress == FALSE && attempts > 0) {
    response <- httr::GET(progress_url, httr::add_headers(Authorization = paste(
      "Bearer",
      canvas$api_key
    )))
    if (progress <- (httr::content(response)$workflow_state == "completed")) {
      message("Operation has been completed.")
    } else {
      attempts <- attempts - 1
      Sys.sleep(6)
      if (attempts == 0) {
        message("Operation has not yet been completed.", appendLF = FALSE)
      } else {
        message(".", appendLF = FALSE)
      }
    }
  }
}
