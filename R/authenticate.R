#' Authenticate with Canvas LMS API
#'
#' Handles authentication with the Canvas LMS API using the provided API key and base URL.
#'
#' @param api_key The API key for authenticating with the Canvas LMS API.
#' @param base_url The base URL of the Canvas instance.
#'
#' @return A list containing the authenticated 'api_key' and 'base_url'.
#' @export
#' @examples
#' \dontrun{
#' # Authenticate with the Canvas LMS API
#' api_key <- "your_api_key"
#' base_url <- "https://canvas.example.com"
#' canvas <- canvas_authenticate(api_key, base_url)
#' }
canvas_authenticate <- function(api_key, base_url) {
  # Create a canvas object to store the API key and base URL
  canvas <- list(api_key = api_key, base_url = base_url)

  # Check if the base URL ends with a trailing slash and remove it if present
  if (substr(canvas$base_url, nchar(canvas$base_url), nchar(canvas$base_url)) == "/") {
    canvas$base_url <- substr(canvas$base_url, 1, nchar(canvas$base_url) - 1)
  }

  # Verify authentication by making a test request
  test_url <- paste0(canvas$base_url, "/api/v1/users/self")
  response <- httr::GET(test_url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Authentication failed. Please check your API key and base URL.")
  }

  # Return the canvas object
  return(canvas)
}
