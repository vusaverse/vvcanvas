#' Retrieves the list of students in a course.
#'
#' This function retrieves the list of students enrolled in a specific course in the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to fetch the students.
#' @param per_page (Optional) The number of students to retrieve per page of results (default is 100).
#'
#' @return A data frame of students enrolled in the specified course.
#' @export
#'
get_course_students <- function(canvas, course_id, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/students?per_page=", per_page)

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve course students. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  students <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the data frame of students
  return(students)
}
