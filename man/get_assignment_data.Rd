% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_assignment_data.R
\name{get_assignment_data}
\alias{get_assignment_data}
\title{Get course-level assignment data from the Canvas LMS API}
\usage{
get_assignment_data(canvas, course_id, per_page = 100)
}
\arguments{
\item{canvas}{A list containing the 'api_key' and 'base_url' for authentication.}

\item{course_id}{The ID of the course for which to retrieve the assignment data.}

\item{per_page}{Number of assignment data to retrieve per page. Default is 100.}
}
\value{
A list of assignment data retrieved from the Canvas LMS API.
}
\description{
Retrieves the course-level assignment data for a specific course from the Canvas LMS API.
}
