# Example Usage of New Data Analysis Functions

# This file demonstrates how to use the new data analysis functions 
# implemented for institutional research and student analytics

# 1. Authentication (using existing function)
canvas <- canvas_authenticate("your_api_key", "https://your-canvas-url.com")

# 2. Account-level analytics
account_details <- get_account_details(canvas, account_id = 123)
account_courses <- get_account_courses(canvas, account_id = 123, published = TRUE)
account_users <- get_account_users(canvas, account_id = 123, enrollment_type = "student")

# 3. User-level analytics
user_details <- get_user_details(canvas, user_id = 456)
user_courses <- get_user_courses(canvas, user_id = 456, enrollment_state = "active")
user_enrollments <- get_user_enrollments(canvas, user_id = 456, state = "active")
user_missing_submissions <- get_user_missing_submissions(canvas, user_id = 456, include = "course")
user_activity <- get_user_activity_stream(canvas, user_id = 456)

# 4. Course-level analytics
course_progress <- get_course_bulk_user_progress(canvas, course_id = 789)
course_activity <- get_course_activity_stream(canvas, course_id = 789)
course_activity_summary <- get_course_activity_stream_summary(canvas, course_id = 789)
recent_students <- get_course_recent_students(canvas, course_id = 789)

# 5. Assignment analytics
assignment_submissions <- get_assignment_submissions_detailed(canvas, course_id = 789, assignment_id = 101)
gradeable_students <- get_assignment_gradeable_students(canvas, course_id = 789, assignment_id = 101)

# 6. Quiz analytics
quiz_details <- get_quiz_details(canvas, course_id = 789, quiz_id = 202)
quiz_submissions <- get_quiz_submissions(canvas, course_id = 789, quiz_id = 202)

# 7. Discussion analytics
discussion_details <- get_discussion_topic_details(canvas, course_id = 789, topic_id = 303)
discussion_entries <- get_discussion_topic_entries(canvas, course_id = 789, topic_id = 303)

# 8. Report analytics
available_reports <- get_available_reports(canvas, account_id = 123)
report_status <- get_report_status(canvas, account_id = 123, report_type = "course_sis_export", report_id = 404)

# These functions enable institutional researchers to:
# - Analyze student engagement across courses and accounts
# - Track student progress and missing submissions
# - Generate reports on course activity and participation
# - Monitor quiz and assignment performance
# - Analyze discussion participation and engagement
# - Access detailed user and enrollment information