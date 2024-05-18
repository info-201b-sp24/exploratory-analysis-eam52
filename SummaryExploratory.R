student_mental_health <- read.csv("Documents/Info201code/exploratory-analysis-eam52/Survey on Student Mental Health1.csv")
library(dplyr)
library(tidyverse)

## What is the average amount people are sleeping everyday? 
mean_sleep <- student_mental_health %>%
  filter(How_much_time_are_you_sleeping_everyday == max(How_much_time_are_you_sleeping_everyday, na.rm = TRUE)) %>%
  pull(How_much_time_are_you_sleeping_everyday)

  ## What department do the most amount of people work for?
department <- student_mental_health %>%
  filter(Department == max(Department, na.rm = TRUE)) %>%
  pull(Department)

# Why did people choose this particular department the most?
choose_department <- student_mental_health %>%
  filter(Why_did_you_chosen_your_department_work_area == max(Why_did_you_chosen_your_department_work_area, na.rm = TRUE)) %>%
  pull(Why_did_you_chosen_your_department_work_area)

# Are the people in this dataset having good sleep on average?
good_sleep <- student_mental_health %>%
  filter(Are_you_having_proper_sleep_everyday == max(Are_you_having_proper_sleep_everyday, na.rm = TRUE)) %>%
  pull(Are_you_having_proper_sleep_everyday)

# Where are students getting the most stress from? 
most_stress <- student_mental_health %>%
  filter(From_where_you_are_getting_stress == max(From_where_you_are_getting_stress)) %>%
  pull(From_where_you_are_getting_stress)
