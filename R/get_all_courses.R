#' Retrieves a paginated list of all courses visible in the public index.
#'
#' This function retrieves a paginated list of all courses visible in the public index
#' using the Canvas LMS API.
#' *NOTE* This function might take a while to finish.
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param per_page (Optional) The number of courses to retrieve per page of results (default is 100).
#'
#' @return A data frame of courses visible in the public index.
#' @export
get_all_courses <- function(canvas, per_page = 100) {
  # Initialize an empty data frame to store the courses
  all_courses <- data.frame()

  # Start with the first page
  page <- 1

  # Loop until all pages have been fetched
  while (TRUE) {
    # Construct the API endpoint URL for the current page
    url <- paste0(canvas$base_url, "/api/v1/search/all_courses?per_page=", per_page, "&page=", page)

    # Make the API request
    response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

    # Check the response status code
    if (httr::status_code(response) != 200) {
      stop("Failed to retrieve all courses. Please check your authentication and API endpoint.")
    }

    # Parse the response as JSON
    courses <- httr::content(response, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE)

    # Append the courses to the accumulated data frame
    all_courses <- dplyr::bind_rows(all_courses, courses)

    # Print progress message
    message("Fetched", nrow(courses), "courses from page", page, "\n")

    # Increment the page counter
    page <- page + 1

    # Break the loop if there are no more courses
    if (length(courses) == 0) {
      break
    }
  }

  # Return the data frame of all courses
  return(all_courses)
}
