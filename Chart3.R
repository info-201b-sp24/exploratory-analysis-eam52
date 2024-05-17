# Author: Angela Sun
library(dplyr)
library(tidyverse)
library(ggplot2)

# Clean the Data
raw_data <- read.csv("Survey on Student Mental Health1.csv")
data <- raw_data %>%
  mutate(department = trimws(Department), Feeling_during_Pandemic = 
           str_extract(How_did_you_felt_during_COVID_19_pandemic_period, "^[^,]*"))
# Identify the top four mental effects of COVID-19 and classify them as positive or negative
data_influence <- data %>%
  mutate(Mental_Impacts_of_COVID = if_else(Feeling_during_Pandemic == "Happy", "Positive", "Negative"))
top_stress<- data_influence %>%
  count(From_where_you_are_getting_stress) %>%
  arrange(desc(n)) %>%
  slice_head(n = 4)
# Remove outliers
data_influence <- data_influence %>%
  filter(From_where_you_are_getting_stress %in% top_stress$From_where_you_are_getting_stress & Cgpa > 5)
# Create Chart3
# A box plot designed to answer research question 3: 
# How did the pandemic affect the students' well being?
chart3 <- ggplot(data_influence, aes(x = factor(Mental_Impacts_of_COVID), 
                                     y = Cgpa,
                                     fill= From_where_you_are_getting_stress)) + 
  geom_boxplot() +
  labs(title = "Impact of the Pandemic on Students' Mental and Academic Well-being", 
       x = "Positive or Negative Mental Impacts of COVID-19", y = "GPA") +
  theme(axis.text.x = element_text(size = 11)) +
  scale_fill_discrete(name = "Worries")
chart3