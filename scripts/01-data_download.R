#### Preamble ####
# Purpose: Download data from opendatatoronto 
# Author: Lantao Cui
# Data: 31 January 2021
# Contact: lantao.cui@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Data download ####
# https://open.toronto.ca/dataset/covid-19-cases-in-toronto/

# Data set are grouped into packages that have multiple datasets that are 
# relevant to that topic. So we can obtain the package using a unique key.
# get package
package <- show_package("64b54586-6180-4485-83eb-81e8fae3b8fe")
package

# get all resources for this package
resources <- list_package_resources("64b54586-6180-4485-83eb-81e8fae3b8fe")

datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# let's load all covid cases
all_covid_cases <- filter(datastore_resources, row_number()==1) %>% get_resource()
write_csv(all_coivd_cases, "inputs/data/COVID19-cases.csv")

