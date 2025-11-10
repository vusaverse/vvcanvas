# Changelog

## vvcanvas 0.0.8 - 2025-11-10 (pre-release)

#### Added

- New function
  [`get_users()`](https://vusaverse.github.io/vvcanvas/reference/get_users.md)
  to retrieve all users from a specified account in Canvas LMS,
  supporting advanced filtering, sorting, pagination, and expanded user
  details inclusion.
- Supports optional parameters for search terms, enrollment types,
  custom sorting and ordering, inclusion of deleted users, UUID
  filtering, and additional user-related info such as email,
  enrollments, avatar, bio, locale, last login, timezone, and pronouns.

## vvcanvas 0.0.7

CRAN release: 2025-11-10

- Enhanced get_assignment_submissions() function for more accurate and
  efficient retrieval of assignment submission data from Canvas LMS,
  improving performance and reliability in handling submissions
  ([\#37](https://github.com/vusaverse/vvcanvas/issues/37)).

- Miscellaneous stability and reliability improvements preparing for
  broader usage and smoother user experience.

## vvcanvas 0.0.6

CRAN release: 2025-09-05

- Improved pagination handling for Canvas API get functions to support
  larger result sets and improve reliability
  ([\#16](https://github.com/vusaverse/vvcanvas/issues/16)).

- Added 12 new utility and API functions to extend feature coverage
  ([\#34](https://github.com/vusaverse/vvcanvas/issues/34)).

- Added new methods supporting deletion and update operations,

## vvcanvas 0.0.5

CRAN release: 2025-03-31

- Added numerous page functions.

## vvcanvas 0.0.4

CRAN release: 2024-04-29

- Added methods for sections.
- Added methods for favorites.
- Updated authentication method.
- Updated vignette.
- Added method for calendar events.
- Added method for account roles.

## vvcanvas 0.0.3

CRAN release: 2023-10-23

- Added methods for all Analytics endpoints.

## vvcanvas 0.0.2

CRAN release: 2023-07-17

- Added a `NEWS.md` file to track changes to the package.
- Introduced a number of POST actions.
- Added vignette based on a use case of a user.

## vvcanvas 0.0.2

CRAN release: 2023-07-17

- Published to CRAN
