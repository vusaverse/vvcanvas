#' List All Enrollment Terms
#'
#' This function retrieves a paginated list of all enrollment terms for a specified account in Canvas LMS.
#'
#' @param canvas A list containing Canvas API configuration:
#'   \itemize{
#'     \item base_url: The base URL of your Canvas instance
#'     \item api_key: Your Canvas API key
#'   }
#' @param account_id The ID of the account for which to retrieve enrollment terms
#' @param per_page The number of terms to retrieve per page (default is 100)
#'
#' @return A dataframe containing all enrollment terms details
#'
#' @export
#'
list_all_enrollment_terms <- function(canvas, account_id, per_page = 100) {
  # Initialize an empty data frame to store all terms
  all_terms <- data.frame()

  # Start with the first page
  page <- 1

  # Loop until all pages have been fetched
  while (TRUE) {
    # Construct the API endpoint URL for the current page
    url <- paste0(canvas$base_url, "/api/v1/accounts/", account_id, "/terms")

    # Make the API request
    response <- httr::GET(
      url,
      query = list(per_page = per_page, page = page),
      httr::add_headers(Authorization = paste("Bearer", canvas$api_key))
    )

    # Check the response status code
    if (httr::status_code(response) != 200) {
      stop("Failed to retrieve enrollment terms. Please check your authentication and API endpoint.")
    }

    # Parse the response as JSON
    terms <- httr::content(response, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE)

    # Extract the enrollment terms from the response
    if (length(terms$enrollment_terms) > 0) {
      terms_df <- terms$enrollment_terms %>% dplyr::bind_rows()

      # Append the terms to the accumulated data frame
      all_terms <- dplyr::bind_rows(all_terms, terms_df)

      # Print progress message
      message("Fetched ", nrow(terms_df), " terms from page ", page)

      # Increment the page counter
      page <- page + 1
    } else {
      # Break the loop if there are no more terms
      break
    }
  }

  # Return the data frame of all enrollment terms
  return(all_terms)
}
