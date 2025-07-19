#' Get course-level student summary analytics from Canvas LMS API
#'
#' Retrieves detailed per-student analytics including participation, page views, 
#' submissions, and other engagement metrics for a specific course from the Canvas LMS API. 
#' This function provides enhanced filtering and sorting capabilities compared to the basic 
#' \code{\link{get_student_summaries}} function.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course for which to retrieve student summary analytics.
#' @param sort_column Optional character string specifying the column to sort by. 
#'   Common options include "name", "participations", "page_views". Default is NULL (no sorting).
#' @param student_id Optional character or integer specifying a specific student ID to filter results. 
#'   Default is NULL (all students).
#' @param per_page Number of student summaries to retrieve per page. Default is 100.
#'
#' @return A data frame containing per-student analytics with columns for student information,
#'   participation counts, page views, submissions, and max values for benchmarking.
#'   The structure matches other analytics functions in this package.
#'
#' @details 
#' This function calls the Canvas Analytics API endpoint:
#' \url{https://canvas.instructure.com/doc/api/analytics.html#method.analytics_api.course_student_summaries}
#'
#' The returned data includes:
#' \itemize{
#'   \item Student identification information
#'   \item Participation metrics (discussion posts, etc.)
#'   \item Page view counts and patterns
#'   \item Assignment submission statistics
#'   \item Max values for each metric to enable benchmarking
#' }
#'
#' @examples
#' \dontrun{
#' # Basic usage - get all student summaries
#' canvas <- list(api_key = "your_api_key", base_url = "https://your-institution.instructure.com")
#' summaries <- get_course_analytics_student_summaries(canvas, course_id = 12345)
#' 
#' # Sort by participation count
#' summaries_sorted <- get_course_analytics_student_summaries(
#'   canvas, 
#'   course_id = 12345, 
#'   sort_column = "participations"
#' )
#' 
#' # Get data for a specific student
#' student_data <- get_course_analytics_student_summaries(
#'   canvas, 
#'   course_id = 12345, 
#'   student_id = 67890
#' )
#' 
#' # Combine sorting and pagination
#' page1 <- get_course_analytics_student_summaries(
#'   canvas, 
#'   course_id = 12345, 
#'   sort_column = "page_views", 
#'   per_page = 50
#' )
#' }
#'
#' @seealso 
#' \code{\link{get_student_summaries}} for basic student summary retrieval,
#' \code{\link{get_course_participation}} for course-level participation data,
#' \code{\link{get_user_course_participation_data}} for individual user participation data
#'
#' @export
get_course_analytics_student_summaries <- function(canvas, course_id, sort_column = NULL, student_id = NULL, per_page = 100) {
  
  # Validate input parameters
  if (missing(canvas) || !is.list(canvas) || !all(c("api_key", "base_url") %in% names(canvas))) {
    stop("The 'canvas' parameter must be a list containing 'api_key' and 'base_url'.")
  }
  
  if (missing(course_id) || (!is.numeric(course_id) && !is.character(course_id))) {
    stop("The 'course_id' parameter must be numeric or character.")
  }
  
  if (!is.null(sort_column) && (!is.character(sort_column) || length(sort_column) != 1)) {
    stop("The 'sort_column' parameter must be a single character string or NULL.")
  }
  
  if (!is.null(student_id) && (!is.numeric(student_id) && !is.character(student_id))) {
    stop("The 'student_id' parameter must be numeric, character, or NULL.")
  }
  
  if (!is.numeric(per_page) || per_page <= 0) {
    stop("The 'per_page' parameter must be a positive numeric value.")
  }
  
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/analytics/student_summaries")
  
  # Build query parameters
  params <- list(per_page = per_page)
  
  if (!is.null(sort_column)) {
    params$sort_column <- sort_column
  }
  
  if (!is.null(student_id)) {
    params$student_id <- student_id
  }
  
  # Add query parameters to URL
  if (length(params) > 0) {
    param_strings <- paste0(names(params), "=", sapply(params, utils::URLencode, reserved = TRUE))
    query_string <- paste(param_strings, collapse = "&")
    url <- paste0(url, "?", query_string)
  }
  
  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))
  
  # Check the response status code
  if (httr::status_code(response) != 200) {
    error_message <- paste0("Failed to retrieve course analytics student summaries. HTTP status: ", 
                           httr::status_code(response))
    
    # Try to extract error details from response
    if (httr::has_content(response)) {
      tryCatch({
        error_content <- httr::content(response, "text", encoding = "UTF-8")
        error_json <- jsonlite::fromJSON(error_content)
        if ("message" %in% names(error_json)) {
          error_message <- paste0(error_message, ". Error: ", error_json$message)
        }
      }, error = function(e) {
        # If we can't parse the error, just use the generic message
      })
    }
    
    error_message <- paste0(error_message, ". Please check your authentication, course_id, and API endpoint.")
    stop(error_message)
  }
  
  # Parse the response as JSON
  student_analytics <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)
  
  # Convert to data frame if it's a list (for consistency with other analytics functions)
  if (is.list(student_analytics) && !is.data.frame(student_analytics)) {
    # Handle case where API returns an object with data and metadata
    if ("data" %in% names(student_analytics)) {
      result <- student_analytics$data
      if (is.list(result) && length(result) > 0) {
        result <- data.frame(result, stringsAsFactors = FALSE)
      }
    } else {
      # Convert list to data frame
      if (length(student_analytics) > 0) {
        result <- tryCatch({
          data.frame(student_analytics, stringsAsFactors = FALSE)
        }, error = function(e) {
          # If conversion fails, return as-is
          student_analytics
        })
      } else {
        result <- data.frame()  # Empty data frame for consistency
      }
    }
  } else {
    result <- student_analytics
  }
  
  # Return the student analytics data
  return(result)
}