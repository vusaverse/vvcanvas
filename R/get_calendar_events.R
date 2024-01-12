#' Get Calendar Events from Canvas LMS API
#'
#' Retrieve the paginated list of calendar events or assignments for the current user.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param type The type of events to retrieve. Default is "event". Allowed values: event, assignment.
#' @param start_date Only return events since the start_date (inclusive). Defaults to today.
#' @param end_date Only return events before the end_date (inclusive). Defaults to start_date.
#' @param undated Defaults to false (dated events only). If true, only return undated events and ignore start_date and end_date.
#' @param all_events Defaults to false (uses start_date, end_date, and undated criteria). If true, all events are returned, ignoring start_date, end_date, and undated criteria.
#' @param context_codes List of context codes of courses, groups, users, or accounts whose events you want to see. If not specified, defaults to the current user (i.e personal calendar, no course/group events).
#' @param excludes Array of attributes to exclude. Possible values are “description”, “child_events” and “assignment”.
#' @param includes Array of optional attributes to include. Possible values are “web_conference” and if calendar_series flag is on, “series_natural_language”.
#' @param important_dates Defaults to false. If true, only events with important dates set to true will be returned.
#' @param blackout_date Defaults to false. If true, only events with blackout date set to true will be returned.
#'
#' @return A data frame of calendar events retrieved from the Canvas LMS API.
#' @export
#'
get_calendar_events <- function(canvas, type = "event", start_date = NULL, end_date = NULL, undated = FALSE, all_events = FALSE, context_codes = NULL, excludes = NULL, includes = NULL, important_dates = FALSE, blackout_date = FALSE) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/calendar_events")

  # Check the type of events
  stopifnot("`type` must be either 'event' or 'assignment'." = type %in% c("event", "assignment"))

  # Check the start_date and end_date
  if (!is.null(start_date)) {
    stopifnot("`start_date` must be a Date." = class(start_date) == "Date")
  }
  if (!is.null(end_date)) {
    stopifnot("`end_date` must be a Date." = class(end_date) == "Date")
  }

  # Check the undated and all_events
  stopifnot("`undated` and `all_events` must be logical." = is.logical(c(undated, all_events)))

  # Check the context_codes
  if (!is.null(context_codes)) {
    stopifnot("`context_codes` must be a character vector." = is.character(context_codes))
  }

  # Check the excludes and includes
  if (!is.null(excludes)) {
    stopifnot("`excludes` must be a character vector." = is.character(excludes))
  }
  if (!is.null(includes)) {
    stopifnot("`includes` must be a character vector." = is.character(includes))
  }

  # Check the important_dates and blackout_date
  stopifnot("`important_dates` and `blackout_date` must be logical." = is.logical(c(important_dates, blackout_date)))



  # Create query parameters
  params <- list()
  if (!is.null(type)) {
    params[["type"]] <- type
  }
  if (!is.null(start_date)) {
    params[["start_date"]] <- start_date
  }
  if (!is.null(end_date)) {
    params[["end_date"]] <- end_date
  }
  if (undated) {
    params[["undated"]] <- TRUE
  }
  if (all_events) {
    params[["all_events"]] <- TRUE
  }
  if (!is.null(context_codes)) {
    params[["context_codes[]"]] <- context_codes
  }
  if (!is.null(excludes)) {
    params[["excludes[]"]] <- excludes
  }
  if (!is.null(includes)) {
    params[["includes[]"]] <- includes
  }
  if (important_dates) {
    params[["important_dates"]] <- TRUE
  }
  if (blackout_date) {
    params[["blackout_date"]] <- TRUE
  }

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)), query = params)

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve calendar events. Please check your authentication and API endpoint.")
  }

  # Parse the response as JSON
  events <- httr::content(response, "text", encoding = "UTF-8") %>%
    jsonlite::fromJSON(flatten = TRUE)

  # Return the list of calendar events
  return(events)
}
