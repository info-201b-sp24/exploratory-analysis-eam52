# Author: Angela Sun
library(dplyr)
library(tidyverse)
library(ggplot2)

# Clean the Data
raw_data <- read.csv("Survey on Student Mental Health1.csv")
data <- raw_data %>%
  mutate(department = trimws(Department), Feeling_during_Pandemic = 
           str_extract(How_did_you_felt_during_COVID_19_pandemic_period, "^[^,]*"))
# Create Chart 1
# A stacked bar chart designed to answer research question 1:
# Is there a relationship between mental health issues among college students and their dietary habits?
chart1 <- ggplot(data, aes(x = Feeling_during_Pandemic, 
                           fill = Are_you_getting_good_food_diet_everyday)) + 
  geom_bar(stat = "count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme(axis.text.x = element_text(size = 11)) +
  labs(fill = "Good Diet", 
       x = "Mental Health Condition", y = "Number of Students",
       title = "Relationship between Diet and Mental Health")
chart1