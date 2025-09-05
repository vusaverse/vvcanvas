#' Retrieves folders of the current user.
#'
#' This function retrieves all folders associated with the user accessing the API.
#'
#' Returns a list of all folders 'owned by' the current user. Note that since `self` replaces
#' `user_id`, the id of the user accessing the API does not need to be specified. The
#' highest level folder name is `my folder`.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the
#' `canvas_authenticate` function.
#'
#' @return Returns a data frame containing the details on the folders available to the user
#' accessing the API.
#' @seealso [get_course_root_folder()] and [get_course_folders()]
#' @export
get_user_folders <- function(canvas) {
  url <- paste0(canvas$base_url, "/api/v1/users/self/folders")
  response <- httr::GET(url, httr::add_headers(Authorization = paste(
    "Bearer",
    canvas$api_key
  )))
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve your folders. Please check your authentication and API endpoint.")
  }

  responses <- paginate(response, canvas$api_key)

  folders_list <- lapply(responses, function(resp) {
    httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE) %>%
      as.data.frame()
  })

  folders <- dplyr::bind_rows(folders_list) %>% dplyr::arrange(.data$full_name)

  return(folders)
}
