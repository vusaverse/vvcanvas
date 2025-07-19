#' List User Activity Stream
#'
#' Retrieves the activity stream (recent activities/stories) for a specified user from the Canvas LMS API.
#' The activity stream contains recent activities such as assignments, discussions, announcements, and other course interactions.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param user_id The ID of the user whose activity stream to retrieve. Defaults to "self" for the authenticated user.
#' @param per_page Number of activity items to retrieve per page. Default is 100.
#' @param ... Additional parameters to pass to the API request.
#'
#' @return A list of activity stream objects retrieved from the Canvas LMS API. Each object represents a story/activity.
#' 
#' @details
#' The activity stream returns Canvas "stories" which are activity objects that represent recent user activities.
#' These may include course activities, announcements, assignment submissions, discussion posts, and other interactions.
#' 
#' The API endpoint used is: \code{GET /api/v1/users/:user_id/activity_stream}
#' 
#' @examples
#' \dontrun{
#' # Get activity stream for the authenticated user
#' canvas <- canvas_authenticate()
#' activities <- list_user_activity_stream(canvas)
#' 
#' # Get activity stream for a specific user
#' activities <- list_user_activity_stream(canvas, user_id = "12345")
#' 
#' # Get activity stream with custom pagination
#' activities <- list_user_activity_stream(canvas, per_page = 50)
#' }
#' 
#' @seealso 
#' \url{https://canvas.instructure.com/doc/api/users.html#method.users.activity_stream}
#' 
#' @export
list_user_activity_stream <- function(canvas, user_id = "self", per_page = 100, ...) {
  # Construct the base API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/users/", user_id, "/activity_stream")
  
  # Build query parameters
  query_params <- list(per_page = per_page, ...)
  
  # Make the API request
  response <- httr::GET(url, query = query_params, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))
  
  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve user activity stream. Please check your authentication and API endpoint.")
  }
  
  # Parse the response as JSON
  activity_stream <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)
  
  # Return the activity stream
  return(activity_stream)
}