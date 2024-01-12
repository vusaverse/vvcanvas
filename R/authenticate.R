#' Authenticate with Canvas LMS API
#'
#' This function handles authentication with the Canvas LMS API.
#' It uses the provided API key and base URL, or falls back to the `CANVAS_API_KEY` and `CANVAS_BASE_URL` environment variables if none are provided.
#'
#' @param api_key The API key for authenticating with the Canvas LMS API. Defaults to the `CANVAS_API_KEY` environment variable.
#' @param base_url The base URL of the Canvas instance. Defaults to the `CANVAS_BASE_URL` environment variable.
#'
#' @return A list containing the authenticated 'api_key' and 'base_url'.
#'
#' @note The function verifies authentication by making a test request to the `/api/v1/users/self` endpoint of the Canvas instance.
#' If the response status code is not 200, it throws an error message indicating that authentication failed.
#'
#' @export
#' @examples
#' \dontrun{
#' # Authenticate with the Canvas LMS API
#' api_key <- "your_api_key"
#' base_url <- "https://canvas.example.com"
#' canvas <- canvas_authenticate(api_key, base_url)
#' }
canvas_authenticate <- function(api_key = canvas_api_key(), base_url = canvas_base_url()) {
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

#' Get the Canvas API key from the environment variable
#'
#' @return The Canvas API key stored in the CANVAS_API_KEY environment variable.
canvas_api_key <- function() {
  api_key <- Sys.getenv("CANVAS_API_KEY")
  if (api_key == "") {
    stop("CANVAS_API_KEY environment variable is not set.")
  }
  return(api_key)
}

#' Get the Canvas base URL from the environment variable
#'
#' @return The Canvas base URL stored in the CANVAS_BASE_URL environment variable.
canvas_base_url <- function() {
  base_url <- Sys.getenv("CANVAS_BASE_URL")
  if (base_url == "") {
    stop("CANVAS_BASE_URL environment variable is not set.")
  }
  return(base_url)
}
