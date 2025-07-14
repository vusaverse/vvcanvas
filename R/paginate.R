#' Helper to paginate Canvas API GET requests
#'
#' Follows 'next' links in the Link header to retrieve all pages.
#' Returns a list of all responses.
#'
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
extract_next_url <- function(link_header) {
  matches <- regmatches(link_header, gregexpr('<[^>]+>; rel="next"', link_header))[[1]]
  if (length(matches) == 0) return(NULL)
  url <- sub('^<([^>]+)>; rel="next"$', '\\1', matches[1])
  return(url)
}

#' Appends access_token to URL if not present
append_access_token <- function(url, access_token) {
  if (grepl('access_token=', url)) return(url)
  sep <- ifelse(grepl('\\?', url), '&', '?')
  paste0(url, sep, 'access_token=', access_token)
}
