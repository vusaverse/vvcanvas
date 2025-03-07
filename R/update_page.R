#' Update a Page in Canvas LMS
#'
#' Updates an existing page in a specific course using the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course in which to create the page.
#' @param page_id The ID of the page.
#' @param page_params A named list of page parameters to update. This list can include:
#'   \describe{
#'     \item{title}{(string) The title for the updated page.}
#'     \item{body}{(string) The content for the updated page.}
#'     \item{published}{(boolean) Whether the page is published (\code{TRUE}) or draft state (\code{FALSE}).}
#'     \item{published_at}{(DateTime) Schedule a future date/time to publish the page.}
#'   }
#'
#' @return A confirmation message that the page has been updated.
#' @export
#'
update_page <- function (canvas, course_id, page_id, page_params)
{
    url <- paste0(canvas$base_url, "/api/v1/courses/", course_id,
        "/pages/", page_id)
    response <- httr::PUT(url, httr::add_headers(Authorization = paste("Bearer",
        canvas$api_key)), body = list(wiki_page = page_params), encode = "json")
    if (httr::status_code(response) != 200) {
        stop("Failed to update page. Please check your authentication, course ID, page ID, and parameters.")
    }
    updated_page <- httr::content(response, "parsed")
    return(updated_page)
}
