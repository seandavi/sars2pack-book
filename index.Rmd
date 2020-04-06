--- 
title: "Understanding the COVID-19 pandemic"
subtitle: "A data-driven approach using the sars2pack R package"
author: 
  - "Vincent Carey"
  - "Charles Morefield"
  - "John Mallery"
  - "Sean Davis"
date: 2020-04-02
output: 
  bookdown::gitbook:
    includes:
      after_body: google_analytics.html
always_allow_html: true
github-repo: "seandavi/COVID19Book"
cover-image: "images/logo.png"
url: https://seandavi.github.io/COVID19Book
---
# (PART) Introduction {-} 

# Motivation

The COVID-19 pandemic is ongoing. The situation on the ground is
changing daily as captured by data reported around the world. The
[sars2pack] package aims to:

- Provide timely, computable, easily accessible data for research,
   policy-making, and educational purposes.
- Promote easy computational experimentation with COVID-19 data
- Serve as a source of documentation and education for available
   COVID-19 analysis and visualization approaches.
- House recipes for regularly updated data products such as
   spreadsheets and maps for use by non-R-savvy data consumers.
- Collect interesting data stories along with code as data science
   training resources for the many biomedical researchers who cannot
   currently perform experiments


## Origins of this package 

John C. Mallery conveyed code of Charles Morefield to harvest COVID-19
time series data.  Vince Carey then started an R package/github repo
to manage the relevant code.  The package was named `sars2pack` in
hopes of avoiding name conflict with many other packages while
remaining descriptive and focused.
