# Data Analysis Functions for Institutional Research

This document describes the new data analysis functions implemented for institutional research and student analytics in the vvcanvas package.

## Overview

The package now includes 20 new functions specifically designed for institutional research and student analytics. These functions focus on GET/LIST operations that provide insights into student progress, engagement, and performance - no create/delete functions are included as requested.

## New Functions

### Account-Level Functions
- **`get_account_details(canvas, account_id)`** - Get detailed information about a specific account
- **`get_account_courses(canvas, account_id, ...)`** - List active courses in an account with filtering options
- **`get_account_users(canvas, account_id, ...)`** - List users in an account with search and filter capabilities

### User-Level Functions
- **`get_user_details(canvas, user_id)`** - Get detailed information about a specific user
- **`get_user_courses(canvas, user_id, ...)`** - List courses for a specific user with enrollment filters
- **`get_user_enrollments(canvas, user_id, ...)`** - List enrollments for a specific user
- **`get_user_missing_submissions(canvas, user_id, ...)`** - List missing submissions for a user
- **`get_user_activity_stream(canvas, user_id, ...)`** - Get user's activity stream

### Course-Level Functions
- **`get_course_bulk_user_progress(canvas, course_id, ...)`** - Get bulk user progress for all students in a course
- **`get_course_activity_stream(canvas, course_id, ...)`** - Get course activity stream
- **`get_course_activity_stream_summary(canvas, course_id, ...)`** - Get course activity stream summary
- **`get_course_recent_students(canvas, course_id, ...)`** - Get recently logged in students for a course

### Assignment Analysis Functions
- **`get_assignment_submissions_detailed(canvas, course_id, assignment_id, ...)`** - Get detailed assignment submissions
- **`get_assignment_gradeable_students(canvas, course_id, assignment_id, ...)`** - Get gradeable students for an assignment

### Quiz Analysis Functions
- **`get_quiz_details(canvas, course_id, quiz_id)`** - Get detailed information about a specific quiz
- **`get_quiz_submissions(canvas, course_id, quiz_id, ...)`** - Get quiz submissions for a specific quiz

### Discussion Analysis Functions
- **`get_discussion_topic_details(canvas, course_id, topic_id, ...)`** - Get detailed information about a discussion topic
- **`get_discussion_topic_entries(canvas, course_id, topic_id, ...)`** - Get entries (posts) for a discussion topic

### Report Functions
- **`get_available_reports(canvas, account_id, ...)`** - Get list of available reports for an account
- **`get_report_status(canvas, account_id, report_type, report_id)`** - Get status of a specific report

## Usage Examples

See `examples/data_analysis_functions_example.R` for comprehensive usage examples.

## Use Cases for Institutional Research

These functions enable institutional researchers to:

1. **Student Engagement Analysis**: Track student activity across courses and identify patterns
2. **Progress Tracking**: Monitor student progress and identify at-risk students through missing submissions
3. **Performance Analytics**: Analyze assignment and quiz performance across courses and students
4. **Discussion Participation**: Monitor discussion engagement and participation levels
5. **Course Analytics**: Understand course activity patterns and student behavior
6. **Report Generation**: Access and monitor institutional reports
7. **Enrollment Analysis**: Track enrollment patterns and student course loads

## Function Design

All functions follow the established package pattern:
- Consistent parameter structure with `canvas` object as first parameter
- Proper error handling with meaningful error messages
- Comprehensive documentation with parameter descriptions
- Optional parameters for filtering and including additional data
- Return data frames for easy analysis and visualization

## Integration with Existing Functions

These functions complement the existing analytics functions in the package:
- `get_department_*` functions for department-level analytics
- `get_course_*` functions for course-level data
- `get_user_course_*` functions for user-course analytics

All functions are designed to work seamlessly with the existing package architecture and authentication system.