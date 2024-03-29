% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_accounts.R
\name{get_accounts}
\alias{get_accounts}
\title{Get a list of accounts from the Canvas LMS API}
\usage{
get_accounts(canvas, include = NULL, per_page = 100)
}
\arguments{
\item{canvas}{A list containing the 'api_key' and 'base_url' for authentication.}

\item{include}{A vector of additional information to include. Default is NULL.}

\item{per_page}{Number of accounts to retrieve per page. Default is 100.}
}
\value{
A list of accounts retrieved from the Canvas LMS API.
}
\description{
Retrieves a paginated list of accounts that the current user can view or manage.
}
