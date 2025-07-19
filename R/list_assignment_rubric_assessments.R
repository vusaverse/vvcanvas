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
  # Initialize an empty data frame to store all assessments
  all_assessments <- data.frame()
  
  # Start with the first page
  page <- 1
  
  # Loop until all pages have been fetched
  while (TRUE) {
    # Construct the API endpoint URL
    url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/assignments/", assignment_id, "/rubric_assessments")
    
    # Prepare query parameters
    query_params <- list(per_page = per_page, page = page)
    
    # Add style parameter if provided
    if (!is.null(style)) {
      query_params$style <- style
    }
    
    # Make the API request
    response <- httr::GET(
      url,
      query = query_params,
      httr::add_headers(Authorization = paste("Bearer", canvas$api_key))
    )
    
    # Check the response status code
    if (httr::status_code(response) != 200) {
      stop("Failed to retrieve rubric assessments. Status code: ", httr::status_code(response), 
           ". Please check your authentication, course_id, assignment_id, and API endpoint.")
    }
    
    # Parse the response as JSON
    assessments <- httr::content(response, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE)
    
    # Check if we have assessment data
    if (length(assessments) > 0 && is.data.frame(assessments)) {
      # Append the assessments to the accumulated data frame
      all_assessments <- dplyr::bind_rows(all_assessments, assessments)
      
      # Print progress message
      message("Fetched ", nrow(assessments), " rubric assessments from page ", page)
      
      # Increment the page counter
      page <- page + 1
      
      # If we got fewer results than per_page, we've reached the end
      if (nrow(assessments) < per_page) {
        break
      }
    } else {
      # Break the loop if there are no more assessments
      break
    }
  }
  
  # Return the data frame of all rubric assessments
  return(all_assessments)
}