- [ ]           List available account calendars              AccountCalendarsApiController#index       ; 
    GET /api/v1/account_calendars
  
- [ ]           Get a single account calendar              AccountCalendarsApiController#show       ; 
    GET /api/v1/account_calendars/:account_id
  
- [ ]           Update a calendar              AccountCalendarsApiController#update       ; 
    PUT /api/v1/account_calendars/:account_id
  
- [ ]           Update several calendars              AccountCalendarsApiController#bulk_update       ; 
    PUT /api/v1/accounts/:account_id/account_calendars
  
- [ ]           List all account calendars              AccountCalendarsApiController#all_calendars       ; 
    GET /api/v1/accounts/:account_id/account_calendars
  
- [ ]           Count of all visible account calendars              AccountCalendarsApiController#visible_calendars_count       ; 
    GET /api/v1/accounts/:account_id/visible_calendars_count
  
- [ ]           Search account domains           ; 
    GET /api/v1/accounts/search
  
- [ ]           Index of active global notification for the user              AccountNotificationsController#user_index       ; 
    GET /api/v1/accounts/:account_id/account_notifications
  
- [ ]           Show a global notification              AccountNotificationsController#show       ; 
    GET /api/v1/accounts/:account_id/account_notifications/:id
  
- [ ]           Close notification for user              AccountNotificationsController#user_close_notification       ; 
    DELETE /api/v1/accounts/:account_id/account_notifications/:id
  
- [ ]           Create a global notification              AccountNotificationsController#create       ; 
    POST /api/v1/accounts/:account_id/account_notifications
  
- [ ]           Update a global notification              AccountNotificationsController#update       ; 
    PUT /api/v1/accounts/:account_id/account_notifications/:id
  
- [ ]           List Available Reports              AccountReportsController#available_reports       ; 
    GET /api/v1/accounts/:account_id/reports
  
- [ ]           Start a Report              AccountReportsController#create       ; 
    POST /api/v1/accounts/:account_id/reports/:report
  
- [ ]           Index of Reports              AccountReportsController#index       ; 
    GET /api/v1/accounts/:account_id/reports/:report
  
- [ ]           Status of a Report              AccountReportsController#show       ; 
    GET /api/v1/accounts/:account_id/reports/:report/:id
  
- [ ]           Delete a Report              AccountReportsController#destroy       ; 
    DELETE /api/v1/accounts/:account_id/reports/:report/:id
  
- [ ]           List accounts              AccountsController#index       ; 
    GET /api/v1/accounts
  
- [ ]           Get accounts that admins can manage              AccountsController#manageable_accounts       ; 
    GET /api/v1/manageable_accounts
  
- [ ]           List accounts for course admins              AccountsController#course_accounts       ; 
    GET /api/v1/course_accounts
  
- [ ]           Get a single account              AccountsController#show       ; 
    GET /api/v1/accounts/:id
  
- [ ]           Settings              AccountsController#show_settings       ; 
    GET /api/v1/accounts/:account_id/settings
  
- [ ]           Permissions              AccountsController#permissions       ; 
    GET /api/v1/accounts/:account_id/permissions
  
- [ ]           Get the sub-accounts of an account              AccountsController#sub_accounts       ; 
    GET /api/v1/accounts/:account_id/sub_accounts
  
- [ ]           Get the Terms of Service              AccountsController#terms_of_service       ; 
    GET /api/v1/accounts/:account_id/terms_of_service
  
- [ ]           Get help links              AccountsController#help_links       ; 
    GET /api/v1/accounts/:account_id/help_links
  
- [ ]           Get the manually-created courses sub-account for the domain root account              AccountsController#manually_created_courses_account       ; 
    GET /api/v1/manually_created_courses_account
  
- [ ]           List active courses in an account              AccountsController#courses_api       ; 
    GET /api/v1/accounts/:account_id/courses
  
- [ ]           Update an account              AccountsController#update       ; 
    PUT /api/v1/accounts/:id
  
- [ ]           Delete a user from the root account              AccountsController#remove_user       ; 
    DELETE /api/v1/accounts/:account_id/users/:user_id
  
- [ ]           Create a new sub-account              SubAccountsController#create       ; 
    POST /api/v1/accounts/:account_id/sub_accounts
  
- [ ]           Delete a sub-account              SubAccountsController#destroy       ; 
    DELETE /api/v1/accounts/:account_id/sub_accounts/:id
  
- [ ]           Get account              Lti::AccountLookupController#show       ; 
    GET /api/lti/accounts/:account_id
  
- [ ]           Make an account admin              AdminsController#create       ; 
    POST /api/v1/accounts/:account_id/admins
  
- [ ]           Remove account admin              AdminsController#destroy       ; 
    DELETE /api/v1/accounts/:account_id/admins/:user_id
  
- [ ]           List account admins              AdminsController#index       ; 
    GET /api/v1/accounts/:account_id/admins
  
- [ ]           Get department-level participation data           ; 
    GET /api/v1/accounts/:account_id/analytics/terms/:term_id/activity
  
- [ ]           Get department-level participation data           ; 
    GET /api/v1/accounts/:account_id/analytics/current/activity
  
- [ ]           Get department-level participation data           ; 
    GET /api/v1/accounts/:account_id/analytics/completed/activity
  
- [ ]           Get department-level grade data           ; 
    GET /api/v1/accounts/:account_id/analytics/terms/:term_id/grades
  
- [ ]           Get department-level grade data           ; 
    GET /api/v1/accounts/:account_id/analytics/current/grades
  
- [ ]           Get department-level grade data           ; 
    GET /api/v1/accounts/:account_id/analytics/completed/grades
  
- [ ]           Get department-level statistics           ; 
    GET /api/v1/accounts/:account_id/analytics/terms/:term_id/statistics
  
- [ ]           Get department-level statistics           ; 
    GET /api/v1/accounts/:account_id/analytics/current/statistics
  
- [ ]           Get department-level statistics           ; 
    GET /api/v1/accounts/:account_id/analytics/completed/statistics
  
- [ ]           Get department-level statistics, broken down by subaccount           ; 
    GET /api/v1/accounts/:account_id/analytics/terms/:term_id/statistics_by_subaccount
  
- [ ]           Get department-level statistics, broken down by subaccount           ; 
    GET /api/v1/accounts/:account_id/analytics/current/statistics_by_subaccount
  
- [ ]           Get department-level statistics, broken down by subaccount           ; 
    GET /api/v1/accounts/:account_id/analytics/completed/statistics_by_subaccount
  
- [x]           Get course-level participation data           ; 
    GET /api/v1/courses/:course_id/analytics/activity
  
- [ ]           Get course-level assignment data           ; 
    GET /api/v1/courses/:course_id/analytics/assignments
  
- [x]           Get course-level student summary data           ; 
    GET /api/v1/courses/:course_id/analytics/student_summaries
  
- [ ]           Get user-in-a-course-level participation data           ; 
    GET /api/v1/courses/:course_id/analytics/users/:student_id/activity
  
- [ ]           Get user-in-a-course-level assignment data           ; 
    GET /api/v1/courses/:course_id/analytics/users/:student_id/assignments
  
- [ ]           Get user-in-a-course-level messaging data           ; 
    GET /api/v1/courses/:course_id/analytics/users/:student_id/communication
  
- [ ]           List external feeds              ExternalFeedsController#index       ; 
    GET /api/v1/courses/:course_id/external_feeds
  
- [ ]           List external feeds              ExternalFeedsController#index       ; 
    GET /api/v1/groups/:group_id/external_feeds
  
- [ ]           Create an external feed              ExternalFeedsController#create       ; 
    POST /api/v1/courses/:course_id/external_feeds
  
- [ ]           Create an external feed              ExternalFeedsController#create       ; 
    POST /api/v1/groups/:group_id/external_feeds
  
- [ ]           Delete an external feed              ExternalFeedsController#destroy       ; 
    DELETE /api/v1/courses/:course_id/external_feeds/:external_feed_id
  
- [ ]           Delete an external feed              ExternalFeedsController#destroy       ; 
    DELETE /api/v1/groups/:group_id/external_feeds/:external_feed_id
  
- [ ]           List announcements              AnnouncementsApiController#index       ; 
    GET /api/v1/announcements
  
- [ ]           List scopes              ScopesApiController#index       ; 
    GET /api/v1/accounts/:account_id/scopes
  
- [ ]           List appointment groups              AppointmentGroupsController#index       ; 
    GET /api/v1/appointment_groups
  
- [ ]           Create an appointment group              AppointmentGroupsController#create       ; 
    POST /api/v1/appointment_groups
  
- [ ]           Get a single appointment group              AppointmentGroupsController#show       ; 
    GET /api/v1/appointment_groups/:id
  
- [ ]           Update an appointment group              AppointmentGroupsController#update       ; 
    PUT /api/v1/appointment_groups/:id
  
- [ ]           Delete an appointment group              AppointmentGroupsController#destroy       ; 
    DELETE /api/v1/appointment_groups/:id
  
- [ ]           List user participants              AppointmentGroupsController#users       ; 
    GET /api/v1/appointment_groups/:id/users
  
- [ ]           List student group participants              AppointmentGroupsController#groups       ; 
    GET /api/v1/appointment_groups/:id/groups
  
- [ ]           Get next appointment              AppointmentGroupsController#next_appointment       ; 
    GET /api/v1/appointment_groups/next_appointment
  
- [ ]           Set extensions for student assignment submissions              AssignmentExtensionsController#create       ; 
    POST /api/v1/courses/:course_id/assignments/:assignment_id/extensions
  
- [ ]           List assignment groups              AssignmentGroupsController#index       ; 
    GET /api/v1/courses/:course_id/assignment_groups
  
- [ ]           Get an Assignment Group              AssignmentGroupsApiController#show       ; 
    GET /api/v1/courses/:course_id/assignment_groups/:assignment_group_id
  
- [x]           Create an Assignment Group              AssignmentGroupsApiController#create       ; 
    POST /api/v1/courses/:course_id/assignment_groups
  
- [ ]           Edit an Assignment Group              AssignmentGroupsApiController#update       ; 
    PUT /api/v1/courses/:course_id/assignment_groups/:assignment_group_id
  
- [ ]           Destroy an Assignment Group              AssignmentGroupsApiController#destroy       ; 
    DELETE /api/v1/courses/:course_id/assignment_groups/:assignment_group_id
  
- [ ]           Delete an assignment              AssignmentsController#destroy       ; 
    DELETE /api/v1/courses/:course_id/assignments/:id
  
- [x]           List assignments              AssignmentsApiController#index       ; 
    GET /api/v1/courses/:course_id/assignments
  
- [ ]           List assignments              AssignmentsApiController#index       ; 
    GET /api/v1/courses/:course_id/assignment_groups/:assignment_group_id/assignments
  
- [ ]           List assignments for user              AssignmentsApiController#user_index       ; 
    GET /api/v1/users/:user_id/courses/:course_id/assignments
  
- [ ]           Duplicate assignnment              AssignmentsApiController#duplicate       ; 
    POST /api/v1/courses/:course_id/assignments/:assignment_id/duplicate
  
- [ ]           Get a single assignment              AssignmentsApiController#show       ; 
    GET /api/v1/courses/:course_id/assignments/:id
  
- [ ]           Create an assignment              AssignmentsApiController#create       ; 
    POST /api/v1/courses/:course_id/assignments
  
- [ ]           Edit an assignment              AssignmentsApiController#update       ; 
    PUT /api/v1/courses/:course_id/assignments/:id
  
- [ ]           Bulk update assignment dates              AssignmentsApiController#bulk_update       ; 
    PUT /api/v1/courses/:course_id/assignments/bulk_update
  
- [ ]           List assignment overrides              AssignmentOverridesController#index       ; 
    GET /api/v1/courses/:course_id/assignments/:assignment_id/overrides
  
- [ ]           Get a single assignment override              AssignmentOverridesController#show       ; 
    GET /api/v1/courses/:course_id/assignments/:assignment_id/overrides/:id
  
- [ ]           Redirect to the assignment override for a group              AssignmentOverridesController#group_alias       ; 
    GET /api/v1/groups/:group_id/assignments/:assignment_id/override
  
- [ ]           Redirect to the assignment override for a section              AssignmentOverridesController#section_alias       ; 
    GET /api/v1/sections/:course_section_id/assignments/:assignment_id/override
  
- [ ]           Create an assignment override              AssignmentOverridesController#create       ; 
    POST /api/v1/courses/:course_id/assignments/:assignment_id/overrides
  
- [ ]           Update an assignment override              AssignmentOverridesController#update       ; 
    PUT /api/v1/courses/:course_id/assignments/:assignment_id/overrides/:id
  
- [ ]           Delete an assignment override              AssignmentOverridesController#destroy       ; 
    DELETE /api/v1/courses/:course_id/assignments/:assignment_id/overrides/:id
  
- [ ]           Batch retrieve overrides in a course              AssignmentOverridesController#batch_retrieve       ; 
    GET /api/v1/courses/:course_id/assignments/overrides
  
- [ ]           Batch create overrides in a course              AssignmentOverridesController#batch_create       ; 
    POST /api/v1/courses/:course_id/assignments/overrides
  
- [ ]           Batch update overrides in a course              AssignmentOverridesController#batch_update       ; 
    PUT /api/v1/courses/:course_id/assignments/overrides
  
- [ ]           List authentication providers              AuthenticationProvidersController#index       ; 
    GET /api/v1/accounts/:account_id/authentication_providers
  
- [ ]           Add authentication provider              AuthenticationProvidersController#create       ; 
    POST /api/v1/accounts/:account_id/authentication_providers
  
- [ ]           Update authentication provider              AuthenticationProvidersController#update       ; 
    PUT /api/v1/accounts/:account_id/authentication_providers/:id
  
- [ ]           Get authentication provider              AuthenticationProvidersController#show       ; 
    GET /api/v1/accounts/:account_id/authentication_providers/:id
  
- [ ]           Delete authentication provider              AuthenticationProvidersController#destroy       ; 
    DELETE /api/v1/accounts/:account_id/authentication_providers/:id
  
- [ ]           show account auth settings              AuthenticationProvidersController#show_sso_settings       ; 
    GET /api/v1/accounts/:account_id/sso_settings
  
- [ ]           update account auth settings              AuthenticationProvidersController#update_sso_settings       ; 
    PUT /api/v1/accounts/:account_id/sso_settings
  
- [ ]           Query by login.              AuthenticationAuditApiController#for_login       ; 
    GET /api/v1/audit/authentication/logins/:login_id
  
- [ ]           Query by account.              AuthenticationAuditApiController#for_account       ; 
    GET /api/v1/audit/authentication/accounts/:account_id
  
- [ ]           Query by user.              AuthenticationAuditApiController#for_user       ; 
    GET /api/v1/audit/authentication/users/:user_id
  
- [ ]           List blackout dates              BlackoutDatesController#index       ; 
    GET /api/v1/courses/:course_id/blackout_dates
  
- [ ]           List blackout dates              BlackoutDatesController#index       ; 
    GET /api/v1/accounts/:account_id/blackout_dates
  
- [ ]           Get a single blackout date              BlackoutDatesController#show       ; 
    GET /api/v1/courses/:course_id/blackout_dates/:id
  
- [ ]           Get a single blackout date              BlackoutDatesController#show       ; 
    GET /api/v1/accounts/:account_id/blackout_dates/:id
  
- [ ]           New Blackout Date              BlackoutDatesController#new       ; 
    GET /api/v1/courses/:course_id/blackout_dates/new
  
- [ ]           New Blackout Date              BlackoutDatesController#new       ; 
    GET /api/v1/accounts/:account_id/blackout_dates/new
  
- [ ]           Create Blackout Date              BlackoutDatesController#create       ; 
    POST /api/v1/courses/:course_id/blackout_dates
  
- [ ]           Create Blackout Date              BlackoutDatesController#create       ; 
    POST /api/v1/accounts/:account_id/blackout_dates
  
- [ ]           Update Blackout Date              BlackoutDatesController#update       ; 
    PUT /api/v1/courses/:course_id/blackout_dates/:id
  
- [ ]           Update Blackout Date              BlackoutDatesController#update       ; 
    PUT /api/v1/accounts/:account_id/blackout_dates/:id
  
- [ ]           Delete Blackout Date              BlackoutDatesController#destroy       ; 
    DELETE /api/v1/courses/:course_id/blackout_dates/:id
  
- [ ]           Delete Blackout Date              BlackoutDatesController#destroy       ; 
    DELETE /api/v1/accounts/:account_id/blackout_dates/:id
  
- [ ]           Update a list of Blackout Dates              BlackoutDatesController#bulk_update       ; 
    PUT /api/v1/courses/:course_id/blackout_dates
  
- [ ]           Get blueprint information              MasterCourses::MasterTemplatesController#show       ; 
    GET /api/v1/courses/:course_id/blueprint_templates/:template_id
  
- [ ]           Get associated course information              MasterCourses::MasterTemplatesController#associated_courses       ; 
    GET /api/v1/courses/:course_id/blueprint_templates/:template_id/associated_courses
  
- [ ]           Update associated courses              MasterCourses::MasterTemplatesController#update_associations       ; 
    PUT /api/v1/courses/:course_id/blueprint_templates/:template_id/update_associations
  
- [ ]           Begin a migration to push to associated courses              MasterCourses::MasterTemplatesController#queue_migration       ; 
    POST /api/v1/courses/:course_id/blueprint_templates/:template_id/migrations
  
- [ ]           Set or remove restrictions on a blueprint course object              MasterCourses::MasterTemplatesController#restrict_item       ; 
    PUT /api/v1/courses/:course_id/blueprint_templates/:template_id/restrict_item
  
- [ ]           Get unsynced changes              MasterCourses::MasterTemplatesController#unsynced_changes       ; 
    GET /api/v1/courses/:course_id/blueprint_templates/:template_id/unsynced_changes
  
- [ ]           List blueprint migrations              MasterCourses::MasterTemplatesController#migrations_index       ; 
    GET /api/v1/courses/:course_id/blueprint_templates/:template_id/migrations
  
- [ ]           Show a blueprint migration              MasterCourses::MasterTemplatesController#migrations_show       ; 
    GET /api/v1/courses/:course_id/blueprint_templates/:template_id/migrations/:id
  
- [ ]           Get migration details              MasterCourses::MasterTemplatesController#migration_details       ; 
    GET /api/v1/courses/:course_id/blueprint_templates/:template_id/migrations/:id/details
  
- [ ]           List blueprint subscriptions              MasterCourses::MasterTemplatesController#subscriptions_index       ; 
    GET /api/v1/courses/:course_id/blueprint_subscriptions
  
- [ ]           List blueprint imports              MasterCourses::MasterTemplatesController#imports_index       ; 
    GET /api/v1/courses/:course_id/blueprint_subscriptions/:subscription_id/migrations
  
- [ ]           Show a blueprint import              MasterCourses::MasterTemplatesController#imports_show       ; 
    GET /api/v1/courses/:course_id/blueprint_subscriptions/:subscription_id/migrations/:id
  
- [ ]           Get import details              MasterCourses::MasterTemplatesController#import_details       ; 
    GET /api/v1/courses/:course_id/blueprint_subscriptions/:subscription_id/migrations/:id/details
  
- [ ]           List bookmarks              Bookmarks::BookmarksController#index       ; 
    GET /api/v1/users/self/bookmarks
  
- [ ]           Create bookmark              Bookmarks::BookmarksController#create       ; 
    POST /api/v1/users/self/bookmarks
  
- [ ]           Get bookmark              Bookmarks::BookmarksController#show       ; 
    GET /api/v1/users/self/bookmarks/:id
  
- [ ]           Update bookmark              Bookmarks::BookmarksController#update       ; 
    PUT /api/v1/users/self/bookmarks/:id
  
- [ ]           Delete bookmark              Bookmarks::BookmarksController#destroy       ; 
    DELETE /api/v1/users/self/bookmarks/:id
  
- [ ]           Get the brand config variables that should be used for this domain              BrandConfigsApiController#show       ; 
    GET /api/v1/brand_variables
  
- [ ]           List calendar events              CalendarEventsApiController#index       ; 
    GET /api/v1/calendar_events
  
- [ ]           List calendar events for a user              CalendarEventsApiController#user_index       ; 
    GET /api/v1/users/:user_id/calendar_events
  
- [ ]           Create a calendar event              CalendarEventsApiController#create       ; 
    POST /api/v1/calendar_events
  
- [ ]           Get a single calendar event or assignment              CalendarEventsApiController#show       ; 
    GET /api/v1/calendar_events/:id
  
- [ ]           Reserve a time slot              CalendarEventsApiController#reserve       ; 
    POST /api/v1/calendar_events/:id/reservations
  
- [ ]           Reserve a time slot              CalendarEventsApiController#reserve       ; 
    POST /api/v1/calendar_events/:id/reservations/:participant_id
  
- [ ]           Update a calendar event              CalendarEventsApiController#update       ; 
    PUT /api/v1/calendar_events/:id
  
- [ ]           Delete a calendar event              CalendarEventsApiController#destroy       ; 
    DELETE /api/v1/calendar_events/:id
  
- [ ]           Save enabled account calendars              CalendarEventsApiController#save_enabled_account_calendars       ; 
    POST /api/v1/calendar_events/save_enabled_account_calendars
  
- [ ]           Set a course timetable              CalendarEventsApiController#set_course_timetable       ; 
    POST /api/v1/courses/:course_id/calendar_events/timetable
  
- [ ]           Get course timetable              CalendarEventsApiController#get_course_timetable       ; 
    GET /api/v1/courses/:course_id/calendar_events/timetable
  
- [ ]           Create or update events directly for a course timetable              CalendarEventsApiController#set_course_timetable_events       ; 
    POST /api/v1/courses/:course_id/calendar_events/timetable_events
  
- [ ]           List collaborations              CollaborationsController#api_index       ; 
    GET /api/v1/courses/:course_id/collaborations
  
- [ ]           List collaborations              CollaborationsController#api_index       ; 
    GET /api/v1/groups/:group_id/collaborations
  
- [ ]           List members of a collaboration.              CollaborationsController#members       ; 
    GET /api/v1/collaborations/:id/members
  
- [ ]           List potential members              CollaborationsController#potential_collaborators       ; 
    GET /api/v1/courses/:course_id/potential_collaborators
  
- [ ]           List potential members              CollaborationsController#potential_collaborators       ; 
    GET /api/v1/groups/:group_id/potential_collaborators
  
- [ ]           List of CommMessages for a user              CommMessagesApiController#index       ; 
    GET /api/v1/comm_messages
  
- [ ]           List user communication channels              CommunicationChannelsController#index       ; 
    GET /api/v1/users/:user_id/communication_channels
  
- [ ]           Create a communication channel              CommunicationChannelsController#create       ; 
    POST /api/v1/users/:user_id/communication_channels
  
- [ ]           Delete a communication channel              CommunicationChannelsController#destroy       ; 
    DELETE /api/v1/users/:user_id/communication_channels/:id
  
- [ ]           Delete a communication channel              CommunicationChannelsController#destroy       ; 
    DELETE /api/v1/users/:user_id/communication_channels/:type/:address
  
- [ ]           Delete a push notification endpoint              CommunicationChannelsController#delete_push_token       ; 
    DELETE /api/v1/users/self/communication_channels/push
  
- [ ]           List conferences              ConferencesController#index       ; 
    GET /api/v1/courses/:course_id/conferences
  
- [ ]           List conferences              ConferencesController#index       ; 
    GET /api/v1/groups/:group_id/conferences
  
- [ ]           List conferences for the current user              ConferencesController#for_user       ; 
    GET /api/v1/conferences
  
- [ ]           List content exports              ContentExportsApiController#index       ; 
    GET /api/v1/courses/:course_id/content_exports
  
- [ ]           List content exports              ContentExportsApiController#index       ; 
    GET /api/v1/groups/:group_id/content_exports
  
- [ ]           List content exports              ContentExportsApiController#index       ; 
    GET /api/v1/users/:user_id/content_exports
  
- [ ]           Show content export              ContentExportsApiController#show       ; 
    GET /api/v1/courses/:course_id/content_exports/:id
  
- [ ]           Show content export              ContentExportsApiController#show       ; 
    GET /api/v1/groups/:group_id/content_exports/:id
  
- [ ]           Show content export              ContentExportsApiController#show       ; 
    GET /api/v1/users/:user_id/content_exports/:id
  
- [ ]           Export content              ContentExportsApiController#create       ; 
    POST /api/v1/courses/:course_id/content_exports
  
- [ ]           Export content              ContentExportsApiController#create       ; 
    POST /api/v1/groups/:group_id/content_exports
  
- [ ]           Export content              ContentExportsApiController#create       ; 
    POST /api/v1/users/:user_id/content_exports
  
- [ ]           List migration issues              MigrationIssuesController#index       ; 
    GET /api/v1/accounts/:account_id/content_migrations/:content_migration_id/migration_issues
  
- [ ]           List migration issues              MigrationIssuesController#index       ; 
    GET /api/v1/courses/:course_id/content_migrations/:content_migration_id/migration_issues
  
- [ ]           List migration issues              MigrationIssuesController#index       ; 
    GET /api/v1/groups/:group_id/content_migrations/:content_migration_id/migration_issues
  
- [ ]           List migration issues              MigrationIssuesController#index       ; 
    GET /api/v1/users/:user_id/content_migrations/:content_migration_id/migration_issues
  
- [ ]           Get a migration issue              MigrationIssuesController#show       ; 
    GET /api/v1/accounts/:account_id/content_migrations/:content_migration_id/migration_issues/:id
  
- [ ]           Get a migration issue              MigrationIssuesController#show       ; 
    GET /api/v1/courses/:course_id/content_migrations/:content_migration_id/migration_issues/:id
  
- [ ]           Get a migration issue              MigrationIssuesController#show       ; 
    GET /api/v1/groups/:group_id/content_migrations/:content_migration_id/migration_issues/:id
  
- [ ]           Get a migration issue              MigrationIssuesController#show       ; 
    GET /api/v1/users/:user_id/content_migrations/:content_migration_id/migration_issues/:id
  
- [ ]           Update a migration issue              MigrationIssuesController#update       ; 
    PUT /api/v1/accounts/:account_id/content_migrations/:content_migration_id/migration_issues/:id
  
- [ ]           Update a migration issue              MigrationIssuesController#update       ; 
    PUT /api/v1/courses/:course_id/content_migrations/:content_migration_id/migration_issues/:id
  
- [ ]           Update a migration issue              MigrationIssuesController#update       ; 
    PUT /api/v1/groups/:group_id/content_migrations/:content_migration_id/migration_issues/:id
  
- [ ]           Update a migration issue              MigrationIssuesController#update       ; 
    PUT /api/v1/users/:user_id/content_migrations/:content_migration_id/migration_issues/:id
  
- [ ]           List content migrations              ContentMigrationsController#index       ; 
    GET /api/v1/accounts/:account_id/content_migrations
  
- [ ]           List content migrations              ContentMigrationsController#index       ; 
    GET /api/v1/courses/:course_id/content_migrations
  
- [ ]           List content migrations              ContentMigrationsController#index       ; 
    GET /api/v1/groups/:group_id/content_migrations
  
- [ ]           List content migrations              ContentMigrationsController#index       ; 
    GET /api/v1/users/:user_id/content_migrations
  
- [ ]           Get a content migration              ContentMigrationsController#show       ; 
    GET /api/v1/accounts/:account_id/content_migrations/:id
  
- [ ]           Get a content migration              ContentMigrationsController#show       ; 
    GET /api/v1/courses/:course_id/content_migrations/:id
  
- [ ]           Get a content migration              ContentMigrationsController#show       ; 
    GET /api/v1/groups/:group_id/content_migrations/:id
  
- [ ]           Get a content migration              ContentMigrationsController#show       ; 
    GET /api/v1/users/:user_id/content_migrations/:id
  
- [ ]           Create a content migration              ContentMigrationsController#create       ; 
    POST /api/v1/accounts/:account_id/content_migrations
  
- [ ]           Create a content migration              ContentMigrationsController#create       ; 
    POST /api/v1/courses/:course_id/content_migrations
  
- [ ]           Create a content migration              ContentMigrationsController#create       ; 
    POST /api/v1/groups/:group_id/content_migrations
  
- [ ]           Create a content migration              ContentMigrationsController#create       ; 
    POST /api/v1/users/:user_id/content_migrations
  
- [ ]           Update a content migration              ContentMigrationsController#update       ; 
    PUT /api/v1/accounts/:account_id/content_migrations/:id
  
- [ ]           Update a content migration              ContentMigrationsController#update       ; 
    PUT /api/v1/courses/:course_id/content_migrations/:id
  
- [ ]           Update a content migration              ContentMigrationsController#update       ; 
    PUT /api/v1/groups/:group_id/content_migrations/:id
  
- [ ]           Update a content migration              ContentMigrationsController#update       ; 
    PUT /api/v1/users/:user_id/content_migrations/:id
  
- [ ]           List Migration Systems              ContentMigrationsController#available_migrators       ; 
    GET /api/v1/accounts/:account_id/content_migrations/migrators
  
- [ ]           List Migration Systems              ContentMigrationsController#available_migrators       ; 
    GET /api/v1/courses/:course_id/content_migrations/migrators
  
- [ ]           List Migration Systems              ContentMigrationsController#available_migrators       ; 
    GET /api/v1/groups/:group_id/content_migrations/migrators
  
- [ ]           List Migration Systems              ContentMigrationsController#available_migrators       ; 
    GET /api/v1/users/:user_id/content_migrations/migrators
  
- [ ]           List items for selective import              ContentMigrationsController#content_list       ; 
    GET /api/v1/accounts/:account_id/content_migrations/:id/selective_data
  
- [ ]           List items for selective import              ContentMigrationsController#content_list       ; 
    GET /api/v1/courses/:course_id/content_migrations/:id/selective_data
  
- [ ]           List items for selective import              ContentMigrationsController#content_list       ; 
    GET /api/v1/groups/:group_id/content_migrations/:id/selective_data
  
- [ ]           List items for selective import              ContentMigrationsController#content_list       ; 
    GET /api/v1/users/:user_id/content_migrations/:id/selective_data
  
- [ ]           Get asset id mapping              ContentMigrationsController#asset_id_mapping       ; 
    GET /api/v1/courses/:course_id/content_migrations/:id/asset_id_mapping
  
- [ ]           Get current settings for account or course              CspSettingsController#get_csp_settings       ; 
    GET /api/v1/courses/:course_id/csp_settings
  
- [ ]           Get current settings for account or course              CspSettingsController#get_csp_settings       ; 
    GET /api/v1/accounts/:account_id/csp_settings
  
- [ ]           Enable, disable, or clear explicit CSP setting              CspSettingsController#set_csp_setting       ; 
    PUT /api/v1/courses/:course_id/csp_settings
  
- [ ]           Enable, disable, or clear explicit CSP setting              CspSettingsController#set_csp_setting       ; 
    PUT /api/v1/accounts/:account_id/csp_settings
  
- [ ]           Lock or unlock current CSP settings for sub-accounts and courses              CspSettingsController#set_csp_lock       ; 
    PUT /api/v1/accounts/:account_id/csp_settings/lock
  
- [ ]           Add an allowed domain to account              CspSettingsController#add_domain       ; 
    POST /api/v1/accounts/:account_id/csp_settings/domains
  
- [ ]           Add multiple allowed domains to an account              CspSettingsController#add_multiple_domains       ; 
    POST /api/v1/accounts/:account_id/csp_settings/domains/batch_create
  
- [ ]           Retrieve reported CSP Violations for account              CspSettingsController#csp_log       ; 
    GET /api/v1/accounts/:account_id/csp_log
  
- [ ]           Remove a domain from account              CspSettingsController#remove_domain       ; 
    DELETE /api/v1/accounts/:account_id/csp_settings/domains
  
- [ ]           Create a content share              ContentSharesController#create       ; 
    POST /api/v1/users/:user_id/content_shares
  
- [ ]           List content shares              ContentSharesController#index       ; 
    GET /api/v1/users/:user_id/content_shares/sent
  
- [ ]           List content shares              ContentSharesController#index       ; 
    GET /api/v1/users/:user_id/content_shares/received
  
- [ ]           Get unread shares count              ContentSharesController#unread_count       ; 
    GET /api/v1/users/:user_id/content_shares/unread_count
  
- [ ]           Get content share              ContentSharesController#show       ; 
    GET /api/v1/users/:user_id/content_shares/:id
  
- [ ]           Remove content share              ContentSharesController#destroy       ; 
    DELETE /api/v1/users/:user_id/content_shares/:id
  
- [ ]           Add users to content share              ContentSharesController#add_users       ; 
    POST /api/v1/users/:user_id/content_shares/:id/add_users
  
- [ ]           Update a content share              ContentSharesController#update       ; 
    PUT /api/v1/users/:user_id/content_shares/:id
  
- [ ]           List conversations              ConversationsController#index       ; 
    GET /api/v1/conversations
  
- [ ]           Create a conversation              ConversationsController#create       ; 
    POST /api/v1/conversations
  
- [ ]           Get running batches              ConversationsController#batches       ; 
    GET /api/v1/conversations/batches
  
- [ ]           Get a single conversation              ConversationsController#show       ; 
    GET /api/v1/conversations/:id
  
- [ ]           Edit a conversation              ConversationsController#update       ; 
    PUT /api/v1/conversations/:id
  
- [ ]           Mark all as read              ConversationsController#mark_all_as_read       ; 
    POST /api/v1/conversations/mark_all_as_read
  
- [ ]           Delete a conversation              ConversationsController#destroy       ; 
    DELETE /api/v1/conversations/:id
  
- [ ]           Add recipients              ConversationsController#add_recipients       ; 
    POST /api/v1/conversations/:id/add_recipients
  
- [ ]           Add a message              ConversationsController#add_message       ; 
    POST /api/v1/conversations/:id/add_message
  
- [ ]           Delete a message              ConversationsController#remove_messages       ; 
    POST /api/v1/conversations/:id/remove_messages
  
- [ ]           Batch update conversations              ConversationsController#batch_update       ; 
    PUT /api/v1/conversations
  
- [ ]           Find recipients              ConversationsController#find_recipients       ; 
    GET /api/v1/conversations/find_recipients
  
- [ ]           Unread count              ConversationsController#unread_count       ; 
    GET /api/v1/conversations/unread_count
  
- [ ]           Query by course.              CourseAuditApiController#for_course       ; 
    GET /api/v1/audit/course/courses/:course_id
  
- [ ]           Query by account.              CourseAuditApiController#for_account       ; 
    GET /api/v1/audit/course/accounts/:account_id
  
- [ ]           Show a Course pace              CoursePacesController#api_show       ; 
    GET /api/v1/courses/:course_id/course_pacing/:id
  
- [ ]           Create a Course pace              CoursePacesController#create       ; 
    POST /api/v1/courses/:course_id/course_pacing
  
- [ ]           Update a Course pace              CoursePacesController#update       ; 
    PUT /api/v1/courses/:course_id/course_pacing/:id
  
- [ ]           Delete a Course pace              CoursePacesController#destroy       ; 
    DELETE /api/v1/courses/:course_id/course_pacing/:id
  
- [ ]           Set extensions for student quiz submissions              Quizzes::CourseQuizExtensionsController#create       ; 
    POST /api/v1/courses/:course_id/quiz_extensions
  
- [x]           List your courses              CoursesController#index       ; 
    GET /api/v1/courses
  
- [ ]           List courses for a user              CoursesController#user_index       ; 
    GET /api/v1/users/:user_id/courses
  
- [ ]           Get user progress              CoursesController#user_progress       ; 
    GET /api/v1/courses/:course_id/users/:user_id/progress
  
- [ ]           Create a new course              CoursesController#create       ; 
    POST /api/v1/accounts/:account_id/courses
  
- [ ]           Upload a file              CoursesController#create_file       ; 
    POST /api/v1/courses/:course_id/files
  
- [x]           List students              CoursesController#students       ; 
    GET /api/v1/courses/:course_id/students
  
- [ ]           List users in course              CoursesController#users       ; 
    GET /api/v1/courses/:course_id/users
  
- [ ]           List users in course              CoursesController#users       ; 
    GET /api/v1/courses/:course_id/search_users
  
- [ ]           List recently logged in students              CoursesController#recent_students       ; 
    GET /api/v1/courses/:course_id/recent_students
  
- [ ]           Get single user              CoursesController#user       ; 
    GET /api/v1/courses/:course_id/users/:id
  
- [ ]           Search for content share users              CoursesController#content_share_users       ; 
    GET /api/v1/courses/:course_id/content_share_users
  
- [ ]           Preview processed html              CoursesController#preview_html       ; 
    POST /api/v1/courses/:course_id/preview_html
  
- [ ]           Course activity stream              CoursesController#activity_stream       ; 
    GET /api/v1/courses/:course_id/activity_stream
  
- [ ]           Course activity stream summary              CoursesController#activity_stream_summary       ; 
    GET /api/v1/courses/:course_id/activity_stream/summary
  
- [ ]           Course TODO items              CoursesController#todo_items       ; 
    GET /api/v1/courses/:course_id/todo
  
- [ ]           Delete/Conclude a course              CoursesController#destroy       ; 
    DELETE /api/v1/courses/:id
  
- [ ]           Get course settings              CoursesController#api_settings       ; 
    GET /api/v1/courses/:course_id/settings
  
- [ ]           Update course settings              CoursesController#update_settings       ; 
    PUT /api/v1/courses/:course_id/settings
  
- [ ]           Return test student for course              CoursesController#student_view_student       ; 
    GET /api/v1/courses/:course_id/student_view_student
  
- [ ]           Get a single course              CoursesController#show       ; 
    GET /api/v1/courses/:id
  
- [ ]           Get a single course              CoursesController#show       ; 
    GET /api/v1/accounts/:account_id/courses/:id
  
- [ ]           Update a course              CoursesController#update       ; 
    PUT /api/v1/courses/:id
  
- [ ]           Update courses              CoursesController#batch_update       ; 
    PUT /api/v1/accounts/:account_id/courses
  
- [ ]           Reset a course              CoursesController#reset_content       ; 
    POST /api/v1/courses/:course_id/reset_content
  
- [ ]           Get effective due dates              CoursesController#effective_due_dates       ; 
    GET /api/v1/courses/:course_id/effective_due_dates
  
- [ ]           Permissions              CoursesController#permissions       ; 
    GET /api/v1/courses/:course_id/permissions
  
- [ ]           Get bulk user progress              CoursesController#bulk_user_progress       ; 
    GET /api/v1/courses/:course_id/bulk_user_progress
  
- [ ]           Remove quiz migration alert              CoursesController#dismiss_migration_limitation_msg       ; 
    POST /api/v1/courses/:id/dismiss_migration_limitation_message
  
- [ ]           Get course copy status              ContentImportsController#copy_course_status       ; 
    GET /api/v1/courses/:course_id/course_copy/:id
  
- [ ]           Copy course content              ContentImportsController#copy_course_content       ; 
    POST /api/v1/courses/:course_id/course_copy
  
- [ ]           List custom gradebook columns              CustomGradebookColumnsApiController#index       ; 
    GET /api/v1/courses/:course_id/custom_gradebook_columns
  
- [ ]           Create a custom gradebook column              CustomGradebookColumnsApiController#create       ; 
    POST /api/v1/courses/:course_id/custom_gradebook_columns
  
- [ ]           Update a custom gradebook column              CustomGradebookColumnsApiController#update       ; 
    PUT /api/v1/courses/:course_id/custom_gradebook_columns/:id
  
- [ ]           Delete a custom gradebook column              CustomGradebookColumnsApiController#destroy       ; 
    DELETE /api/v1/courses/:course_id/custom_gradebook_columns/:id
  
- [ ]           Reorder custom columns              CustomGradebookColumnsApiController#reorder       ; 
    POST /api/v1/courses/:course_id/custom_gradebook_columns/reorder
  
- [ ]           List entries for a column              CustomGradebookColumnDataApiController#index       ; 
    GET /api/v1/courses/:course_id/custom_gradebook_columns/:id/data
  
- [ ]           Update column data              CustomGradebookColumnDataApiController#update       ; 
    PUT /api/v1/courses/:course_id/custom_gradebook_columns/:id/data/:user_id
  
- [ ]           Bulk update column data              CustomGradebookColumnDataApiController#bulk_update       ; 
    PUT /api/v1/courses/:course_id/custom_gradebook_column_data
  
- [x]           List discussion topics              DiscussionTopicsController#index       ; 
    GET /api/v1/courses/:course_id/discussion_topics
  
- [ ]           List discussion topics              DiscussionTopicsController#index       ; 
    GET /api/v1/groups/:group_id/discussion_topics
  
- [x]           Create a new discussion topic              DiscussionTopicsController#create       ; 
    POST /api/v1/courses/:course_id/discussion_topics
  
- [ ]           Create a new discussion topic              DiscussionTopicsController#create       ; 
    POST /api/v1/groups/:group_id/discussion_topics
  
- [ ]           Update a topic              DiscussionTopicsController#update       ; 
    PUT /api/v1/courses/:course_id/discussion_topics/:topic_id
  
- [ ]           Update a topic              DiscussionTopicsController#update       ; 
    PUT /api/v1/groups/:group_id/discussion_topics/:topic_id
  
- [ ]           Delete a topic              DiscussionTopicsController#destroy       ; 
    DELETE /api/v1/courses/:course_id/discussion_topics/:topic_id
  
- [ ]           Delete a topic              DiscussionTopicsController#destroy       ; 
    DELETE /api/v1/groups/:group_id/discussion_topics/:topic_id
  
- [ ]           Reorder pinned topics              DiscussionTopicsController#reorder       ; 
    POST /api/v1/courses/:course_id/discussion_topics/reorder
  
- [ ]           Reorder pinned topics              DiscussionTopicsController#reorder       ; 
    POST /api/v1/groups/:group_id/discussion_topics/reorder
  
- [ ]           Update an entry              DiscussionEntriesController#update       ; 
    PUT /api/v1/courses/:course_id/discussion_topics/:topic_id/entries/:id
  
- [ ]           Update an entry              DiscussionEntriesController#update       ; 
    PUT /api/v1/groups/:group_id/discussion_topics/:topic_id/entries/:id
  
- [ ]           Delete an entry              DiscussionEntriesController#destroy       ; 
    DELETE /api/v1/courses/:course_id/discussion_topics/:topic_id/entries/:id
  
- [ ]           Delete an entry              DiscussionEntriesController#destroy       ; 
    DELETE /api/v1/groups/:group_id/discussion_topics/:topic_id/entries/:id
  
- [ ]           Get a single topic              DiscussionTopicsApiController#show       ; 
    GET /api/v1/courses/:course_id/discussion_topics/:topic_id
  
- [ ]           Get a single topic              DiscussionTopicsApiController#show       ; 
    GET /api/v1/groups/:group_id/discussion_topics/:topic_id
  
- [ ]           Get the full topic              DiscussionTopicsApiController#view       ; 
    GET /api/v1/courses/:course_id/discussion_topics/:topic_id/view
  
- [ ]           Get the full topic              DiscussionTopicsApiController#view       ; 
    GET /api/v1/groups/:group_id/discussion_topics/:topic_id/view
  
- [ ]           Post an entry              DiscussionTopicsApiController#add_entry       ; 
    POST /api/v1/courses/:course_id/discussion_topics/:topic_id/entries
  
- [ ]           Post an entry              DiscussionTopicsApiController#add_entry       ; 
    POST /api/v1/groups/:group_id/discussion_topics/:topic_id/entries
  
- [ ]           Duplicate discussion topic              DiscussionTopicsApiController#duplicate       ; 
    POST /api/v1/courses/:course_id/discussion_topics/:topic_id/duplicate
  
- [ ]           Duplicate discussion topic              DiscussionTopicsApiController#duplicate       ; 
    POST /api/v1/groups/:group_id/discussion_topics/:topic_id/duplicate
  
- [ ]           List topic entries              DiscussionTopicsApiController#entries       ; 
    GET /api/v1/courses/:course_id/discussion_topics/:topic_id/entries
  
- [ ]           List topic entries              DiscussionTopicsApiController#entries       ; 
    GET /api/v1/groups/:group_id/discussion_topics/:topic_id/entries
  
- [ ]           Post a reply              DiscussionTopicsApiController#add_reply       ; 
    POST /api/v1/courses/:course_id/discussion_topics/:topic_id/entries/:entry_id/replies
  
- [ ]           Post a reply              DiscussionTopicsApiController#add_reply       ; 
    POST /api/v1/groups/:group_id/discussion_topics/:topic_id/entries/:entry_id/replies
  
- [ ]           List entry replies              DiscussionTopicsApiController#replies       ; 
    GET /api/v1/courses/:course_id/discussion_topics/:topic_id/entries/:entry_id/replies
  
- [ ]           List entry replies              DiscussionTopicsApiController#replies       ; 
    GET /api/v1/groups/:group_id/discussion_topics/:topic_id/entries/:entry_id/replies
  
- [ ]           List entries              DiscussionTopicsApiController#entry_list       ; 
    GET /api/v1/courses/:course_id/discussion_topics/:topic_id/entry_list
  
- [ ]           List entries              DiscussionTopicsApiController#entry_list       ; 
    GET /api/v1/groups/:group_id/discussion_topics/:topic_id/entry_list
  
- [ ]           Mark topic as read              DiscussionTopicsApiController#mark_topic_read       ; 
    PUT /api/v1/courses/:course_id/discussion_topics/:topic_id/read
  
- [ ]           Mark topic as read              DiscussionTopicsApiController#mark_topic_read       ; 
    PUT /api/v1/groups/:group_id/discussion_topics/:topic_id/read
  
- [ ]           Mark topic as unread              DiscussionTopicsApiController#mark_topic_unread       ; 
    DELETE /api/v1/courses/:course_id/discussion_topics/:topic_id/read
  
- [ ]           Mark topic as unread              DiscussionTopicsApiController#mark_topic_unread       ; 
    DELETE /api/v1/groups/:group_id/discussion_topics/:topic_id/read
  
- [ ]           Mark all entries as read              DiscussionTopicsApiController#mark_all_read       ; 
    PUT /api/v1/courses/:course_id/discussion_topics/:topic_id/read_all
  
- [ ]           Mark all entries as read              DiscussionTopicsApiController#mark_all_read       ; 
    PUT /api/v1/groups/:group_id/discussion_topics/:topic_id/read_all
  
- [ ]           Mark all entries as unread              DiscussionTopicsApiController#mark_all_unread       ; 
    DELETE /api/v1/courses/:course_id/discussion_topics/:topic_id/read_all
  
- [ ]           Mark all entries as unread              DiscussionTopicsApiController#mark_all_unread       ; 
    DELETE /api/v1/groups/:group_id/discussion_topics/:topic_id/read_all
  
- [ ]           Mark entry as read              DiscussionTopicsApiController#mark_entry_read       ; 
    PUT /api/v1/courses/:course_id/discussion_topics/:topic_id/entries/:entry_id/read
  
- [ ]           Mark entry as read              DiscussionTopicsApiController#mark_entry_read       ; 
    PUT /api/v1/groups/:group_id/discussion_topics/:topic_id/entries/:entry_id/read
  
- [ ]           Mark entry as unread              DiscussionTopicsApiController#mark_entry_unread       ; 
    DELETE /api/v1/courses/:course_id/discussion_topics/:topic_id/entries/:entry_id/read
  
- [ ]           Mark entry as unread              DiscussionTopicsApiController#mark_entry_unread       ; 
    DELETE /api/v1/groups/:group_id/discussion_topics/:topic_id/entries/:entry_id/read
  
- [ ]           Rate entry              DiscussionTopicsApiController#rate_entry       ; 
    POST /api/v1/courses/:course_id/discussion_topics/:topic_id/entries/:entry_id/rating
  
- [ ]           Rate entry              DiscussionTopicsApiController#rate_entry       ; 
    POST /api/v1/groups/:group_id/discussion_topics/:topic_id/entries/:entry_id/rating
  
- [ ]           Subscribe to a topic              DiscussionTopicsApiController#subscribe_topic       ; 
    PUT /api/v1/courses/:course_id/discussion_topics/:topic_id/subscribed
  
- [ ]           Subscribe to a topic              DiscussionTopicsApiController#subscribe_topic       ; 
    PUT /api/v1/groups/:group_id/discussion_topics/:topic_id/subscribed
  
- [ ]           Unsubscribe from a topic              DiscussionTopicsApiController#unsubscribe_topic       ; 
    DELETE /api/v1/courses/:course_id/discussion_topics/:topic_id/subscribed
  
- [ ]           Unsubscribe from a topic              DiscussionTopicsApiController#unsubscribe_topic       ; 
    DELETE /api/v1/groups/:group_id/discussion_topics/:topic_id/subscribed
  
- [ ]           Create enrollment term              TermsController#create       ; 
    POST /api/v1/accounts/:account_id/terms
  
- [ ]           Update enrollment term              TermsController#update       ; 
    PUT /api/v1/accounts/:account_id/terms/:id
  
- [ ]           Delete enrollment term              TermsController#destroy       ; 
    DELETE /api/v1/accounts/:account_id/terms/:id
  
- [ ]           List enrollment terms              TermsApiController#index       ; 
    GET /api/v1/accounts/:account_id/terms
  
- [ ]           Retrieve enrollment term              TermsApiController#show       ; 
    GET /api/v1/accounts/:account_id/terms/:id
  
- [x]           List enrollments              EnrollmentsApiController#index       ; 
    GET /api/v1/courses/:course_id/enrollments
  
- [ ]           List enrollments              EnrollmentsApiController#index       ; 
    GET /api/v1/sections/:section_id/enrollments
  
- [ ]           List enrollments              EnrollmentsApiController#index       ; 
    GET /api/v1/users/:user_id/enrollments
  
- [ ]           Enrollment by ID              EnrollmentsApiController#show       ; 
    GET /api/v1/accounts/:account_id/enrollments/:id
  
- [ ]           Enroll a user              EnrollmentsApiController#create       ; 
    POST /api/v1/courses/:course_id/enrollments
  
- [ ]           Enroll a user              EnrollmentsApiController#create       ; 
    POST /api/v1/sections/:section_id/enrollments
  
- [ ]           Conclude, deactivate, or delete an enrollment              EnrollmentsApiController#destroy       ; 
    DELETE /api/v1/courses/:course_id/enrollments/:id
  
- [ ]           Accept Course Invitation              EnrollmentsApiController#accept       ; 
    POST /api/v1/courses/:course_id/enrollments/:id/accept
  
- [ ]           Reject Course Invitation              EnrollmentsApiController#reject       ; 
    POST /api/v1/courses/:course_id/enrollments/:id/reject
  
- [ ]           Re-activate an enrollment              EnrollmentsApiController#reactivate       ; 
    PUT /api/v1/courses/:course_id/enrollments/:id/reactivate
  
- [ ]           Add last attended date              EnrollmentsApiController#last_attended       ; 
    PUT /api/v1/courses/:course_id/users/:user_id/last_attended
  
- [ ]           Get all ePortfolios for a User              EportfoliosApiController#index       ; 
    GET /api/v1/users/:user_id/eportfolios
  
- [ ]           Get an ePortfolio              EportfoliosApiController#show       ; 
    GET /api/v1/eportfolios/:id
  
- [ ]           Delete an ePortfolio              EportfoliosApiController#delete       ; 
    DELETE /api/v1/eportfolios/:id
  
- [ ]           Get ePortfolio Pages              EportfoliosApiController#pages       ; 
    GET /api/v1/eportfolios/:eportfolio_id/pages
  
- [ ]           Moderate an ePortfolio              EportfoliosApiController#moderate       ; 
    PUT /api/v1/eportfolios/:eportfolio_id/moderate
  
- [ ]           Moderate all ePortfolios for a User              EportfoliosApiController#moderate_all       ; 
    PUT /api/v1/users/:user_id/eportfolios
  
- [ ]           Restore a deleted ePortfolio              EportfoliosApiController#restore       ; 
    PUT /api/v1/eportfolios/:eportfolio_id/restore
  
- [ ]           List courses with their latest ePub export              EpubExportsController#index       ; 
    GET /api/v1/epub_exports
  
- [ ]           Create ePub Export              EpubExportsController#create       ; 
    POST /api/v1/courses/:course_id/epub_exports
  
- [ ]           Show ePub export              EpubExportsController#show       ; 
    GET /api/v1/courses/:course_id/epub_exports/:id
  
- [ ]           Create Error Report              ErrorsController#create       ; 
    POST /api/v1/error_reports
  
- [ ]           List external tools              ExternalToolsController#index       ; 
    GET /api/v1/courses/:course_id/external_tools
  
- [ ]           List external tools              ExternalToolsController#index       ; 
    GET /api/v1/accounts/:account_id/external_tools
  
- [ ]           List external tools              ExternalToolsController#index       ; 
    GET /api/v1/groups/:group_id/external_tools
  
- [ ]           Get a sessionless launch url for an external tool.              ExternalToolsController#generate_sessionless_launch       ; 
    GET /api/v1/courses/:course_id/external_tools/sessionless_launch
  
- [ ]           Get a sessionless launch url for an external tool.              ExternalToolsController#generate_sessionless_launch       ; 
    GET /api/v1/accounts/:account_id/external_tools/sessionless_launch
  
- [ ]           Get a single external tool              ExternalToolsController#show       ; 
    GET /api/v1/courses/:course_id/external_tools/:external_tool_id
  
- [ ]           Get a single external tool              ExternalToolsController#show       ; 
    GET /api/v1/accounts/:account_id/external_tools/:external_tool_id
  
- [ ]           Create an external tool              ExternalToolsController#create       ; 
    POST /api/v1/courses/:course_id/external_tools
  
- [ ]           Create an external tool              ExternalToolsController#create       ; 
    POST /api/v1/accounts/:account_id/external_tools
  
- [ ]           Edit an external tool              ExternalToolsController#update       ; 
    PUT /api/v1/courses/:course_id/external_tools/:external_tool_id
  
- [ ]           Edit an external tool              ExternalToolsController#update       ; 
    PUT /api/v1/accounts/:account_id/external_tools/:external_tool_id
  
- [ ]           Delete an external tool              ExternalToolsController#destroy       ; 
    DELETE /api/v1/courses/:course_id/external_tools/:external_tool_id
  
- [ ]           Delete an external tool              ExternalToolsController#destroy       ; 
    DELETE /api/v1/accounts/:account_id/external_tools/:external_tool_id
  
- [ ]           Add tool to RCE Favorites              ExternalToolsController#add_rce_favorite       ; 
    POST /api/v1/accounts/:account_id/external_tools/rce_favorites/:id
  
- [ ]           Remove tool from RCE Favorites              ExternalToolsController#remove_rce_favorite       ; 
    DELETE /api/v1/accounts/:account_id/external_tools/rce_favorites/:id
  
- [ ]           Get visible course navigation tools              ExternalToolsController#all_visible_nav_tools       ; 
    GET /api/v1/external_tools/visible_course_nav_tools
  
- [ ]           Get visible course navigation tools for a single course              ExternalToolsController#visible_course_nav_tools       ; 
    GET /api/v1/courses/:course_id/external_tools/visible_course_nav_tools
  
- [ ]           List favorite courses              FavoritesController#list_favorite_courses       ; 
    GET /api/v1/users/self/favorites/courses
  
- [ ]           List favorite groups              FavoritesController#list_favorite_groups       ; 
    GET /api/v1/users/self/favorites/groups
  
- [ ]           Add course to favorites              FavoritesController#add_favorite_course       ; 
    POST /api/v1/users/self/favorites/courses/:id
  
- [ ]           Add group to favorites              FavoritesController#add_favorite_groups       ; 
    POST /api/v1/users/self/favorites/groups/:id
  
- [ ]           Remove course from favorites              FavoritesController#remove_favorite_course       ; 
    DELETE /api/v1/users/self/favorites/courses/:id
  
- [ ]           Remove group from favorites              FavoritesController#remove_favorite_groups       ; 
    DELETE /api/v1/users/self/favorites/groups/:id
  
- [ ]           Reset course favorites              FavoritesController#reset_course_favorites       ; 
    DELETE /api/v1/users/self/favorites/courses
  
- [ ]           Reset group favorites              FavoritesController#reset_groups_favorites       ; 
    DELETE /api/v1/users/self/favorites/groups
  
- [ ]           List features              FeatureFlagsController#index       ; 
    GET /api/v1/courses/:course_id/features
  
- [ ]           List features              FeatureFlagsController#index       ; 
    GET /api/v1/accounts/:account_id/features
  
- [ ]           List features              FeatureFlagsController#index       ; 
    GET /api/v1/users/:user_id/features
  
- [ ]           List enabled features              FeatureFlagsController#enabled_features       ; 
    GET /api/v1/courses/:course_id/features/enabled
  
- [ ]           List enabled features              FeatureFlagsController#enabled_features       ; 
    GET /api/v1/accounts/:account_id/features/enabled
  
- [ ]           List enabled features              FeatureFlagsController#enabled_features       ; 
    GET /api/v1/users/:user_id/features/enabled
  
- [ ]           List environment features              FeatureFlagsController#environment       ; 
    GET /api/v1/features/environment
  
- [ ]           Get feature flag              FeatureFlagsController#show       ; 
    GET /api/v1/courses/:course_id/features/flags/:feature
  
- [ ]           Get feature flag              FeatureFlagsController#show       ; 
    GET /api/v1/accounts/:account_id/features/flags/:feature
  
- [ ]           Get feature flag              FeatureFlagsController#show       ; 
    GET /api/v1/users/:user_id/features/flags/:feature
  
- [ ]           Set feature flag              FeatureFlagsController#update       ; 
    PUT /api/v1/courses/:course_id/features/flags/:feature
  
- [ ]           Set feature flag              FeatureFlagsController#update       ; 
    PUT /api/v1/accounts/:account_id/features/flags/:feature
  
- [ ]           Set feature flag              FeatureFlagsController#update       ; 
    PUT /api/v1/users/:user_id/features/flags/:feature
  
- [ ]           Remove feature flag              FeatureFlagsController#delete       ; 
    DELETE /api/v1/courses/:course_id/features/flags/:feature
  
- [ ]           Remove feature flag              FeatureFlagsController#delete       ; 
    DELETE /api/v1/accounts/:account_id/features/flags/:feature
  
- [ ]           Remove feature flag              FeatureFlagsController#delete       ; 
    DELETE /api/v1/users/:user_id/features/flags/:feature
  
- [ ]           Get quota information              FilesController#api_quota       ; 
    GET /api/v1/courses/:course_id/files/quota
  
- [ ]           Get quota information              FilesController#api_quota       ; 
    GET /api/v1/groups/:group_id/files/quota
  
- [ ]           Get quota information              FilesController#api_quota       ; 
    GET /api/v1/users/:user_id/files/quota
  
- [x]           List files              FilesController#api_index       ; 
    GET /api/v1/courses/:course_id/files
  
- [ ]           List files              FilesController#api_index       ; 
    GET /api/v1/users/:user_id/files
  
- [ ]           List files              FilesController#api_index       ; 
    GET /api/v1/groups/:group_id/files
  
- [ ]           List files              FilesController#api_index       ; 
    GET /api/v1/folders/:id/files
  
- [ ]           Get public inline preview url              FilesController#public_url       ; 
    GET /api/v1/files/:id/public_url
  
- [ ]           Get file              FilesController#api_show       ; 
    GET /api/v1/files/:id
  
- [ ]           Get file              FilesController#api_show       ; 
    POST /api/v1/files/:id
  
- [ ]           Get file              FilesController#api_show       ; 
    GET /api/v1/courses/:course_id/files/:id
  
- [ ]           Get file              FilesController#api_show       ; 
    GET /api/v1/groups/:group_id/files/:id
  
- [ ]           Get file              FilesController#api_show       ; 
    GET /api/v1/users/:user_id/files/:id
  
- [ ]           Translate file reference              FilesController#file_ref       ; 
    GET /api/v1/courses/:course_id/files/file_ref/:migration_id
  
- [ ]           Update file              FilesController#api_update       ; 
    PUT /api/v1/files/:id
  
- [ ]           Delete file              FilesController#destroy       ; 
    DELETE /api/v1/files/:id
  
- [ ]           Get icon metadata              FilesController#icon_metadata       ; 
    GET /api/v1/files/:id/icon_metadata
  
- [ ]           Reset link verifier              FilesController#reset_verifier       ; 
    POST /api/v1/files/:id/reset_verifier
  
- [ ]           List folders              FoldersController#api_index       ; 
    GET /api/v1/folders/:id/folders
  
- [x]           List all folders              FoldersController#list_all_folders       ; 
    GET /api/v1/courses/:course_id/folders
  
- [ ]           List all folders              FoldersController#list_all_folders       ; 
    GET /api/v1/users/:user_id/folders
  
- [ ]           List all folders              FoldersController#list_all_folders       ; 
    GET /api/v1/groups/:group_id/folders
  
- [ ]           Resolve path              FoldersController#resolve_path       ; 
    GET /api/v1/courses/:course_id/folders/by_path/*full_path
  
- [ ]           Resolve path              FoldersController#resolve_path       ; 
    GET /api/v1/courses/:course_id/folders/by_path
  
- [ ]           Resolve path              FoldersController#resolve_path       ; 
    GET /api/v1/users/:user_id/folders/by_path/*full_path
  
- [ ]           Resolve path              FoldersController#resolve_path       ; 
    GET /api/v1/users/:user_id/folders/by_path
  
- [ ]           Resolve path              FoldersController#resolve_path       ; 
    GET /api/v1/groups/:group_id/folders/by_path/*full_path
  
- [ ]           Resolve path              FoldersController#resolve_path       ; 
    GET /api/v1/groups/:group_id/folders/by_path
  
- [ ]           Get folder              FoldersController#show       ; 
    GET /api/v1/courses/:course_id/folders/:id
  
- [ ]           Get folder              FoldersController#show       ; 
    GET /api/v1/users/:user_id/folders/:id
  
- [ ]           Get folder              FoldersController#show       ; 
    GET /api/v1/groups/:group_id/folders/:id
  
- [ ]           Get folder              FoldersController#show       ; 
    GET /api/v1/folders/:id
  
- [ ]           Update folder              FoldersController#update       ; 
    PUT /api/v1/folders/:id
  
- [x]           Create folder              FoldersController#create       ; 
    POST /api/v1/courses/:course_id/folders
  
- [ ]           Create folder              FoldersController#create       ; 
    POST /api/v1/users/:user_id/folders
  
- [ ]           Create folder              FoldersController#create       ; 
    POST /api/v1/groups/:group_id/folders
  
- [ ]           Create folder              FoldersController#create       ; 
    POST /api/v1/folders/:folder_id/folders
  
- [ ]           Delete folder              FoldersController#api_destroy       ; 
    DELETE /api/v1/folders/:id
  
- [ ]           Upload a file              FoldersController#create_file       ; 
    POST /api/v1/folders/:folder_id/files
  
- [ ]           Copy a file              FoldersController#copy_file       ; 
    POST /api/v1/folders/:dest_folder_id/copy_file
  
- [ ]           Copy a folder              FoldersController#copy_folder       ; 
    POST /api/v1/folders/:dest_folder_id/copy_folder
  
- [ ]           Get uploaded media folder for user              FoldersController#media_folder       ; 
    GET /api/v1/courses/:course_id/folders/media
  
- [ ]           Get uploaded media folder for user              FoldersController#media_folder       ; 
    GET /api/v1/groups/:group_id/folders/media
  
- [ ]           Set usage rights              UsageRightsController#set_usage_rights       ; 
    PUT /api/v1/courses/:course_id/usage_rights
  
- [ ]           Set usage rights              UsageRightsController#set_usage_rights       ; 
    PUT /api/v1/groups/:group_id/usage_rights
  
- [ ]           Set usage rights              UsageRightsController#set_usage_rights       ; 
    PUT /api/v1/users/:user_id/usage_rights
  
- [ ]           Remove usage rights              UsageRightsController#remove_usage_rights       ; 
    DELETE /api/v1/courses/:course_id/usage_rights
  
- [ ]           Remove usage rights              UsageRightsController#remove_usage_rights       ; 
    DELETE /api/v1/groups/:group_id/usage_rights
  
- [ ]           Remove usage rights              UsageRightsController#remove_usage_rights       ; 
    DELETE /api/v1/users/:user_id/usage_rights
  
- [ ]           List licenses              UsageRightsController#licenses       ; 
    GET /api/v1/courses/:course_id/content_licenses
  
- [ ]           List licenses              UsageRightsController#licenses       ; 
    GET /api/v1/groups/:group_id/content_licenses
  
- [ ]           List licenses              UsageRightsController#licenses       ; 
    GET /api/v1/users/:user_id/content_licenses
  
- [ ]           Query by assignment              GradeChangeAuditApiController#for_assignment       ; 
    GET /api/v1/audit/grade_change/assignments/:assignment_id
  
- [ ]           Query by course              GradeChangeAuditApiController#for_course       ; 
    GET /api/v1/audit/grade_change/courses/:course_id
  
- [ ]           Query by student              GradeChangeAuditApiController#for_student       ; 
    GET /api/v1/audit/grade_change/students/:student_id
  
- [ ]           Query by grader              GradeChangeAuditApiController#for_grader       ; 
    GET /api/v1/audit/grade_change/graders/:grader_id
  
- [ ]           Advanced query              GradeChangeAuditApiController#query       ; 
    GET /api/v1/audit/grade_change
  
- [ ]           Days in gradebook history for this course              GradebookHistoryApiController#days       ; 
    GET /api/v1/courses/:course_id/gradebook_history/days
  
- [ ]           Details for a given date in gradebook history for this course              GradebookHistoryApiController#day_details       ; 
    GET /api/v1/courses/:course_id/gradebook_history/:date
  
- [ ]           Lists submissions              GradebookHistoryApiController#submissions       ; 
    GET /api/v1/courses/:course_id/gradebook_history/:date/graders/:grader_id/assignments/:assignment_id/submissions
  
- [ ]           List uncollated submission versions              GradebookHistoryApiController#feed       ; 
    GET /api/v1/courses/:course_id/gradebook_history/feed
  
- [ ]           List grading period sets              GradingPeriodSetsController#index       ; 
    GET /api/v1/accounts/:account_id/grading_period_sets
  
- [ ]           Create a grading period set              GradingPeriodSetsController#create       ; 
    POST /api/v1/accounts/:account_id/grading_period_sets
  
- [ ]           Update a grading period set              GradingPeriodSetsController#update       ; 
    PATCH /api/v1/accounts/:account_id/grading_period_sets/:id
  
- [ ]           Delete a grading period set              GradingPeriodSetsController#destroy       ; 
    DELETE /api/v1/accounts/:account_id/grading_period_sets/:id
  
- [ ]           List grading periods              GradingPeriodsController#index       ; 
    GET /api/v1/accounts/:account_id/grading_periods
  
- [ ]           List grading periods              GradingPeriodsController#index       ; 
    GET /api/v1/courses/:course_id/grading_periods
  
- [ ]           Get a single grading period              GradingPeriodsController#show       ; 
    GET /api/v1/courses/:course_id/grading_periods/:id
  
- [ ]           Update a single grading period              GradingPeriodsController#update       ; 
    PUT /api/v1/courses/:course_id/grading_periods/:id
  
- [ ]           Delete a grading period              GradingPeriodsController#destroy       ; 
    DELETE /api/v1/courses/:course_id/grading_periods/:id
  
- [ ]           Delete a grading period              GradingPeriodsController#destroy       ; 
    DELETE /api/v1/accounts/:account_id/grading_periods/:id
  
- [ ]           Batch update grading periods              GradingPeriodsController#batch_update       ; 
    PATCH /api/v1/courses/:course_id/grading_periods/batch_update
  
- [ ]           Batch update grading periods              GradingPeriodsController#batch_update       ; 
    PATCH /api/v1/grading_period_sets/:set_id/grading_periods/batch_update
  
- [ ]           Create a new grading standard              GradingStandardsApiController#create       ; 
    POST /api/v1/accounts/:account_id/grading_standards
  
- [ ]           Create a new grading standard              GradingStandardsApiController#create       ; 
    POST /api/v1/courses/:course_id/grading_standards
  
- [ ]           List the grading standards available in a context.              GradingStandardsApiController#context_index       ; 
    GET /api/v1/courses/:course_id/grading_standards
  
- [ ]           List the grading standards available in a context.              GradingStandardsApiController#context_index       ; 
    GET /api/v1/accounts/:account_id/grading_standards
  
- [ ]           Get a single grading standard in a context.              GradingStandardsApiController#context_show       ; 
    GET /api/v1/courses/:course_id/grading_standards/:grading_standard_id
  
- [ ]           Get a single grading standard in a context.              GradingStandardsApiController#context_show       ; 
    GET /api/v1/accounts/:account_id/grading_standards/:grading_standard_id
  
- [ ]           List group categories for a context              GroupCategoriesController#index       ; 
    GET /api/v1/accounts/:account_id/group_categories
  
- [x]           List group categories for a context              GroupCategoriesController#index       ; 
    GET /api/v1/courses/:course_id/group_categories
  
- [ ]           Get a single group category              GroupCategoriesController#show       ; 
    GET /api/v1/group_categories/:group_category_id
  
- [ ]           Create a Group Category              GroupCategoriesController#create       ; 
    POST /api/v1/accounts/:account_id/group_categories
  
- [x]           Create a Group Category              GroupCategoriesController#create       ; 
    POST /api/v1/courses/:course_id/group_categories
  
- [ ]           Import category groups              GroupCategoriesController#import       ; 
    POST /api/v1/group_categories/:group_category_id/import
  
- [ ]           Update a Group Category              GroupCategoriesController#update       ; 
    PUT /api/v1/group_categories/:group_category_id
  
- [ ]           Delete a Group Category              GroupCategoriesController#destroy       ; 
    DELETE /api/v1/group_categories/:group_category_id
  
- [ ]           List groups in group category              GroupCategoriesController#groups       ; 
    GET /api/v1/group_categories/:group_category_id/groups
  
- [ ]           export groups in and users in category              GroupCategoriesController#export       ; 
    GET /api/v1/group_categories/:group_category_id/export
  
- [ ]           List users in group category              GroupCategoriesController#users       ; 
    GET /api/v1/group_categories/:group_category_id/users
  
- [ ]           Assign unassigned members              GroupCategoriesController#assign_unassigned_members       ; 
    POST /api/v1/group_categories/:group_category_id/assign_unassigned_members
  
- [ ]           List your groups              GroupsController#index       ; 
    GET /api/v1/users/self/groups
  
- [ ]           List the groups available in a context.              GroupsController#context_index       ; 
    GET /api/v1/accounts/:account_id/groups
  
- [x]           List the groups available in a context.              GroupsController#context_index       ; 
    GET /api/v1/courses/:course_id/groups
  
- [x]           Get a single group              GroupsController#show       ; 
    GET /api/v1/groups/:group_id
  
- [ ]           Create a group              GroupsController#create       ; 
    POST /api/v1/groups
  
- [ ]           Create a group              GroupsController#create       ; 
    POST /api/v1/group_categories/:group_category_id/groups
  
- [ ]           Edit a group              GroupsController#update       ; 
    PUT /api/v1/groups/:group_id
  
- [ ]           Delete a group              GroupsController#destroy       ; 
    DELETE /api/v1/groups/:group_id
  
- [ ]           Invite others to a group              GroupsController#invite       ; 
    POST /api/v1/groups/:group_id/invite
  
- [x]           List group's users              GroupsController#users       ; 
    GET /api/v1/groups/:group_id/users
  
- [ ]           Upload a file              GroupsController#create_file       ; 
    POST /api/v1/groups/:group_id/files
  
- [ ]           Preview processed html              GroupsController#preview_html       ; 
    POST /api/v1/groups/:group_id/preview_html
  
- [ ]           Group activity stream              GroupsController#activity_stream       ; 
    GET /api/v1/groups/:group_id/activity_stream
  
- [ ]           Group activity stream summary              GroupsController#activity_stream_summary       ; 
    GET /api/v1/groups/:group_id/activity_stream/summary
  
- [ ]           Permissions              GroupsController#permissions       ; 
    GET /api/v1/groups/:group_id/permissions
  
- [x]           List group memberships              GroupMembershipsController#index       ; 
    GET /api/v1/groups/:group_id/memberships
  
- [ ]           Get a single group membership              GroupMembershipsController#show       ; 
    GET /api/v1/groups/:group_id/memberships/:membership_id
  
- [ ]           Get a single group membership              GroupMembershipsController#show       ; 
    GET /api/v1/groups/:group_id/users/:user_id
  
- [ ]           Create a membership              GroupMembershipsController#create       ; 
    POST /api/v1/groups/:group_id/memberships
  
- [ ]           Update a membership              GroupMembershipsController#update       ; 
    PUT /api/v1/groups/:group_id/memberships/:membership_id
  
- [ ]           Update a membership              GroupMembershipsController#update       ; 
    PUT /api/v1/groups/:group_id/users/:user_id
  
- [ ]           Leave a group              GroupMembershipsController#destroy       ; 
    DELETE /api/v1/groups/:group_id/memberships/:membership_id
  
- [ ]           Leave a group              GroupMembershipsController#destroy       ; 
    DELETE /api/v1/groups/:group_id/users/:user_id
  
- [ ]           List recent history for a user              HistoryController#index       ; 
    GET /api/v1/users/:user_id/history
  
- [ ]           Create InstAccess token              InstAccessTokensController#create       ; 
    POST /api/v1/inst_access_tokens
  
- [ ]           Create JWT              JwtsController#create       ; 
    POST /api/v1/jwts
  
- [ ]           Refresh JWT              JwtsController#refresh       ; 
    POST /api/v1/jwts/refresh
  
- [ ]           Get a late policy              LatePolicyController#show       ; 
    GET /api/v1/courses/:id/late_policy
  
- [ ]           Create a late policy              LatePolicyController#create       ; 
    POST /api/v1/courses/:id/late_policy
  
- [ ]           Patch a late policy              LatePolicyController#update       ; 
    PATCH /api/v1/courses/:id/late_policy
  
- [ ]           Create a Line Item              Lti::Ims::LineItemsController#create       ; 
    POST /api/lti/courses/:course_id/line_items
  
- [ ]           Update a Line Item              Lti::Ims::LineItemsController#update       ; 
    PUT /api/lti/courses/:course_id/line_items/:id
  
- [ ]           Show a Line Item              Lti::Ims::LineItemsController#show       ; 
    GET /api/lti/courses/:course_id/line_items/:id
  
- [ ]           List line Items              Lti::Ims::LineItemsController#index       ; 
    GET /api/lti/courses/:course_id/line_items
  
- [ ]           Delete a Line Item              Lti::Ims::LineItemsController#destroy       ; 
    DELETE /api/lti/courses/:course_id/line_items/:id
  
- [ ]           Create live assessment results              LiveAssessments::ResultsController#create       ; 
    POST /api/v1/courses/:course_id/live_assessments/:assessment_id/results
  
- [ ]           List live assessment results              LiveAssessments::ResultsController#index       ; 
    GET /api/v1/courses/:course_id/live_assessments/:assessment_id/results
  
- [ ]           Create or find a live assessment              LiveAssessments::AssessmentsController#create       ; 
    POST /api/v1/courses/:course_id/live_assessments
  
- [ ]           List live assessments              LiveAssessments::AssessmentsController#index       ; 
    GET /api/v1/courses/:course_id/live_assessments
  
- [ ]           List user logins              PseudonymsController#index       ; 
    GET /api/v1/accounts/:account_id/logins
  
- [ ]           List user logins              PseudonymsController#index       ; 
    GET /api/v1/users/:user_id/logins
  
- [ ]           Kickoff password recovery flow              PseudonymsController#forgot_password       ; 
    POST /api/v1/users/reset_password
  
- [ ]           Create a user login              PseudonymsController#create       ; 
    POST /api/v1/accounts/:account_id/logins
  
- [ ]           Edit a user login              PseudonymsController#update       ; 
    PUT /api/v1/accounts/:account_id/logins/:id
  
- [ ]           Delete a user login              PseudonymsController#destroy       ; 
    DELETE /api/v1/users/:user_id/logins/:id
  
- [ ]           List media tracks for a Media Object or Attachment              MediaTracksController#index       ; 
    GET /api/v1/media_objects/:media_object_id/media_tracks
  
- [ ]           List media tracks for a Media Object or Attachment              MediaTracksController#index       ; 
    GET /api/v1/media_attachments/:attachment_id/media_tracks
  
- [ ]           Update Media Tracks              MediaTracksController#update       ; 
    PUT /api/v1/media_objects/:media_object_id/media_tracks
  
- [ ]           Update Media Tracks              MediaTracksController#update       ; 
    PUT /api/v1/media_attachments/:attachment_id/media_tracks
  
- [ ]           List Media Objects              MediaObjectsController#index       ; 
    GET /api/v1/media_objects
  
- [ ]           List Media Objects              MediaObjectsController#index       ; 
    GET /api/v1/courses/:course_id/media_objects
  
- [ ]           List Media Objects              MediaObjectsController#index       ; 
    GET /api/v1/groups/:group_id/media_objects
  
- [ ]           List Media Objects              MediaObjectsController#index       ; 
    GET /api/v1/media_attachments
  
- [ ]           List Media Objects              MediaObjectsController#index       ; 
    GET /api/v1/courses/:course_id/media_attachments
  
- [ ]           List Media Objects              MediaObjectsController#index       ; 
    GET /api/v1/groups/:group_id/media_attachments
  
- [ ]           Update Media Object              MediaObjectsController#update_media_object       ; 
    PUT /api/v1/media_objects/:media_object_id
  
- [ ]           Update Media Object              MediaObjectsController#update_media_object       ; 
    PUT /api/v1/media_attachments/:attachment_id
  
- [ ]           List students selected for moderation              ModerationSetController#index       ; 
    GET /api/v1/courses/:course_id/assignments/:assignment_id/moderated_students
  
- [ ]           Select students for moderation              ModerationSetController#create       ; 
    POST /api/v1/courses/:course_id/assignments/:assignment_id/moderated_students
  
- [ ]           Bulk select provisional grades              ProvisionalGradesController#bulk_select       ; 
    PUT /api/v1/courses/:course_id/assignments/:assignment_id/provisional_grades/bulk_select
  
- [ ]           Show provisional grade status for a student              ProvisionalGradesController#status       ; 
    GET /api/v1/courses/:course_id/assignments/:assignment_id/provisional_grades/status
  
- [ ]           Select provisional grade              ProvisionalGradesController#select       ; 
    PUT /api/v1/courses/:course_id/assignments/:assignment_id/provisional_grades/:provisional_grade_id/select
  
- [ ]           Publish provisional grades for an assignment              ProvisionalGradesController#publish       ; 
    POST /api/v1/courses/:course_id/assignments/:assignment_id/provisional_grades/publish
  
- [ ]           Show provisional grade status for a student              AnonymousProvisionalGradesController#status       ; 
    GET /api/v1/courses/:course_id/assignments/:assignment_id/anonymous_provisional_grades/status
  
- [x]           List modules              ContextModulesApiController#index       ; 
    GET /api/v1/courses/:course_id/modules
  
- [ ]           Show module              ContextModulesApiController#show       ; 
    GET /api/v1/courses/:course_id/modules/:id
  
- [ ]           Create a module              ContextModulesApiController#create       ; 
    POST /api/v1/courses/:course_id/modules
  
- [ ]           Update a module              ContextModulesApiController#update       ; 
    PUT /api/v1/courses/:course_id/modules/:id
  
- [ ]           Delete module              ContextModulesApiController#destroy       ; 
    DELETE /api/v1/courses/:course_id/modules/:id
  
- [ ]           Re-lock module progressions              ContextModulesApiController#relock       ; 
    PUT /api/v1/courses/:course_id/modules/:id/relock
  
- [x]           List module items              ContextModuleItemsApiController#index       ; 
    GET /api/v1/courses/:course_id/modules/:module_id/items
  
- [ ]           Show module item              ContextModuleItemsApiController#show       ; 
    GET /api/v1/courses/:course_id/modules/:module_id/items/:id
  
- [ ]           Create a module item              ContextModuleItemsApiController#create       ; 
    POST /api/v1/courses/:course_id/modules/:module_id/items
  
- [ ]           Update a module item              ContextModuleItemsApiController#update       ; 
    PUT /api/v1/courses/:course_id/modules/:module_id/items/:id
  
- [ ]           Select a mastery path              ContextModuleItemsApiController#select_mastery_path       ; 
    POST /api/v1/courses/:course_id/modules/:module_id/items/:id/select_mastery_path
  
- [ ]           Delete module item              ContextModuleItemsApiController#destroy       ; 
    DELETE /api/v1/courses/:course_id/modules/:module_id/items/:id
  
- [ ]           Mark module item as done/not done              ContextModuleItemsApiController#mark_as_done       ; 
    PUT /api/v1/courses/:course_id/modules/:module_id/items/:id/done
  
- [ ]           Get module item sequence              ContextModuleItemsApiController#item_sequence       ; 
    GET /api/v1/courses/:course_id/module_item_sequence
  
- [ ]           Mark module item read              ContextModuleItemsApiController#mark_item_read       ; 
    POST /api/v1/courses/:course_id/modules/:module_id/items/:id/mark_read
  
- [ ]           List Course Memberships              Lti::Ims::NamesAndRolesController#course_index       ; 
    GET /api/lti/courses/:course_id/names_and_roles
  
- [ ]           List Group Memberships              Lti::Ims::NamesAndRolesController#group_index       ; 
    GET /api/lti/groups/:group_id/names_and_roles
  
- [ ]           Get a quiz item           ; 
    GET /api/quiz/v1/courses/:course_id/quizzes/:assignment_id/items/:item_id
  
- [ ]           List quiz items           ; 
    GET /api/quiz/v1/courses/:course_id/quizzes/:assignment_id/items
  
- [ ]           Create a quiz item           ; 
    POST /api/quiz/v1/courses/:course_id/quizzes/:assignment_id/items
  
- [ ]           Update a quiz item           ; 
    PATCH /api/quiz/v1/courses/:course_id/quizzes/:assignment_id/items/:item_id
  
- [ ]           Delete a quiz item           ; 
    DELETE /api/quiz/v1/courses/:course_id/quizzes/:assignment_id/items/:item_id
  
- [ ]           Get items media_upload_url           ; 
    GET /api/quiz/v1/courses/:course_id/quizzes/:assignment_id/items/media_upload_url
  
- [ ]           Get a new quiz           ; 
    GET /api/quiz/v1/courses/:course_id/quizzes/:assignment_id
  
- [x]           List new quizzes           ; 
    GET /api/quiz/v1/courses/:course_id/quizzes
  
- [ ]           Create a new quiz           ; 
    POST /api/quiz/v1/courses/:course_id/quizzes
  
- [ ]           Update a single quiz           ; 
    PATCH /api/quiz/v1/courses/:course_id/quizzes/:assignment_id
  
- [ ]           Delete a new quiz           ; 
    DELETE /api/quiz/v1/courses/:course_id/quizzes/:assignment_id
  
- [ ]           List preferences              NotificationPreferencesController#index       ; 
    GET /api/v1/users/:user_id/communication_channels/:communication_channel_id/notification_preferences
  
- [ ]           List preferences              NotificationPreferencesController#index       ; 
    GET /api/v1/users/:user_id/communication_channels/:type/:address/notification_preferences
  
- [ ]           List of preference categories              NotificationPreferencesController#category_index       ; 
    GET /api/v1/users/:user_id/communication_channels/:communication_channel_id/notification_preference_categories
  
- [ ]           Get a preference              NotificationPreferencesController#show       ; 
    GET /api/v1/users/:user_id/communication_channels/:communication_channel_id/notification_preferences/:notification
  
- [ ]           Get a preference              NotificationPreferencesController#show       ; 
    GET /api/v1/users/:user_id/communication_channels/:type/:address/notification_preferences/:notification
  
- [ ]           Update a preference              NotificationPreferencesController#update       ; 
    PUT /api/v1/users/self/communication_channels/:communication_channel_id/notification_preferences/:notification
  
- [ ]           Update a preference              NotificationPreferencesController#update       ; 
    PUT /api/v1/users/self/communication_channels/:type/:address/notification_preferences/:notification
  
- [ ]           Update preferences by category              NotificationPreferencesController#update_preferences_by_category       ; 
    PUT /api/v1/users/self/communication_channels/:communication_channel_id/notification_preference_categories/:category
  
- [ ]           Update multiple preferences              NotificationPreferencesController#update_all       ; 
    PUT /api/v1/users/self/communication_channels/:communication_channel_id/notification_preferences
  
- [ ]           Update multiple preferences              NotificationPreferencesController#update_all       ; 
    PUT /api/v1/users/self/communication_channels/:type/:address/notification_preferences
  
- [ ]           Create an Originality Report              Lti::OriginalityReportsApiController#create       ; 
    POST /api/lti/assignments/:assignment_id/submissions/:submission_id/originality_report
  
- [ ]           Edit an Originality Report              Lti::OriginalityReportsApiController#update       ; 
    PUT /api/lti/assignments/:assignment_id/submissions/:submission_id/originality_report/:id
  
- [ ]           Edit an Originality Report              Lti::OriginalityReportsApiController#update       ; 
    PUT /api/lti/assignments/:assignment_id/files/:file_id/originality_report
  
- [ ]           Show an Originality Report              Lti::OriginalityReportsApiController#show       ; 
    GET /api/lti/assignments/:assignment_id/submissions/:submission_id/originality_report/:id
  
- [ ]           Show an Originality Report              Lti::OriginalityReportsApiController#show       ; 
    GET /api/lti/assignments/:assignment_id/files/:file_id/originality_report
  
- [ ]           Redirect to root outcome group for context              OutcomeGroupsApiController#redirect       ; 
    GET /api/v1/global/root_outcome_group
  
- [ ]           Redirect to root outcome group for context              OutcomeGroupsApiController#redirect       ; 
    GET /api/v1/accounts/:account_id/root_outcome_group
  
- [ ]           Redirect to root outcome group for context              OutcomeGroupsApiController#redirect       ; 
    GET /api/v1/courses/:course_id/root_outcome_group
  
- [ ]           Get all outcome groups for context              OutcomeGroupsApiController#index       ; 
    GET /api/v1/accounts/:account_id/outcome_groups
  
- [ ]           Get all outcome groups for context              OutcomeGroupsApiController#index       ; 
    GET /api/v1/courses/:course_id/outcome_groups
  
- [ ]           Get all outcome links for context              OutcomeGroupsApiController#link_index       ; 
    GET /api/v1/accounts/:account_id/outcome_group_links
  
- [ ]           Get all outcome links for context              OutcomeGroupsApiController#link_index       ; 
    GET /api/v1/courses/:course_id/outcome_group_links
  
- [ ]           Show an outcome group              OutcomeGroupsApiController#show       ; 
    GET /api/v1/global/outcome_groups/:id
  
- [ ]           Show an outcome group              OutcomeGroupsApiController#show       ; 
    GET /api/v1/accounts/:account_id/outcome_groups/:id
  
- [ ]           Show an outcome group              OutcomeGroupsApiController#show       ; 
    GET /api/v1/courses/:course_id/outcome_groups/:id
  
- [ ]           Update an outcome group              OutcomeGroupsApiController#update       ; 
    PUT /api/v1/global/outcome_groups/:id
  
- [ ]           Update an outcome group              OutcomeGroupsApiController#update       ; 
    PUT /api/v1/accounts/:account_id/outcome_groups/:id
  
- [ ]           Update an outcome group              OutcomeGroupsApiController#update       ; 
    PUT /api/v1/courses/:course_id/outcome_groups/:id
  
- [ ]           Delete an outcome group              OutcomeGroupsApiController#destroy       ; 
    DELETE /api/v1/global/outcome_groups/:id
  
- [ ]           Delete an outcome group              OutcomeGroupsApiController#destroy       ; 
    DELETE /api/v1/accounts/:account_id/outcome_groups/:id
  
- [ ]           Delete an outcome group              OutcomeGroupsApiController#destroy       ; 
    DELETE /api/v1/courses/:course_id/outcome_groups/:id
  
- [ ]           List linked outcomes              OutcomeGroupsApiController#outcomes       ; 
    GET /api/v1/global/outcome_groups/:id/outcomes
  
- [ ]           List linked outcomes              OutcomeGroupsApiController#outcomes       ; 
    GET /api/v1/accounts/:account_id/outcome_groups/:id/outcomes
  
- [ ]           List linked outcomes              OutcomeGroupsApiController#outcomes       ; 
    GET /api/v1/courses/:course_id/outcome_groups/:id/outcomes
  
- [ ]           Create/link an outcome              OutcomeGroupsApiController#link       ; 
    POST /api/v1/global/outcome_groups/:id/outcomes
  
- [ ]           Create/link an outcome              OutcomeGroupsApiController#link       ; 
    PUT /api/v1/global/outcome_groups/:id/outcomes/:outcome_id
  
- [ ]           Create/link an outcome              OutcomeGroupsApiController#link       ; 
    POST /api/v1/accounts/:account_id/outcome_groups/:id/outcomes
  
- [ ]           Create/link an outcome              OutcomeGroupsApiController#link       ; 
    PUT /api/v1/accounts/:account_id/outcome_groups/:id/outcomes/:outcome_id
  
- [ ]           Create/link an outcome              OutcomeGroupsApiController#link       ; 
    POST /api/v1/courses/:course_id/outcome_groups/:id/outcomes
  
- [ ]           Create/link an outcome              OutcomeGroupsApiController#link       ; 
    PUT /api/v1/courses/:course_id/outcome_groups/:id/outcomes/:outcome_id
  
- [ ]           Unlink an outcome              OutcomeGroupsApiController#unlink       ; 
    DELETE /api/v1/global/outcome_groups/:id/outcomes/:outcome_id
  
- [ ]           Unlink an outcome              OutcomeGroupsApiController#unlink       ; 
    DELETE /api/v1/accounts/:account_id/outcome_groups/:id/outcomes/:outcome_id
  
- [ ]           Unlink an outcome              OutcomeGroupsApiController#unlink       ; 
    DELETE /api/v1/courses/:course_id/outcome_groups/:id/outcomes/:outcome_id
  
- [ ]           List subgroups              OutcomeGroupsApiController#subgroups       ; 
    GET /api/v1/global/outcome_groups/:id/subgroups
  
- [ ]           List subgroups              OutcomeGroupsApiController#subgroups       ; 
    GET /api/v1/accounts/:account_id/outcome_groups/:id/subgroups
  
- [ ]           List subgroups              OutcomeGroupsApiController#subgroups       ; 
    GET /api/v1/courses/:course_id/outcome_groups/:id/subgroups
  
- [ ]           Create a subgroup              OutcomeGroupsApiController#create       ; 
    POST /api/v1/global/outcome_groups/:id/subgroups
  
- [ ]           Create a subgroup              OutcomeGroupsApiController#create       ; 
    POST /api/v1/accounts/:account_id/outcome_groups/:id/subgroups
  
- [ ]           Create a subgroup              OutcomeGroupsApiController#create       ; 
    POST /api/v1/courses/:course_id/outcome_groups/:id/subgroups
  
- [ ]           Import an outcome group              OutcomeGroupsApiController#import       ; 
    POST /api/v1/global/outcome_groups/:id/import
  
- [ ]           Import an outcome group              OutcomeGroupsApiController#import       ; 
    POST /api/v1/accounts/:account_id/outcome_groups/:id/import
  
- [ ]           Import an outcome group              OutcomeGroupsApiController#import       ; 
    POST /api/v1/courses/:course_id/outcome_groups/:id/import
  
- [ ]           Import Outcomes              OutcomeImportsApiController#create       ; 
    POST /api/v1/accounts/:account_id/outcome_imports(/group/:learning_outcome_group_id)
  
- [ ]           Import Outcomes              OutcomeImportsApiController#create       ; 
    POST /api/v1/courses/:course_id/outcome_imports(/group/:learning_outcome_group_id)
  
- [ ]           Get Outcome import status              OutcomeImportsApiController#show       ; 
    GET /api/v1/accounts/:account_id/outcome_imports/:id
  
- [ ]           Get Outcome import status              OutcomeImportsApiController#show       ; 
    GET /api/v1/courses/:course_id/outcome_imports/:id
  
- [ ]           Get IDs of outcome groups created after successful import              OutcomeImportsApiController#created_group_ids       ; 
    GET /api/v1/accounts/:account_id/outcome_imports/:id/created_group_ids
  
- [ ]           Get IDs of outcome groups created after successful import              OutcomeImportsApiController#created_group_ids       ; 
    GET /api/v1/courses/:course_id/outcome_imports/:id/created_group_ids
  
- [ ]           Get outcome results              OutcomeResultsController#index       ; 
    GET /api/v1/courses/:course_id/outcome_results
  
- [ ]           Get outcome result rollups              OutcomeResultsController#rollups       ; 
    GET /api/v1/courses/:course_id/outcome_rollups
  
- [ ]           Show an outcome              OutcomesApiController#show       ; 
    GET /api/v1/outcomes/:id
  
- [ ]           Update an outcome              OutcomesApiController#update       ; 
    PUT /api/v1/outcomes/:id
  
- [ ]           Get aligned assignments for an outcome in a course for a particular student              OutcomesApiController#outcome_alignments       ; 
    GET /api/v1/courses/:course_id/outcome_alignments
  
- [ ]           Show front page              WikiPagesApiController#show_front_page       ; 
    GET /api/v1/courses/:course_id/front_page
  
- [ ]           Show front page              WikiPagesApiController#show_front_page       ; 
    GET /api/v1/groups/:group_id/front_page
  
- [ ]           Duplicate page              WikiPagesApiController#duplicate       ; 
    POST /api/v1/courses/:course_id/pages/:url_or_id/duplicate
  
- [ ]           Update/create front page              WikiPagesApiController#update_front_page       ; 
    PUT /api/v1/courses/:course_id/front_page
  
- [ ]           Update/create front page              WikiPagesApiController#update_front_page       ; 
    PUT /api/v1/groups/:group_id/front_page
  
- [x]           List pages              WikiPagesApiController#index       ; 
    GET /api/v1/courses/:course_id/pages
  
- [ ]           List pages              WikiPagesApiController#index       ; 
    GET /api/v1/groups/:group_id/pages
  
- [x]           Create page              WikiPagesApiController#create       ; 
    POST /api/v1/courses/:course_id/pages
  
- [ ]           Create page              WikiPagesApiController#create       ; 
    POST /api/v1/groups/:group_id/pages
  
- [ ]           Show page              WikiPagesApiController#show       ; 
    GET /api/v1/courses/:course_id/pages/:url_or_id
  
- [ ]           Show page              WikiPagesApiController#show       ; 
    GET /api/v1/groups/:group_id/pages/:url_or_id
  
- [ ]           Update/create page              WikiPagesApiController#update       ; 
    PUT /api/v1/courses/:course_id/pages/:url_or_id
  
- [ ]           Update/create page              WikiPagesApiController#update       ; 
    PUT /api/v1/groups/:group_id/pages/:url_or_id
  
- [ ]           Delete page              WikiPagesApiController#destroy       ; 
    DELETE /api/v1/courses/:course_id/pages/:url_or_id
  
- [ ]           Delete page              WikiPagesApiController#destroy       ; 
    DELETE /api/v1/groups/:group_id/pages/:url_or_id
  
- [ ]           List revisions              WikiPagesApiController#revisions       ; 
    GET /api/v1/courses/:course_id/pages/:url_or_id/revisions
  
- [ ]           List revisions              WikiPagesApiController#revisions       ; 
    GET /api/v1/groups/:group_id/pages/:url_or_id/revisions
  
- [ ]           Show revision              WikiPagesApiController#show_revision       ; 
    GET /api/v1/courses/:course_id/pages/:url_or_id/revisions/latest
  
- [ ]           Show revision              WikiPagesApiController#show_revision       ; 
    GET /api/v1/groups/:group_id/pages/:url_or_id/revisions/latest
  
- [ ]           Show revision              WikiPagesApiController#show_revision       ; 
    GET /api/v1/courses/:course_id/pages/:url_or_id/revisions/:revision_id
  
- [ ]           Show revision              WikiPagesApiController#show_revision       ; 
    GET /api/v1/groups/:group_id/pages/:url_or_id/revisions/:revision_id
  
- [ ]           Revert to revision              WikiPagesApiController#revert       ; 
    POST /api/v1/courses/:course_id/pages/:url_or_id/revisions/:revision_id
  
- [ ]           Revert to revision              WikiPagesApiController#revert       ; 
    POST /api/v1/groups/:group_id/pages/:url_or_id/revisions/:revision_id
  
- [ ]           Get all Peer Reviews              PeerReviewsApiController#index       ; 
    GET /api/v1/courses/:course_id/assignments/:assignment_id/peer_reviews
  
- [ ]           Get all Peer Reviews              PeerReviewsApiController#index       ; 
    GET /api/v1/sections/:section_id/assignments/:assignment_id/peer_reviews
  
- [ ]           Get all Peer Reviews              PeerReviewsApiController#index       ; 
    GET /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:submission_id/peer_reviews
  
- [ ]           Get all Peer Reviews              PeerReviewsApiController#index       ; 
    GET /api/v1/sections/:section_id/assignments/:assignment_id/submissions/:submission_id/peer_reviews
  
- [ ]           Create Peer Review              PeerReviewsApiController#create       ; 
    POST /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:submission_id/peer_reviews
  
- [ ]           Create Peer Review              PeerReviewsApiController#create       ; 
    POST /api/v1/sections/:section_id/assignments/:assignment_id/submissions/:submission_id/peer_reviews
  
- [ ]           Delete Peer Review              PeerReviewsApiController#destroy       ; 
    DELETE /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:submission_id/peer_reviews
  
- [ ]           Delete Peer Review              PeerReviewsApiController#destroy       ; 
    DELETE /api/v1/sections/:section_id/assignments/:assignment_id/submissions/:submission_id/peer_reviews
  
- [ ]           Get a single assignment (lti)              Lti::PlagiarismAssignmentsApiController#show       ; 
    GET /api/lti/assignments/:assignment_id
  
- [ ]           Get a single user (lti)              Lti::UsersApiController#show       ; 
    GET /api/lti/users/:id
  
- [ ]           Get all users in a group (lti)              Lti::UsersApiController#group_index       ; 
    GET /api/lti/groups/:group_id/users
  
- [ ]           Get a single submission              Lti::SubmissionsApiController#show       ; 
    GET /api/lti/assignments/:assignment_id/submissions/:submission_id
  
- [ ]           Get the history of a single submission              Lti::SubmissionsApiController#history       ; 
    GET /api/lti/assignments/:assignment_id/submissions/:submission_id/history
  
- [ ]           List planner items              PlannerController#index       ; 
    GET /api/v1/planner/items
  
- [ ]           List planner items              PlannerController#index       ; 
    GET /api/v1/users/:user_id/planner/items
  
- [ ]           List planner notes              PlannerNotesController#index       ; 
    GET /api/v1/planner_notes
  
- [ ]           Show a planner note              PlannerNotesController#show       ; 
    GET /api/v1/planner_notes/:id
  
- [ ]           Update a planner note              PlannerNotesController#update       ; 
    PUT /api/v1/planner_notes/:id
  
- [ ]           Create a planner note              PlannerNotesController#create       ; 
    POST /api/v1/planner_notes
  
- [ ]           Delete a planner note              PlannerNotesController#destroy       ; 
    DELETE /api/v1/planner_notes/:id
  
- [ ]           List planner overrides              PlannerOverridesController#index       ; 
    GET /api/v1/planner/overrides
  
- [ ]           Show a planner override              PlannerOverridesController#show       ; 
    GET /api/v1/planner/overrides/:id
  
- [ ]           Update a planner override              PlannerOverridesController#update       ; 
    PUT /api/v1/planner/overrides/:id
  
- [ ]           Create a planner override              PlannerOverridesController#create       ; 
    POST /api/v1/planner/overrides
  
- [ ]           Delete a planner override              PlannerOverridesController#destroy       ; 
    DELETE /api/v1/planner/overrides/:id
  
- [ ]           List poll sessions for a poll              Polling::PollSessionsController#index       ; 
    GET /api/v1/polls/:poll_id/poll_sessions
  
- [ ]           Get the results for a single poll session              Polling::PollSessionsController#show       ; 
    GET /api/v1/polls/:poll_id/poll_sessions/:id
  
- [ ]           Create a single poll session              Polling::PollSessionsController#create       ; 
    POST /api/v1/polls/:poll_id/poll_sessions
  
- [ ]           Update a single poll session              Polling::PollSessionsController#update       ; 
    PUT /api/v1/polls/:poll_id/poll_sessions/:id
  
- [ ]           Delete a poll session              Polling::PollSessionsController#destroy       ; 
    DELETE /api/v1/polls/:poll_id/poll_sessions/:id
  
- [ ]           Open a poll session              Polling::PollSessionsController#open       ; 
    GET /api/v1/polls/:poll_id/poll_sessions/:id/open
  
- [ ]           Close an opened poll session              Polling::PollSessionsController#close       ; 
    GET /api/v1/polls/:poll_id/poll_sessions/:id/close
  
- [ ]           List opened poll sessions              Polling::PollSessionsController#opened       ; 
    GET /api/v1/poll_sessions/opened
  
- [ ]           List closed poll sessions              Polling::PollSessionsController#closed       ; 
    GET /api/v1/poll_sessions/closed
  
- [ ]           List poll choices in a poll              Polling::PollChoicesController#index       ; 
    GET /api/v1/polls/:poll_id/poll_choices
  
- [ ]           Get a single poll choice              Polling::PollChoicesController#show       ; 
    GET /api/v1/polls/:poll_id/poll_choices/:id
  
- [ ]           Create a single poll choice              Polling::PollChoicesController#create       ; 
    POST /api/v1/polls/:poll_id/poll_choices
  
- [ ]           Update a single poll choice              Polling::PollChoicesController#update       ; 
    PUT /api/v1/polls/:poll_id/poll_choices/:id
  
- [ ]           Delete a poll choice              Polling::PollChoicesController#destroy       ; 
    DELETE /api/v1/polls/:poll_id/poll_choices/:id
  
- [ ]           List polls              Polling::PollsController#index       ; 
    GET /api/v1/polls
  
- [ ]           Get a single poll              Polling::PollsController#show       ; 
    GET /api/v1/polls/:id
  
- [ ]           Create a single poll              Polling::PollsController#create       ; 
    POST /api/v1/polls
  
- [ ]           Update a single poll              Polling::PollsController#update       ; 
    PUT /api/v1/polls/:id
  
- [ ]           Delete a poll              Polling::PollsController#destroy       ; 
    DELETE /api/v1/polls/:id
  
- [ ]           Get a single poll submission              Polling::PollSubmissionsController#show       ; 
    GET /api/v1/polls/:poll_id/poll_sessions/:poll_session_id/poll_submissions/:id
  
- [ ]           Create a single poll submission              Polling::PollSubmissionsController#create       ; 
    POST /api/v1/polls/:poll_id/poll_sessions/:poll_session_id/poll_submissions
  
- [ ]           Create/update proficiency ratings              OutcomeProficiencyApiController#create       ; 
    POST /api/v1/accounts/:account_id/outcome_proficiency
  
- [ ]           Create/update proficiency ratings              OutcomeProficiencyApiController#create       ; 
    POST /api/v1/courses/:course_id/outcome_proficiency
  
- [ ]           Get proficiency ratings              OutcomeProficiencyApiController#show       ; 
    GET /api/v1/accounts/:account_id/outcome_proficiency
  
- [ ]           Get proficiency ratings              OutcomeProficiencyApiController#show       ; 
    GET /api/v1/courses/:course_id/outcome_proficiency
  
- [ ]           Query progress              ProgressController#show       ; 
    GET /api/v1/progress/:id
  
- [ ]           Cancel progress              ProgressController#cancel       ; 
    POST /api/v1/progress/:id/cancel
  
- [ ]           Query progress              Lti::Ims::ProgressController#show       ; 
    GET /api/lti/courses/:course_id/progress/:id
  
- [ ]           Update Public JWK              Lti::PublicJwkController#update       ; 
    PUT /api/lti/developer_key/update_public_jwk
  
- [ ]           Retrieve assignment-overridden dates for Classic Quizzes              Quizzes::QuizAssignmentOverridesController#index       ; 
    GET /api/v1/courses/:course_id/quizzes/assignment_overrides
  
- [ ]           Retrieve assignment-overridden dates for New Quizzes              Quizzes::QuizAssignmentOverridesController#new_quizzes       ; 
    GET /api/v1/courses/:course_id/new_quizzes/assignment_overrides
  
- [ ]           Set extensions for student quiz submissions              Quizzes::QuizExtensionsController#create       ; 
    POST /api/v1/courses/:course_id/quizzes/:quiz_id/extensions
  
- [ ]           Get available quiz IP filters.              Quizzes::QuizIpFiltersController#index       ; 
    GET /api/v1/courses/:course_id/quizzes/:quiz_id/ip_filters
  
- [ ]           Get a single quiz group              Quizzes::QuizGroupsController#show       ; 
    GET /api/v1/courses/:course_id/quizzes/:quiz_id/groups/:id
  
- [ ]           Create a question group              Quizzes::QuizGroupsController#create       ; 
    POST /api/v1/courses/:course_id/quizzes/:quiz_id/groups
  
- [ ]           Update a question group              Quizzes::QuizGroupsController#update       ; 
    PUT /api/v1/courses/:course_id/quizzes/:quiz_id/groups/:id
  
- [ ]           Delete a question group              Quizzes::QuizGroupsController#destroy       ; 
    DELETE /api/v1/courses/:course_id/quizzes/:quiz_id/groups/:id
  
- [ ]           Reorder question groups              Quizzes::QuizGroupsController#reorder       ; 
    POST /api/v1/courses/:course_id/quizzes/:quiz_id/groups/:id/reorder
  
- [ ]           List questions in a quiz or a submission              Quizzes::QuizQuestionsController#index       ; 
    GET /api/v1/courses/:course_id/quizzes/:quiz_id/questions
  
- [ ]           Get a single quiz question              Quizzes::QuizQuestionsController#show       ; 
    GET /api/v1/courses/:course_id/quizzes/:quiz_id/questions/:id
  
- [ ]           Create a single quiz question              Quizzes::QuizQuestionsController#create       ; 
    POST /api/v1/courses/:course_id/quizzes/:quiz_id/questions
  
- [ ]           Update an existing quiz question              Quizzes::QuizQuestionsController#update       ; 
    PUT /api/v1/courses/:course_id/quizzes/:quiz_id/questions/:id
  
- [ ]           Delete a quiz question              Quizzes::QuizQuestionsController#destroy       ; 
    DELETE /api/v1/courses/:course_id/quizzes/:quiz_id/questions/:id
  
- [ ]           Retrieve all quiz reports              Quizzes::QuizReportsController#index       ; 
    GET /api/v1/courses/:course_id/quizzes/:quiz_id/reports
  
- [ ]           Create a quiz report              Quizzes::QuizReportsController#create       ; 
    POST /api/v1/courses/:course_id/quizzes/:quiz_id/reports
  
- [ ]           Get a quiz report              Quizzes::QuizReportsController#show       ; 
    GET /api/v1/courses/:course_id/quizzes/:quiz_id/reports/:id
  
- [ ]           Abort the generation of a report, or remove a previously generated one              Quizzes::QuizReportsController#abort       ; 
    DELETE /api/v1/courses/:course_id/quizzes/:quiz_id/reports/:id
  
- [ ]           Fetching the latest quiz statistics              Quizzes::QuizStatisticsController#index       ; 
    GET /api/v1/courses/:course_id/quizzes/:quiz_id/statistics
  
- [ ]           Submit captured events              Quizzes::QuizSubmissionEventsApiController#create       ; 
    POST /api/v1/courses/:course_id/quizzes/:quiz_id/submissions/:id/events
  
- [ ]           Retrieve captured events              Quizzes::QuizSubmissionEventsApiController#index       ; 
    GET /api/v1/courses/:course_id/quizzes/:quiz_id/submissions/:id/events
  
- [ ]           Upload a file              Quizzes::QuizSubmissionFilesController#create       ; 
    POST /api/v1/courses/:course_id/quizzes/:quiz_id/submissions/self/files
  
- [ ]           Get all quiz submission questions.              Quizzes::QuizSubmissionQuestionsController#index       ; 
    GET /api/v1/quiz_submissions/:quiz_submission_id/questions
  
- [ ]           Answering questions              Quizzes::QuizSubmissionQuestionsController#answer       ; 
    POST /api/v1/quiz_submissions/:quiz_submission_id/questions
  
- [ ]           Get a formatted student numerical answer.              Quizzes::QuizSubmissionQuestionsController#formatted_answer       ; 
    GET /api/v1/quiz_submissions/:quiz_submission_id/questions/:id/formatted_answer
  
- [ ]           Flagging a question.              Quizzes::QuizSubmissionQuestionsController#flag       ; 
    PUT /api/v1/quiz_submissions/:quiz_submission_id/questions/:id/flag
  
- [ ]           Unflagging a question.              Quizzes::QuizSubmissionQuestionsController#unflag       ; 
    PUT /api/v1/quiz_submissions/:quiz_submission_id/questions/:id/unflag
  
- [ ]           Send a message to unsubmitted or submitted users for the quiz              Quizzes::QuizSubmissionUsersController#message       ; 
    POST /api/v1/courses/:course_id/quizzes/:id/submission_users/message
  
- [ ]           Get all quiz submissions.              Quizzes::QuizSubmissionsApiController#index       ; 
    GET /api/v1/courses/:course_id/quizzes/:quiz_id/submissions
  
- [ ]           Get the quiz submission.              Quizzes::QuizSubmissionsApiController#submission       ; 
    GET /api/v1/courses/:course_id/quizzes/:quiz_id/submission
  
- [ ]           Get a single quiz submission.              Quizzes::QuizSubmissionsApiController#show       ; 
    GET /api/v1/courses/:course_id/quizzes/:quiz_id/submissions/:id
  
- [ ]           Create the quiz submission (start a quiz-taking session)              Quizzes::QuizSubmissionsApiController#create       ; 
    POST /api/v1/courses/:course_id/quizzes/:quiz_id/submissions
  
- [ ]           Update student question scores and comments.              Quizzes::QuizSubmissionsApiController#update       ; 
    PUT /api/v1/courses/:course_id/quizzes/:quiz_id/submissions/:id
  
- [ ]           Complete the quiz submission (turn it in).              Quizzes::QuizSubmissionsApiController#complete       ; 
    POST /api/v1/courses/:course_id/quizzes/:quiz_id/submissions/:id/complete
  
- [ ]           Get current quiz submission times.              Quizzes::QuizSubmissionsApiController#time       ; 
    GET /api/v1/courses/:course_id/quizzes/:quiz_id/submissions/:id/time
  
- [ ]           List quizzes in a course              Quizzes::QuizzesApiController#index       ; 
    GET /api/v1/courses/:course_id/quizzes
  
- [ ]           Get a single quiz              Quizzes::QuizzesApiController#show       ; 
    GET /api/v1/courses/:course_id/quizzes/:id
  
- [ ]           Create a quiz              Quizzes::QuizzesApiController#create       ; 
    POST /api/v1/courses/:course_id/quizzes
  
- [ ]           Edit a quiz              Quizzes::QuizzesApiController#update       ; 
    PUT /api/v1/courses/:course_id/quizzes/:id
  
- [ ]           Delete a quiz              Quizzes::QuizzesApiController#destroy       ; 
    DELETE /api/v1/courses/:course_id/quizzes/:id
  
- [ ]           Reorder quiz items              Quizzes::QuizzesApiController#reorder       ; 
    POST /api/v1/courses/:course_id/quizzes/:id/reorder
  
- [ ]           Validate quiz access code              Quizzes::QuizzesApiController#validate_access_code       ; 
    POST /api/v1/courses/:course_id/quizzes/:id/validate_access_code
  
- [ ]           Show a collection of Results              Lti::Ims::ResultsController#index       ; 
    GET /api/lti/courses/:course_id/line_items/:line_item_id/results
  
- [ ]           Show a Result              Lti::Ims::ResultsController#show       ; 
    GET /api/lti/courses/:course_id/line_items/:line_item_id/results/:id
  
- [ ]           List roles              RoleOverridesController#api_index       ; 
    GET /api/v1/accounts/:account_id/roles
  
- [ ]           Get a single role              RoleOverridesController#show       ; 
    GET /api/v1/accounts/:account_id/roles/:id
  
- [ ]           Create a new role              RoleOverridesController#add_role       ; 
    POST /api/v1/accounts/:account_id/roles
  
- [ ]           Deactivate a role              RoleOverridesController#remove_role       ; 
    DELETE /api/v1/accounts/:account_id/roles/:id
  
- [ ]           Activate a role              RoleOverridesController#activate_role       ; 
    POST /api/v1/accounts/:account_id/roles/:id/activate
  
- [ ]           Update a role              RoleOverridesController#update       ; 
    PUT /api/v1/accounts/:account_id/roles/:id
  
- [ ]           Create a single rubric              RubricsController#create       ; 
    POST /api/v1/courses/:course_id/rubrics
  
- [ ]           Update a single rubric              RubricsController#update       ; 
    PUT /api/v1/courses/:course_id/rubrics/:id
  
- [ ]           Delete a single rubric              RubricsController#destroy       ; 
    DELETE /api/v1/courses/:course_id/rubrics/:id
  
- [ ]           List rubrics              RubricsApiController#index       ; 
    GET /api/v1/accounts/:account_id/rubrics
  
- [ ]           List rubrics              RubricsApiController#index       ; 
    GET /api/v1/courses/:course_id/rubrics
  
- [ ]           Get a single rubric              RubricsApiController#show       ; 
    GET /api/v1/accounts/:account_id/rubrics/:id
  
- [ ]           Get a single rubric              RubricsApiController#show       ; 
    GET /api/v1/courses/:course_id/rubrics/:id
  
- [ ]           Create a single rubric assessment              RubricAssessmentsController#create       ; 
    POST /api/v1/courses/:course_id/rubric_associations/:rubric_association_id/rubric_assessments
  
- [ ]           Update a single rubric assessment              RubricAssessmentsController#update       ; 
    PUT /api/v1/courses/:course_id/rubric_associations/:rubric_association_id/rubric_assessments/:id
  
- [ ]           Delete a single rubric assessment              RubricAssessmentsController#destroy       ; 
    DELETE /api/v1/courses/:course_id/rubric_associations/:rubric_association_id/rubric_assessments/:id
  
- [ ]           Create a RubricAssociation              RubricAssociationsController#create       ; 
    POST /api/v1/courses/:course_id/rubric_associations
  
- [ ]           Update a RubricAssociation              RubricAssociationsController#update       ; 
    PUT /api/v1/courses/:course_id/rubric_associations/:id
  
- [ ]           Delete a RubricAssociation              RubricAssociationsController#destroy       ; 
    DELETE /api/v1/courses/:course_id/rubric_associations/:id
  
- [ ]           Create a Score              Lti::Ims::ScoresController#create       ; 
    POST /api/lti/courses/:course_id/line_items/:line_item_id/scores
  
- [ ]           Find recipients              SearchController#recipients       ; 
    GET /api/v1/conversations/find_recipients
  
- [ ]           Find recipients              SearchController#recipients       ; 
    GET /api/v1/search/recipients
  
- [x]           List all courses              SearchController#all_courses       ; 
    GET /api/v1/search/all_courses
  
- [x]           List course sections              SectionsController#index       ; 
    GET /api/v1/courses/:course_id/sections
  
- [x]           Create course section              SectionsController#create       ; 
    POST /api/v1/courses/:course_id/sections
  
- [ ]           Cross-list a Section              SectionsController#crosslist       ; 
    POST /api/v1/sections/:id/crosslist/:new_course_id
  
- [ ]           De-cross-list a Section              SectionsController#uncrosslist       ; 
    DELETE /api/v1/sections/:id/crosslist
  
- [ ]           Edit a section              SectionsController#update       ; 
    PUT /api/v1/sections/:id
  
- [ ]           Get section information              SectionsController#show       ; 
    GET /api/v1/courses/:course_id/sections/:id
  
- [ ]           Get section information              SectionsController#show       ; 
    GET /api/v1/sections/:id
  
- [ ]           Delete a section              SectionsController#destroy       ; 
    DELETE /api/v1/sections/:id
  
- [ ]           Get Kaltura config              ServicesApiController#show_kaltura_config       ; 
    GET /api/v1/services/kaltura
  
- [ ]           Start Kaltura session              ServicesApiController#start_kaltura_session       ; 
    POST /api/v1/services/kaltura_session
  
- [ ]           Share a BrandConfig (Theme)              SharedBrandConfigsController#create       ; 
    POST /api/v1/accounts/:account_id/shared_brand_configs
  
- [ ]           Update a shared theme              SharedBrandConfigsController#update       ; 
    PUT /api/v1/accounts/:account_id/shared_brand_configs/:id
  
- [ ]           Un-share a BrandConfig (Theme)              SharedBrandConfigsController#destroy       ; 
    DELETE /api/v1/shared_brand_configs/:id
  
- [ ]           Get SIS import error list              SisImportErrorsApiController#index       ; 
    GET /api/v1/accounts/:account_id/sis_imports/:id/errors
  
- [ ]           Get SIS import error list              SisImportErrorsApiController#index       ; 
    GET /api/v1/accounts/:account_id/sis_import_errors
  
- [ ]           Get SIS import list              SisImportsApiController#index       ; 
    GET /api/v1/accounts/:account_id/sis_imports
  
- [ ]           Get the current importing SIS import              SisImportsApiController#importing       ; 
    GET /api/v1/accounts/:account_id/sis_imports/importing
  
- [ ]           Import SIS data              SisImportsApiController#create       ; 
    POST /api/v1/accounts/:account_id/sis_imports
  
- [ ]           Get SIS import status              SisImportsApiController#show       ; 
    GET /api/v1/accounts/:account_id/sis_imports/:id
  
- [ ]           Restore workflow_states of SIS imported items              SisImportsApiController#restore_states       ; 
    PUT /api/v1/accounts/:account_id/sis_imports/:id/restore_states
  
- [ ]           Abort SIS import              SisImportsApiController#abort       ; 
    PUT /api/v1/accounts/:account_id/sis_imports/:id/abort
  
- [ ]           Abort all pending SIS imports              SisImportsApiController#abort_all_pending       ; 
    PUT /api/v1/accounts/:account_id/sis_imports/abort_all_pending
  
- [ ]           Retrieve assignments enabled for grade export to SIS              SisApiController#sis_assignments       ; 
    GET /api/sis/accounts/:account_id/assignments
  
- [ ]           Retrieve assignments enabled for grade export to SIS              SisApiController#sis_assignments       ; 
    GET /api/sis/courses/:course_id/assignments
  
- [ ]           Disable assignments currently enabled for grade export to SIS              DisablePostToSisApiController#disable_post_to_sis       ; 
    PUT /api/sis/courses/:course_id/disable_post_to_sis
  
- [ ]           Edit a submission comment              SubmissionCommentsApiController#update       ; 
    PUT /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:user_id/comments/:id
  
- [ ]           Delete a submission comment              SubmissionCommentsApiController#destroy       ; 
    DELETE /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:user_id/comments/:id
  
- [ ]           Upload a file              SubmissionCommentsApiController#create_file       ; 
    POST /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:user_id/comments/files
  
- [ ]           Submit an assignment              SubmissionsController#create       ; 
    POST /api/v1/courses/:course_id/assignments/:assignment_id/submissions
  
- [ ]           Submit an assignment              SubmissionsController#create       ; 
    POST /api/v1/sections/:section_id/assignments/:assignment_id/submissions
  
- [ ]           List assignment submissions              SubmissionsApiController#index       ; 
    GET /api/v1/courses/:course_id/assignments/:assignment_id/submissions
  
- [ ]           List assignment submissions              SubmissionsApiController#index       ; 
    GET /api/v1/sections/:section_id/assignments/:assignment_id/submissions
  
- [ ]           List submissions for multiple assignments              SubmissionsApiController#for_students       ; 
    GET /api/v1/courses/:course_id/students/submissions
  
- [ ]           List submissions for multiple assignments              SubmissionsApiController#for_students       ; 
    GET /api/v1/sections/:section_id/students/submissions
  
- [ ]           Get a single submission              SubmissionsApiController#show       ; 
    GET /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:user_id
  
- [ ]           Get a single submission              SubmissionsApiController#show       ; 
    GET /api/v1/sections/:section_id/assignments/:assignment_id/submissions/:user_id
  
- [ ]           Get a single submission by anonymous id              SubmissionsApiController#show_anonymous       ; 
    GET /api/v1/courses/:course_id/assignments/:assignment_id/anonymous_submissions/:anonymous_id
  
- [ ]           Get a single submission by anonymous id              SubmissionsApiController#show_anonymous       ; 
    GET /api/v1/sections/:section_id/assignments/:assignment_id/anonymous_submissions/:anonymous_id
  
- [ ]           Upload a file              SubmissionsApiController#create_file       ; 
    POST /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:user_id/files
  
- [ ]           Upload a file              SubmissionsApiController#create_file       ; 
    POST /api/v1/sections/:section_id/assignments/:assignment_id/submissions/:user_id/files
  
- [ ]           Grade or comment on a submission              SubmissionsApiController#update       ; 
    PUT /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:user_id
  
- [ ]           Grade or comment on a submission              SubmissionsApiController#update       ; 
    PUT /api/v1/sections/:section_id/assignments/:assignment_id/submissions/:user_id
  
- [ ]           Grade or comment on a submission by anonymous id              SubmissionsApiController#update_anonymous       ; 
    PUT /api/v1/courses/:course_id/assignments/:assignment_id/anonymous_submissions/:anonymous_id
  
- [ ]           Grade or comment on a submission by anonymous id              SubmissionsApiController#update_anonymous       ; 
    PUT /api/v1/sections/:section_id/assignments/:assignment_id/anonymous_submissions/:anonymous_id
  
- [ ]           List gradeable students              SubmissionsApiController#gradeable_students       ; 
    GET /api/v1/courses/:course_id/assignments/:assignment_id/gradeable_students
  
- [ ]           List multiple assignments gradeable students              SubmissionsApiController#multiple_gradeable_students       ; 
    GET /api/v1/courses/:course_id/assignments/gradeable_students
  
- [ ]           Grade or comment on multiple submissions              SubmissionsApiController#bulk_update       ; 
    POST /api/v1/courses/:course_id/submissions/update_grades
  
- [ ]           Grade or comment on multiple submissions              SubmissionsApiController#bulk_update       ; 
    POST /api/v1/courses/:course_id/assignments/:assignment_id/submissions/update_grades
  
- [ ]           Grade or comment on multiple submissions              SubmissionsApiController#bulk_update       ; 
    POST /api/v1/sections/:section_id/submissions/update_grades
  
- [ ]           Grade or comment on multiple submissions              SubmissionsApiController#bulk_update       ; 
    POST /api/v1/sections/:section_id/assignments/:assignment_id/submissions/update_grades
  
- [ ]           Mark submission as read              SubmissionsApiController#mark_submission_read       ; 
    PUT /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:user_id/read
  
- [ ]           Mark submission as read              SubmissionsApiController#mark_submission_read       ; 
    PUT /api/v1/sections/:section_id/assignments/:assignment_id/submissions/:user_id/read
  
- [ ]           Mark submission as unread              SubmissionsApiController#mark_submission_unread       ; 
    DELETE /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:user_id/read
  
- [ ]           Mark submission as unread              SubmissionsApiController#mark_submission_unread       ; 
    DELETE /api/v1/sections/:section_id/assignments/:assignment_id/submissions/:user_id/read
  
- [ ]           Mark bulk submissions as read              SubmissionsApiController#mark_bulk_submissions_as_read       ; 
    PUT /api/v1/courses/:course_id/submissions/bulk_mark_read
  
- [ ]           Mark bulk submissions as read              SubmissionsApiController#mark_bulk_submissions_as_read       ; 
    PUT /api/v1/sections/:section_id/submissions/bulk_mark_read
  
- [ ]           Mark submission item as read              SubmissionsApiController#mark_submission_item_read       ; 
    PUT /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:user_id/read/:item
  
- [ ]           Mark submission item as read              SubmissionsApiController#mark_submission_item_read       ; 
    PUT /api/v1/sections/:section_id/assignments/:assignment_id/submissions/:user_id/read/:item
  
- [ ]           Clear unread status for all submissions.              SubmissionsApiController#submissions_clear_unread       ; 
    PUT /api/v1/courses/:course_id/submissions/:user_id/clear_unread
  
- [ ]           Clear unread status for all submissions.              SubmissionsApiController#submissions_clear_unread       ; 
    PUT /api/v1/sections/:section_id/submissions/:user_id/clear_unread
  
- [ ]           Get rubric assessments read state              SubmissionsApiController#rubric_assessments_read_state       ; 
    GET /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:user_id/rubric_comments/read
  
- [ ]           Get rubric assessments read state              SubmissionsApiController#rubric_assessments_read_state       ; 
    GET /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:user_id/rubric_assessments/read
  
- [ ]           Get rubric assessments read state              SubmissionsApiController#rubric_assessments_read_state       ; 
    GET /api/v1/sections/:section_id/assignments/:assignment_id/submissions/:user_id/rubric_comments/read
  
- [ ]           Get rubric assessments read state              SubmissionsApiController#rubric_assessments_read_state       ; 
    GET /api/v1/sections/:section_id/assignments/:assignment_id/submissions/:user_id/rubric_assessments/read
  
- [ ]           Mark rubric assessments as read              SubmissionsApiController#mark_rubric_assessments_read       ; 
    PUT /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:user_id/rubric_comments/read
  
- [ ]           Mark rubric assessments as read              SubmissionsApiController#mark_rubric_assessments_read       ; 
    PUT /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:user_id/rubric_assessments/read
  
- [ ]           Mark rubric assessments as read              SubmissionsApiController#mark_rubric_assessments_read       ; 
    PUT /api/v1/sections/:section_id/assignments/:assignment_id/submissions/:user_id/rubric_comments/read
  
- [ ]           Mark rubric assessments as read              SubmissionsApiController#mark_rubric_assessments_read       ; 
    PUT /api/v1/sections/:section_id/assignments/:assignment_id/submissions/:user_id/rubric_assessments/read
  
- [ ]           Get document annotations read state              SubmissionsApiController#document_annotations_read_state       ; 
    GET /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:user_id/document_annotations/read
  
- [ ]           Get document annotations read state              SubmissionsApiController#document_annotations_read_state       ; 
    GET /api/v1/sections/:section_id/assignments/:assignment_id/submissions/:user_id/document_annotations/read
  
- [ ]           Mark document annotations as read              SubmissionsApiController#mark_document_annotations_read       ; 
    PUT /api/v1/courses/:course_id/assignments/:assignment_id/submissions/:user_id/document_annotations/read
  
- [ ]           Mark document annotations as read              SubmissionsApiController#mark_document_annotations_read       ; 
    PUT /api/v1/sections/:section_id/assignments/:assignment_id/submissions/:user_id/document_annotations/read
  
- [ ]           Submission Summary              SubmissionsApiController#submission_summary       ; 
    GET /api/v1/courses/:course_id/assignments/:assignment_id/submission_summary
  
- [ ]           Submission Summary              SubmissionsApiController#submission_summary       ; 
    GET /api/v1/sections/:section_id/assignments/:assignment_id/submission_summary
  
- [ ]           List available tabs for a course or group              TabsController#index       ; 
    GET /api/v1/accounts/:account_id/tabs
  
- [ ]           List available tabs for a course or group              TabsController#index       ; 
    GET /api/v1/courses/:course_id/tabs
  
- [ ]           List available tabs for a course or group              TabsController#index       ; 
    GET /api/v1/groups/:group_id/tabs
  
- [ ]           List available tabs for a course or group              TabsController#index       ; 
    GET /api/v1/users/:user_id/tabs
  
- [ ]           Update a tab for a course              TabsController#update       ; 
    PUT /api/v1/courses/:course_id/tabs/:tab_id
  
- [ ]           List observees              UserObserveesController#index       ; 
    GET /api/v1/users/:user_id/observees
  
- [ ]           List observers              UserObserveesController#observers       ; 
    GET /api/v1/users/:user_id/observers
  
- [ ]           Add an observee with credentials              UserObserveesController#create       ; 
    POST /api/v1/users/:user_id/observees
  
- [ ]           Show an observee              UserObserveesController#show       ; 
    GET /api/v1/users/:user_id/observees/:observee_id
  
- [ ]           Show an observer              UserObserveesController#show_observer       ; 
    GET /api/v1/users/:user_id/observers/:observer_id
  
- [ ]           Add an observee              UserObserveesController#update       ; 
    PUT /api/v1/users/:user_id/observees/:observee_id
  
- [ ]           Remove an observee              UserObserveesController#destroy       ; 
    DELETE /api/v1/users/:user_id/observees/:observee_id
  
- [ ]           Create observer pairing code              ObserverPairingCodesApiController#create       ; 
    POST /api/v1/users/:user_id/observer_pairing_codes
  
- [ ]           List users in account              UsersController#api_index       ; 
    GET /api/v1/accounts/:account_id/users
  
- [ ]           List the activity stream              UsersController#activity_stream       ; 
    GET /api/v1/users/self/activity_stream
  
- [ ]           List the activity stream              UsersController#activity_stream       ; 
    GET /api/v1/users/activity_stream
  
- [ ]           Activity stream summary              UsersController#activity_stream_summary       ; 
    GET /api/v1/users/self/activity_stream/summary
  
- [ ]           List the TODO items              UsersController#todo_items       ; 
    GET /api/v1/users/self/todo
  
- [ ]           List counts for todo items              UsersController#todo_item_count       ; 
    GET /api/v1/users/self/todo_item_count
  
- [ ]           List upcoming assignments, calendar events              UsersController#upcoming_events       ; 
    GET /api/v1/users/self/upcoming_events
  
- [ ]           List Missing Submissions              UsersController#missing_submissions       ; 
    GET /api/v1/users/:user_id/missing_submissions
  
- [ ]           Hide a stream item              UsersController#ignore_stream_item       ; 
    DELETE /api/v1/users/self/activity_stream/:id
  
- [ ]           Hide all stream items              UsersController#ignore_all_stream_items       ; 
    DELETE /api/v1/users/self/activity_stream
  
- [ ]           Upload a file              UsersController#create_file       ; 
    POST /api/v1/users/:user_id/files
  
- [ ]           Show user details              UsersController#api_show       ; 
    GET /api/v1/users/:id
  
- [ ]           Create a user              UsersController#create       ; 
    POST /api/v1/accounts/:account_id/users
  
- [ ]           [DEPRECATED] Self register a user              UsersController#create_self_registered_user       ; 
    POST /api/v1/accounts/:account_id/self_registration
  
- [ ]           Update user settings.              UsersController#settings       ; 
    GET /api/v1/users/:id/settings
  
- [ ]           Update user settings.              UsersController#settings       ; 
    PUT /api/v1/users/:id/settings
  
- [ ]           Get custom colors              UsersController#get_custom_colors       ; 
    GET /api/v1/users/:id/colors
  
- [ ]           Get custom color              UsersController#get_custom_color       ; 
    GET /api/v1/users/:id/colors/:asset_string
  
- [ ]           Update custom color              UsersController#set_custom_color       ; 
    PUT /api/v1/users/:id/colors/:asset_string
  
- [ ]           Get dashboard positions              UsersController#get_dashboard_positions       ; 
    GET /api/v1/users/:id/dashboard_positions
  
- [ ]           Update dashboard positions              UsersController#set_dashboard_positions       ; 
    PUT /api/v1/users/:id/dashboard_positions
  
- [ ]           Edit a user              UsersController#update       ; 
    PUT /api/v1/users/:id
  
- [ ]           Terminate all user sessions              UsersController#terminate_sessions       ; 
    DELETE /api/v1/users/:id/sessions
  
- [ ]           Merge user into another user              UsersController#merge_into       ; 
    PUT /api/v1/users/:id/merge_into/:destination_user_id
  
- [ ]           Merge user into another user              UsersController#merge_into       ; 
    PUT /api/v1/users/:id/merge_into/accounts/:destination_account_id/users/:destination_user_id
  
- [ ]           Split merged users into separate users              UsersController#split       ; 
    POST /api/v1/users/:id/split
  
- [ ]           Get a Pandata Events jwt token and its expiration date              UsersController#pandata_events_token       ; 
    POST /api/v1/users/self/pandata_events_token
  
- [ ]           Get a users most recently graded submissions              UsersController#user_graded_submissions       ; 
    GET /api/v1/users/:id/graded_submissions
  
- [ ]           Get user profile              ProfileController#settings       ; 
    GET /api/v1/users/:user_id/profile
  
- [ ]           List avatar options              ProfileController#profile_pics       ; 
    GET /api/v1/users/:user_id/avatars
  
- [ ]           List user page views              PageViewsController#index       ; 
    GET /api/v1/users/:user_id/page_views
  
- [ ]           Store custom data              CustomDataController#set_data       ; 
    PUT /api/v1/users/:user_id/custom_data(/*scope)
  
- [ ]           Load custom data              CustomDataController#get_data       ; 
    GET /api/v1/users/:user_id/custom_data(/*scope)
  
- [ ]           Delete custom data              CustomDataController#delete_data       ; 
    DELETE /api/v1/users/:user_id/custom_data(/*scope)
  
- [ ]           List course nicknames              CourseNicknamesController#index       ; 
    GET /api/v1/users/self/course_nicknames
  
- [ ]           Get course nickname              CourseNicknamesController#show       ; 
    GET /api/v1/users/self/course_nicknames/:course_id
  
- [ ]           Set course nickname              CourseNicknamesController#update       ; 
    PUT /api/v1/users/self/course_nicknames/:course_id
  
- [ ]           Remove course nickname              CourseNicknamesController#delete       ; 
    DELETE /api/v1/users/self/course_nicknames/:course_id
  
- [ ]           Clear course nicknames              CourseNicknamesController#clear       ; 
    DELETE /api/v1/users/self/course_nicknames
  
- [ ]           Create a Webhook Subscription              Lti::SubscriptionsApiController#create       ; 
    POST /api/lti/subscriptions
  
- [ ]           Delete a Webhook Subscription              Lti::SubscriptionsApiController#destroy       ; 
    DELETE /api/lti/subscriptions/:id
  
- [ ]           Show a single Webhook Subscription              Lti::SubscriptionsApiController#show       ; 
    GET /api/lti/subscriptions/:id
  
- [ ]           Update a Webhook Subscription              Lti::SubscriptionsApiController#update       ; 
    PUT /api/lti/subscriptions/:id
  
- [ ]           List all Webhook Subscription for a tool proxy              Lti::SubscriptionsApiController#index       ; 
    GET /api/lti/subscriptions
  
