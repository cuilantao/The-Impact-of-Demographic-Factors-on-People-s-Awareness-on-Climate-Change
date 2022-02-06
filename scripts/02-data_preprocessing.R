#### Preamble ####
# Purpose: Preprocess the data for future analyze
# Author: Lantao Cui
# Data: 31 January 2021
# Contact: lantao.cui@mail.utoronto.ca
# License: MIT

#### load the libraies we need ####
library(tidyverse)
library(dplyr)

#### Read the csv files ####
city_of_toronto_covid_cases <- read_csv("inputs/data/COVID19-cases.csv")


#### Remove the ID column, we don't need them for the analyze ####
city_of_toronto_covid_cases_clean <- city_of_toronto_covid_cases[-c(1,2)]

#### Let's find out if there are any NAs in this dataset ####
number_of_nas <- sum(is.na(city_of_toronto_covid_cases_clean))


#### We found out that there are NA values, so we should remove them as they will affect the data analyze ####
covid_case_with_na_remove <- na.omit(city_of_toronto_covid_cases_clean)

#### Double check that there is no more NA values ####
stopifnot(sum(is.na(covid_case_with_na_remove)) == 0)

#### Now we can save the cleaned data ####
write_csv(covid_case_with_na_remove,"inputs/data/COVID19-cases-clean.csv")

