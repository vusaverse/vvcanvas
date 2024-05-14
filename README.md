# vvcanvas <a href="https://vusaverse.github.io/vvcanvas/"><img src="man/figures/logo.png" style="float:right; height:200px;" height="200" align="right" /></a>


[![CodeFactor](https://www.codefactor.io/repository/github/vusaverse/vvcanvas/badge)](https://www.codefactor.io/repository/github/vusaverse/vvcanvas)
[![R-CMD-check](https://github.com/vusaverse/vvcanvas/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/vusaverse/vvcanvas/actions/workflows/R-CMD-check.yaml)
[![CRAN status](https://www.r-pkg.org/badges/version/vvcanvas)](https://CRAN.R-project.org/package=vvcanvas/)
<a href="https://diffify.com/R/vvcanvas" target="_blank"><img src="https://diffify.com/diffify-badge.svg" alt="The diffify page for the R package vvcanvas" style="width: 100px; max-width: 100%;"></a>
[![CRAN last month downloads](https://cranlogs.r-pkg.org/badges/last-month/vvcanvas?color=green/)](https://cran.r-project.org/package=vvcanvas/)
[![CRAN last month downloads](https://cranlogs.r-pkg.org/badges/grand-total/vvcanvas?color=green/)](https://cran.r-project.org/package=vvcanvas/)

The `vvcanvas` package is an R library that provides a convenient interface to interact with the Canvas Learning Management System (LMS) API. It allows users to authenticate, retrieve course information, fetch specific details, and perform various operations within the Canvas LMS.

## Installation

You can install the `vvcanvas` package from GitHub using the following command:

```
devtools::install_github("vusaverse/vvcanvas")
```

It is also possible to install from CRAN:

```
install.packages("vvcanvas")
```

## Features
To see which functions are available in which section based on the CANVAS LMS API structure, please refer to the reference page of the `vvcanvas` package. The [reference](https://vusaverse.github.io/vvcanvas/reference/index.html) page provides a comprehensive list of functions available in the package, organized by category.

Additionally, the package includes vignettes that provide more detailed information on how to use the functions in the package.

## Getting Started

To begin using the `vvcanvas` package, you need to authenticate with the Canvas LMS API by obtaining an API key and base URL. Follow these steps to get started:

1. Acquire an API key from your Canvas LMS instance. You may need to consult your Canvas administrator or refer to the Canvas API documentation for instructions on obtaining an API key.

2. Once you have the API key, load the `vvcanvas` library and use the `canvas_authenticate` function to authenticate with the Canvas LMS API. Provide the API key and the base URL of your Canvas instance as parameters. Here's an example:

```R
library(vvcanvas)

# Replace the placeholders with your API key and base URL
api_key <- "YOUR_API_KEY"
base_url <- "https://your_canvas_domain.com/"

# Authenticate with the Canvas LMS API
canvas <- canvas_authenticate(api_key, base_url)

## Alternatively, you can set system variables

# Set the API key and base URL as environment variables
Sys.setenv(CANVAS_API_KEY = "YOUR_API_KEY")
Sys.setenv(CANVAS_BASE_URL = "https://your_canvas_domain.com/")

# Authenticate with the Canvas LMS API
canvas <- canvas_authenticate()

```

With the authentication step completed, you can now utilize the various functions provided by the `vvcanvas` package to interact with the Canvas LMS.


In order to retrieve a dataframe with all courses you can use the following function:

```R
# Pass the canvas object to the get_courses function
courses <- get_courses(canvas)

```

# Canvas Analytics Project
The [canvas-analytics](https://github.com/vusaverse/canvas-analytics) project provides a data pipeline for extracting, aggregating, and analyzing data from the Canvas Learning Management System (LMS) using the `vvcanvas` package. It aims to facilitate data retrieval and analysis at student, course, and program levels, enabling data-driven insights and decision-making in education and learning analytics. Key features include:

- Data extraction from Canvas LMS API
- Data aggregation at different levels (student, course, program)
- Data visualization and reporting
- Reproducible and extensible analysis workflow

