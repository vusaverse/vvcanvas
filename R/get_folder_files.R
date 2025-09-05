#' Retrieves files in a specific folder.
#'
#' This function lists all files available in a specific folder.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the
#' `canvas_authenticate` function.
#' @param folder_id The ID of the folder for which to fetch associated files.
#'
#' @return Returns a data frame containing the details on the files stored in the specified folder.
#' @export
get_folder_files <- function (canvas, folder_id)
{
    url <- paste0(canvas$base_url, "/api/v1/folders/", folder_id, "/files")
    response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer",
        canvas$api_key)))
    if (httr::status_code(response) != 200) {
        stop("Failed to retrieve the files in this folder. Please check your authentication and
          API endpoint.")
    }

    responses <- paginate(response, canvas$api_key)
    files_list <- lapply(responses, function(resp) {
      httr::content(resp, "text", encoding = "UTF-8") %>% jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
    })

    files <- dplyr::bind_rows(files_list)

    return(files)
}
