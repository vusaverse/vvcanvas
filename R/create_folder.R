#' Create a Folder in Canvas LMS
#'
#' Creates a new folder in a specific course using the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course in which to create the folder.
#' @param folder_name The name of the folder.
#' @param parent_folder_id (Optional) The ID of the parent folder in which to create the folder.
#'
#' @return A confirmation message that the folder has been created.
#' @export
#'
create_folder <- function(canvas, course_id, folder_name, parent_folder_id = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/folders")

  # Create the request payload
  payload <- list(
    "name" = folder_name,
    "parent_folder_id" = parent_folder_id
  )

  # Make the API request
  response <- httr::POST(url,
                         httr::add_headers(Authorization = paste("Bearer", canvas$api_key)),
                         body = payload,
                         encode = "json")

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to create folder. Please check your authentication and API endpoint.")
  }

  # Return a confirmation message
  return("The folder has been created.")
}
