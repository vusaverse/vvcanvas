#' List Course Rubrics
#'
#' Retrieves all rubrics attached to a course from the Canvas LMS API.
#'
#' @param canvas A list containing Canvas API configuration:
#'   \itemize{
#'     \item base_url: The base URL of your Canvas instance
#'     \item api_key: Your Canvas API key
#'   }
#' @param course_id The ID of the course for which to retrieve rubrics
#' @param include A character vector or string specifying additional information to include.
#'   Valid options are:
#'   \itemize{
#'     \item "associations": Include rubric associations
#'     \item "rubric_assessments": Include rubric assessments
#'   }
#'
#' @return A data frame containing course rubric objects with all available metadata
#'
#' @details This function calls the Canvas API endpoint:
#' \code{GET /api/v1/courses/:course_id/rubrics}
#'
#' The function supports pagination and will return all rubrics for the course.
#' The \code{include} parameter allows you to retrieve additional associated data
#' such as rubric associations and assessments.
#'
#' @examples
#' \dontrun{
#' # Set up canvas connection
#' canvas <- canvas_authenticate(
#'   base_url = "https://your-institution.instructure.com",
#'   api_key = "your-api-key"
#' )
#' 
#' # Get all rubrics for a course
#' rubrics <- list_course_rubrics(canvas, course_id = 12345)
#' 
#' # Get rubrics with associations included
#' rubrics_with_associations <- list_course_rubrics(
#'   canvas, 
#'   course_id = 12345,
#'   include = "associations"
#' )
#' 
#' # Get rubrics with multiple include options
#' rubrics_full <- list_course_rubrics(
#'   canvas,
#'   course_id = 12345, 
#'   include = c("associations", "rubric_assessments")
#' )
#' }
#'
#' @export
#'
list_course_rubrics <- function(canvas, course_id, include = NULL) {
  # Validate inputs
  if (missing(canvas) || !is.list(canvas)) {
    stop("canvas must be a list containing 'base_url' and 'api_key'")
  }
  
  if (missing(course_id) || !is.numeric(course_id) && !is.character(course_id)) {
    stop("course_id must be provided as a numeric or character value")
  }
  
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/rubrics")
  
  # Build query parameters
  query_params <- list()
  
  # Handle include parameter
  if (!is.null(include)) {
    if (is.character(include) && length(include) > 0) {
      # Convert vector to comma-separated string if needed
      include_str <- if (length(include) > 1) {
        paste(include, collapse = ",")
      } else {
        include
      }
      query_params$include <- include_str
    } else {
      warning("include parameter should be a character vector; ignoring invalid value")
    }
  }
  
  # Make the initial API request
  response <- httr::GET(
    url,
    query = query_params,
    httr::add_headers(Authorization = paste("Bearer", canvas$api_key))
  )
  
  # Check the response status code
  if (httr::status_code(response) != 200) {
    error_message <- paste("Failed to retrieve course rubrics. Status code:", httr::status_code(response))
    
    # Try to extract error details from response
    if (httr::status_code(response) == 401) {
      error_message <- paste(error_message, "Please check your authentication credentials.")
    } else if (httr::status_code(response) == 404) {
      error_message <- paste(error_message, "Course not found. Please check the course_id.")
    }
    
    stop(error_message)
  }
  
  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)
  
  # Parse and combine all results
  rubrics_list <- lapply(responses, function(resp) {
    content <- httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE)
    
    # Handle case where content is empty or not a data frame
    if (length(content) == 0) {
      return(data.frame())
    }
    
    # Convert to data frame if it's a list
    if (is.list(content) && !is.data.frame(content)) {
      content <- dplyr::bind_rows(content)
    }
    
    return(content)
  })
  
  # Combine all results
  all_rubrics <- dplyr::bind_rows(rubrics_list)
  
  # Handle case where no rubrics are returned
  if (nrow(all_rubrics) == 0) {
    message("No rubrics found for course ", course_id)
    return(data.frame())
  }
  
  # Return the data frame of rubrics
  return(all_rubrics)
}