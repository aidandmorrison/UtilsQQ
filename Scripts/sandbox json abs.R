
library(tidyverse)
library(jsonlite)

url <- "http://stat.data.abs.gov.au/sdmx-json/data/NETOVERSEASMIGRATION_CY/1+2+3.3+1+2.TT+A04+A59+A10+A15+A20+A25+A30+A35+A40+A45+A50+A55+A60+6599.0+1+2+3+4+5+6+7+8.A/all?startTime=2004&endTime=2015&dimensionAtObservation=allDimensions"
response <- jsonlite::read_json(url)

data <- response$dataSets %>%
  unlist() %>%
  enframe()


# needs lots of tweaking but it's only for the last 10 years...
