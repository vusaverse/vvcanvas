\name{get_course_rubric}
\alias{get_course_rubric}
\title{Get Course Rubric from Canvas LMS API}
\usage{
get_course_rubric(canvas, course_id, rubric_id, include = NULL)
}
\arguments{
\item{canvas}{A list containing the 'api_key' and 'base_url' for authentication.}

\item{course_id}{The ID of the course containing the rubric.}

\item{rubric_id}{The ID of the specific rubric to retrieve.}

\item{include}{(Optional) Additional associations to include. Can be a single string or vector of strings.
Options include "associations" and "rubric_assessments".}
}
\value{
A data frame containing the complete rubric object with all criteria and ratings.
}
\description{
Retrieves full details of a single rubric for a given course from the Canvas LMS API.
This function returns comprehensive rubric information including all criteria and ratings.
}
\details{
This function calls the Canvas API endpoint \code{GET /api/v1/courses/:course_id/rubrics/:id}
to retrieve detailed information about a specific rubric. The rubric object includes
all criteria, ratings, and optionally associated data based on the include parameter.
}
\examples{
\dontrun{
# Authenticate with Canvas
canvas <- canvas_authenticate(api_key = "your_api_key", base_url = "https://your.canvas.url")

# Get a basic rubric
rubric <- get_course_rubric(canvas, course_id = 12345, rubric_id = 67890)

# Get rubric with associations
rubric_with_assoc <- get_course_rubric(canvas, course_id = 12345, rubric_id = 67890, 
                                       include = "associations")

# Get rubric with multiple includes
full_rubric <- get_course_rubric(canvas, course_id = 12345, rubric_id = 67890,
                                 include = c("associations", "rubric_assessments"))
}

}
\seealso{
\url{https://canvas.instructure.com/doc/api/rubrics.html#method.rubrics_api.show}
}