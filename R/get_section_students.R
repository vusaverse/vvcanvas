#' Retrieve Students in a Section
#'
#' This function retrieves a list of students enrolled in a specific section of a course in Canvas LMS.
#'
#' @param canvas A list containing the Canvas API key and base URL, typically obtained through a `canvas_authenticate` function.
#' @param section_id The ID of the section for which to retrieve students.
#' @param per_page (Optional) The number of student records to retrieve per page of results. Defaults to 100.
#'
#' @return A data frame containing details of students enrolled in the specified section.
#' @export
#'
#' @examples
#' \dontrun{
#' canvas <- list(base_url = "https://your_canvas_instance.instructure.com", api_key = "your_api_key")
#' section_id <- "67890"
#' students <- get_section_students(canvas, section_id)
#' print(students)
#' }
#'
get_section_students <- function(canvas, section_id, per_page = 100) {
  url <- paste0(
    canvas$base_url, "/api/v1/sections/", section_id,
    "/enrollments?per_page=", per_page
  )
  response <- httr::GET(url, httr::add_headers(Authorization = paste(
    "Bearer",
    canvas$api_key
  )))
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve section students. Please check your authentication and API endpoint.")
  }
  section_students <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)
  return(section_students)
}
