#' Get status of a report
#'
#' This function retrieves the status of a specific report from the Canvas LMS API.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param account_id The ID of the account containing the report.
#' @param report_type The type of report (e.g., "course_sis_export", "provisioning_csv", "students_csv").
#' @param report_id The ID of the specific report to check status for.
#'
#' @return A data frame containing the report status information.
#' @export
#'
get_report_status <- function(canvas, account_id, report_type, report_id) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/accounts/", account_id, "/reports/", report_type, "/", report_id)
  
  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve report status. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  report_status <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE) %>%
    as.data.frame() %>%
    dplyr::mutate(account_id = account_id)

  # Return the report status data frame
  return(report_status)
}