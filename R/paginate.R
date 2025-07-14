#' Helper to paginate Canvas API GET requests
#'
#' Follows 'next' links in the Link header to retrieve all pages.
#' Returns a list of all responses.
#'
#' @param initial_response The initial httr response object from the first GET request.
#' @param access_token The Canvas API access token (string).
#' @param showProgress Logical; whether to print progress as pages are fetched. Default is TRUE.
#'
#' @return A list of httr response objects, one for each page.
#' @export
paginate <- function(initial_response, access_token, showProgress = TRUE) {
  responses <- list(initial_response)
  link_header <- httr::headers(initial_response)[[grep("^link$", names(httr::headers(initial_response)), ignore.case = TRUE)]]
  while (!is.null(link_header) && grepl('rel="next"', link_header, ignore.case = TRUE)) {
    next_url <- extract_next_url(link_header)
    next_url <- append_access_token(next_url, access_token)
    next_response <- httr::GET(next_url, httr::add_headers(Authorization = paste("Bearer", access_token)))
    responses <- c(responses, list(next_response))
    link_header <- httr::headers(next_response)[[grep("^link$", names(httr::headers(next_response)), ignore.case = TRUE)]]
    if (showProgress) cat(".")
  }
  if (showProgress) cat("\n")
  return(responses)
}

#' Extracts the 'next' URL from a Link header
#'
#' @param link_header The Link header string from an httr response.
#'
#' @return The URL (character) for the next page, or NULL if not present.
#' @export
extract_next_url <- function(link_header) {
  matches <- regmatches(link_header, gregexpr('<[^>]+>; rel="next"', link_header))[[1]]
  if (length(matches) == 0) return(NULL)
  url <- sub('^<([^>]+)>; rel="next"$', '\\1', matches[1])
  return(url)
}

#' Appends access_token to URL if not present
#'
#' @param url The URL to which the access_token should be appended.
#' @param access_token The Canvas API access token (string).
#'
#' @return The URL with the access_token appended if it was not already present.
#' @export
append_access_token <- function(url, access_token) {
  if (grepl('access_token=', url)) return(url)
  sep <- ifelse(grepl('\\?', url), '&', '?')
  paste0(url, sep, 'access_token=', access_token)
}
