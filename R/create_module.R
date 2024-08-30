#' Create a Module in Canvas LMS
#'
#' Creates a new module in a specific course using the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course in which to create the page.
#' @param module_name The title of the module.
#' @param position The position of this module in the course
#'
#' @return A confirmation message that the page has been created.
#' @export
#'
create_module <- function(canvas, course_id, module_name, position = NULL){
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/modules")

  # Create the request payload
  payload <- list(
    "module" = list(
      "name" = module_name,
      "position" = position
      )
  )

  # Make the API request
  response <- httr::POST(url,
                         httr::add_headers(Authorization = paste("Bearer", canvas$api_key)),
                         body = payload,
                         encode = "json")

  if (httr::status_code(response) != 200) {
        stop("Failed to create module. Please check your authentication and API endpoint.")
    }

  # Return a confirmation message
  return("The module has been created.")
}
