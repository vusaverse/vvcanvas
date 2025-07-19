#' Get Course Rubric from Canvas LMS API
#'
#' Retrieves full details of a single rubric for a given course from the Canvas LMS API.
#' This function returns comprehensive rubric information including all criteria and ratings.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course containing the rubric.
#' @param rubric_id The ID of the specific rubric to retrieve.
#' @param include (Optional) Additional associations to include. Can be a single string or vector of strings.
#'   Options include "associations" and "rubric_assessments".
#'
#' @return A data frame containing the complete rubric object with all criteria and ratings.
#'
#' @details
#' This function calls the Canvas API endpoint \code{GET /api/v1/courses/:course_id/rubrics/:id}
#' to retrieve detailed information about a specific rubric. The rubric object includes
#' all criteria, ratings, and optionally associated data based on the include parameter.
#'
#' @examples
#' \dontrun{
#' # Authenticate with Canvas
#' canvas <- canvas_authenticate(api_key = "your_api_key", base_url = "https://your.canvas.url")
#'
#' # Get a basic rubric
#' rubric <- get_course_rubric(canvas, course_id = 12345, rubric_id = 67890)
#'
#' # Get rubric with associations
#' rubric_with_assoc <- get_course_rubric(canvas, course_id = 12345, rubric_id = 67890, 
#'                                        include = "associations")
#'
#' # Get rubric with multiple includes
#' full_rubric <- get_course_rubric(canvas, course_id = 12345, rubric_id = 67890,
#'                                  include = c("associations", "rubric_assessments"))
#' }
#'
#' @seealso
#' \url{https://canvas.instructure.com/doc/api/rubrics.html#method.rubrics_api.show}
#'
#' @export
get_course_rubric <- function(canvas, course_id, rubric_id, include = NULL) {
  # Construct the base API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/rubrics/", rubric_id)
  
  # Add the 'include' parameter to the URL if it's not NULL
  if (!is.null(include)) {
    # Validate include parameter values
    legal_values <- c("associations", "rubric_assessments")
    if (any(!include %in% legal_values)) {
      stop("The 'include' parameter must use legal values: 'associations', 'rubric_assessments'.")
    }
    
    url <- paste0(url, "?include[]=", paste(include, collapse = "&include[]="))
  }
  
  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))
  
  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve course rubric. Please check your authentication, course ID, rubric ID, and API endpoint.")
  }
  
  # Parse the response as JSON and convert to a dataframe
  rubric_data <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    dplyr::bind_rows()
  
  # Add metadata for consistency with other functions
  rubric_data <- rubric_data %>%
    dplyr::mutate(
      course_id = course_id,
      retrieved_at = Sys.time()
    )
  
  # Return the rubric data frame
  return(rubric_data)
}