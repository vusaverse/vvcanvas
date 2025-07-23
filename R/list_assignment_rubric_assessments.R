#' List Assignment Rubric Assessments
#'
#' This function retrieves a list of all rubric assessments for a specific assignment in Canvas LMS.
#'
#' @param canvas A list containing Canvas API configuration:
#'   \itemize{
#'     \item base_url: The base URL of your Canvas instance
#'     \item api_key: Your Canvas API key
#'   }
#' @param course_id The ID of the course containing the assignment
#' @param assignment_id The ID of the assignment for which to retrieve rubric assessments
#' @param style (Optional) The style parameter for the assessments. Common values include 
#'   "full" for complete assessment data, or "comments_only" for comment data only.
#' @param per_page (Optional) The number of assessments to retrieve per page (default is 100)
#'
#' @return A data frame containing all rubric assessments for the specified assignment
#'
#' @examples
#' \dontrun{
#' # Authenticate with Canvas
#' canvas <- canvas_authenticate("your_api_key", "https://your-canvas-instance.com")
#' 
#' # Get all rubric assessments for an assignment
#' assessments <- list_assignment_rubric_assessments(canvas, 12345, 67890)
#' 
#' # Get rubric assessments with full style
#' assessments_full <- list_assignment_rubric_assessments(canvas, 12345, 67890, style = "full")
#' }
#'
#' @references Canvas API documentation: \url{https://canvas.instructure.com/doc/api/rubric_assessments.html}
#'
#' @export
#'
list_assignment_rubric_assessments <- function(canvas, course_id, assignment_id, style = NULL, per_page = 100) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/assignments/", assignment_id, "/rubric_assessments?per_page=", per_page)
  
  # Add style parameter if provided
  if (!is.null(style)) {
    url <- paste0(url, "&style=", style)
  }
  
  # Make the initial API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))
  
  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)
  
  # Parse and combine all results
  assessments_list <- lapply(responses, function(resp) {
    content <- httr::content(resp, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE)
    
    # Handle case where content might be empty or not a data frame
    if (length(content) > 0 && (is.data.frame(content) || is.list(content))) {
      return(as.data.frame(content))
    } else {
      return(data.frame())
    }
  })
  
  # Combine all results
  all_assessments <- dplyr::bind_rows(assessments_list)
  
  # Return the data frame of all rubric assessments
  return(all_assessments)
}