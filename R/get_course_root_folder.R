#' Retrieves root folder of a course.
#'
#' This function retrieves the root folder associated with a course.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the
#' `canvas_authenticate` function.
#' @param course_id The ID of the course for which to fetch associated folders.
#'
#' @return Returns a data frame containing the details on the root folder associated with the
#' specified course.
#' @seealso [get_course_folders()] and [get_user_folders()]
#' @export
get_course_root_folder <- function(canvas, course_id) #
{
  url <- paste0(
    canvas$base_url, "/api/v1/courses/", course_id, # get root folder
    "/folders/root"
  )
  response <- httr::GET(url, httr::add_headers(Authorization = paste(
    "Bearer",
    canvas$api_key
  )))
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve course root folder. Please check your authentication and API
          endpoint.")
  }
  root_folder <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    t() %>%
    as.data.frame()

  return(root_folder)
}
