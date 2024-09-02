#' Create a Module Item in Canvas LMS
#'
#' Creates a new item in a specific module in a specifc course using the Canvas LMS API.
#'
#' @param canvas A list containing the 'api_key' and 'base_url' for authentication.
#' @param course_id The ID of the course in which to create the module item.
#' @param module_id The ID of the module in which to create the item.
#' @param item_title The title of the new item within the module.
#' @param item_type The type of item. Defaults to "Page".
#' @param position (Optional) The position of the item within the module. Defaults to 1.
#' @param page_url (Optional) The url of the page.
#' @param page_id (Optional) The id of the page.
#'
#' @return A confirmation message that the page has been created.
#' @export
#'
create_module_item <- function(canvas, course_id, module_id, item_title, item_type = "Page",
                               position = NULL, page_url = NULL, page_id = NULL){

  # If the item is a page and its url is not given get the url of the page through its id
  if(item_type == "Page" & is.null(page_url)){
      url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/pages/", page_id)
      page <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))
      page_url <- httr::content(page)$url
  }

  # Construct the API endpoint URL
  url <- paste0(canvas$base_url, "/api/v1/courses/", course_id, "/modules/", module_id, "/items/")

  # Create the request payload
  payload <- list(
    "module_item" = list(
      "title" = item_title,
      "type" = item_type,
      "position" = position,
      "page_url" = page_url
    )
  )

  # Make the API request
  response <- httr::POST(url,
                         httr::add_headers(Authorization = paste("Bearer", canvas$api_key)),
                         body = payload,
                         encode = "json")

  # Check the response status code
  if (httr::status_code(response) != 200) {
      stop("Failed to create module item. Please check your authentication and API endpoint.")
  }

  # Return a confirmation message
  return("The module item has been created.")
}
