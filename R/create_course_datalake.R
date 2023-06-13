#' Create a data lake for a course.
#'
#' This function retrieves data from various endpoints for a specific course in the Canvas LMS API
#' and stores the data as JSON files in a specified storage location.
#'
#' @param canvas An object containing the Canvas API key and base URL, obtained through the `canvas_authenticate` function.
#' @param course_id The ID of the course for which to create the data lake.
#' @param storage_location The path to the storage location where the data files will be saved.
#' @return NULL.
#'
#' @export
#' @note This function retrieves data from various endpoints. Access to certain endpoints may require specific roles.
create_course_datalake <- function(canvas, course_id, storage_location) {
  # Check if the storage location exists and create it if not
  if (!dir.exists(storage_location)) {
    dir.create(storage_location, recursive = TRUE)
  }

  # Define the list of endpoints to retrieve data from
  endpoints <- list(
    "details" = "/api/v1/courses/{course_id}",
    "analytics" = "/api/v1/courses/{course_id}/analytics",
    "assignments" = "/api/v1/courses/{course_id}/assignments",
    "assignment_groups" = "/api/v1/courses/{course_id}/assignment_groups",
    "conferences" = "/api/v1/courses/{course_id}/conferences",
    "discussion_topics" = "/api/v1/courses/{course_id}/discussion_topics",
    "files" = "/api/v1/courses/{course_id}/files",
    "folders" = "/api/v1/courses/{course_id}/folders",
    "modules" = "/api/v1/courses/{course_id}/modules",
    "module_items" = "/api/v1/courses/{course_id}/modules/items",
    "outcomes" = "/api/v1/courses/{course_id}/outcomes",
    "pages" = "/api/v1/courses/{course_id}/pages",
    "quizzes" = "/api/v1/courses/{course_id}/quizzes",
    "rubrics" = "/api/v1/courses/{course_id}/rubrics",
    "sections" = "/api/v1/courses/{course_id}/sections",
    "assignments_for_grade_export" = "/api/v1/courses/{course_id}/assignments/for_grade_export",
    "enrollments" = "/api/v1/courses/{course_id}/enrollments",
    "student_enrollments" = "/api/v1/courses/{course_id}/enrollments?type[]=student",
    "teacher_enrollments" = "/api/v1/courses/{course_id}/enrollments?type[]=teacher",
    "ta_enrollments" = "/api/v1/courses/{course_id}/enrollments?type[]=ta",
    "observer_enrollments" = "/api/v1/courses/{course_id}/enrollments?type[]=observer",
    "admin_enrollments" = "/api/v1/courses/{course_id}/enrollments?type[]=admin",
    "collaborations" = "/api/v1/courses/{course_id}/collaborations",
    "users" = "/api/v1/courses/{course_id}/users",
    "course_score_and_grade_export" = "/api/v1/courses/{course_id}/score_and_grade_export",
    "course_settings" = "/api/v1/courses/{course_id}/settings",
    "blueprint_templates" = "/api/v1/courses/{course_id}/blueprint_templates",
    "blueprint_subscriptions" = "/api/v1/courses/{course_id}/blueprint_subscriptions",
    "blueprint_migrations" = "/api/v1/courses/{course_id}/blueprint_migrations",
    "blueprint_import" = "/api/v1/courses/{course_id}/blueprint_import",
    "blueprint_exports" = "/api/v1/courses/{course_id}/blueprint_exports",
    "storage_quota_used" = "/api/v1/courses/{course_id}/storage_quota_used",
    "tabs" = "/api/v1/courses/{course_id}/tabs",
    "usage_rights" = "/api/v1/courses/{course_id}/usage_rights",
    "account_notifications" = "/api/v1/courses/{course_id}/account_notifications",
    "blueprint_restricted_attachments" = "/api/v1/courses/{course_id}/blueprint_restricted_attachments",
    "usage_rights_information" = "/api/v1/courses/{course_id}/usage_rights_information",
    "default_view" = "/api/v1/courses/{course_id}/default_view",
    "calendar_events" = "/api/v1/courses/{course_id}/calendar_events",
    "calendars" = "/api/v1/courses/{course_id}/calendars",
    "appointment_groups" = "/api/v1/courses/{course_id}/appointment_groups",
    "external_feeds" = "/api/v1/courses/{course_id}/external_feeds",
    "rubric_associations" = "/api/v1/courses/{course_id}/rubric_associations",
    "content_exports" = "/api/v1/courses/{course_id}/content_exports",
    "content_imports" = "/api/v1/courses/{course_id}/content_imports",
    "content_migration" = "/api/v1/courses/{course_id}/content_migrations",
    "blueprint_course_associations" = "/api/v1/courses/{course_id}/blueprint_course_associations",
    "blueprint_restrictions" = "/api/v1/courses/{course_id}/blueprint_restrictions",
    "calendar_events_feed" = "/api/v1/courses/{course_id}/calendar_events/feed",
    "calendar_event_reservations" = "/api/v1/courses/{course_id}/calendar_event_reservations",
    "calendar_events_user" = "/api/v1/courses/{course_id}/calendar_events/user"
  )



  # Iterate through the endpoints and retrieve data
  for (endpoint in names(endpoints)) {
    # Construct the API endpoint URL
    endpoint_url <- gsub("\\{course_id\\}", course_id, endpoints[[endpoint]])
    url <- paste0(canvas$base_url, endpoint_url)

    # Make the API request
    response <- httr::GET(url, httr::add_headers(Authorization = paste("Bearer", canvas$api_key)))

    # Check the response status code
    if (httr::status_code(response) != 200) {
      message(paste("Failed to retrieve data from endpoint:", endpoint), "\n")
      next
    }

    # Parse the response as JSON
    data <- httr::content(response, "text", encoding = "UTF-8") %>%
      jsonlite::fromJSON(flatten = TRUE)

    # Define the file path to store the data
    file_path <- file.path(storage_location, paste0(endpoint, ".json"))

    # Write the data to file in JSON format
    jsonlite::write_json(data, file_path)

    message(paste("Data from endpoint", endpoint, "saved to", file_path), "\n")
  }

  message("Course data lake created successfully!\n")
}
