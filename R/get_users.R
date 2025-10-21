#' Get all users from an account
#'
#' Retrieves users from a specific account in the Canvas LMS API with optional filtering and pagination.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param account_id The ID of the account. Defaults to "self" for the current user's account.
#' @param per_page The number of entries to show per page. Default is 100.
#' @param search_term Optional. The partial name or full ID of the users to match and return in the results list. Must be at least 3 characters.
#' @param enrollment_type Optional. When set, only return users enrolled with the specified course-level base role. Possible values: 'student', 'teacher', 'ta', 'observer', or 'designer'.
#' @param sort Optional. The column to sort results by. Possible values: 'username', 'email', 'sis_id', 'integration_id', 'last_login', 'id'.
#' @param order Optional. The order to sort the given column by. Possible values: 'asc', 'desc'.
#' @param include_deleted_users Optional. When set to TRUE, returns users who have deleted pseudonyms for the context.
#' @param uuids Optional. A vector of UUIDs. When set, only return users with the specified UUIDs. UUIDs after the first 100 are ignored.
#' @param include Optional. A vector of additional information to include. Possible values include: "email", "enrollments", "avatar_url", "bio", "last_login", "time_zone", "locale", "uuid".
#'
#' @return A data frame containing the users matching the specified criteria.
#' @export
#'
#' @examples
#' \dontrun{
#' # Authenticate with Canvas
#' canvas <- canvas_authenticate()
#'
#' # Get all users from the default account
#' users <- get_users(canvas)
#'
#' # Get users with a search term
#' users <- get_users(canvas, search_term = "John")
#'
#' # Get users with email addresses included
#' users <- get_users(canvas, include = c("email", "enrollments"))
#' }
get_users <- function(canvas,
                      account_id = "self",
                      per_page = 100,
                      search_term = NULL,
                      enrollment_type = NULL,
                      sort = NULL,
                      order = NULL,
                      include_deleted_users = NULL,
                      uuids = NULL,
                      include = NULL) {
  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/accounts/", account_id, "/users?per_page=", per_page)

  # Add search_term parameter if provided
  if (!is.null(search_term)) {
    url <- paste0(url, "&search_term=", URLencode(search_term, reserved = TRUE))
  }

  # Add enrollment_type parameter if provided
  if (!is.null(enrollment_type)) {
    # Validate enrollment_type
    valid_types <- c("student", "teacher", "ta", "observer", "designer")
    if (!enrollment_type %in% valid_types) {
      stop("enrollment_type must be one of: 'student', 'teacher', 'ta', 'observer', 'designer'")
    }
    url <- paste0(url, "&enrollment_type=", enrollment_type)
  }

  # Add sort parameter if provided
  if (!is.null(sort)) {
    # Validate sort
    valid_sorts <- c("username", "email", "sis_id", "integration_id", "last_login", "id")
    if (!sort %in% valid_sorts) {
      stop("sort must be one of: 'username', 'email', 'sis_id', 'integration_id', 'last_login', 'id'")
    }
    url <- paste0(url, "&sort=", sort)
  }

  # Add order parameter if provided
  if (!is.null(order)) {
    # Validate order
    valid_orders <- c("asc", "desc")
    if (!order %in% valid_orders) {
      stop("order must be one of: 'asc', 'desc'")
    }
    url <- paste0(url, "&order=", order)
  }

  # Add include_deleted_users parameter if provided
  if (!is.null(include_deleted_users)) {
    if (!is.logical(include_deleted_users)) {
      stop("include_deleted_users must be a logical value (TRUE or FALSE)")
    }
    url <- paste0(url, "&include_deleted_users=", tolower(as.character(include_deleted_users)))
  }

  # Add uuids parameter if provided
  if (!is.null(uuids)) {
    if (!is.vector(uuids)) {
      stop("uuids must be a vector")
    }
    # Only use first 100 UUIDs as per API documentation
    uuids_limited <- head(uuids, 100)
    url <- paste0(url, "&uuids[]=", paste(uuids_limited, collapse = "&uuids[]="))
  }

  # Add include parameters if provided
  if (!is.null(include) && length(include) > 0) {
    url <- paste0(url, "&include[]=", paste(include, collapse = "&include[]="))
  }

  # Make the API request
  response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

  # Check the response status code
  if (httr::status_code(response) != 200) {
    stop("Failed to retrieve users. Please check authentication and API endpoint.")
  }

  # Use pagination helper to get all pages
  responses <- paginate(response, canvas$api_key)

  # Parse and combine all results
  users_list <- lapply(responses, function(resp) {
    content <- httr::content(resp, "text", encoding = "UTF-8")
    if (nchar(content) > 0) {
      jsonlite::fromJSON(content, flatten = TRUE) %>%
        as.data.frame()
    } else {
      data.frame()
    }
  })

  users <- dplyr::bind_rows(users_list)

  # Return the users data frame
  return(users)
}
