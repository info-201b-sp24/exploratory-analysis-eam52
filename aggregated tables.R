library("dplyr")
library("tidyverse")

data_set <- read.csv("~/Documents/exploratory-analysis-eam52/Survey on Student Mental Health1.csv")

# mutating the column names so the names are shorter and logical instead of long
mutate_col_names <- data_set %>%
  mutate(
    age = Age,
    grade = Current_year_you_are_studying_in,
    major = Department,
    sleep_amount = How_much_time_are_you_sleeping_everyday,
    gpa = Cgpa,
    reason = Why_did_you_chosen_your_department_work_area,
    attitude = Are_you_happy_with_your_department_work_area,
    diet = Are_you_getting_good_food_diet_everyday
  )

# Grouping the datatset based on the needed information to answer our research questions!
agregated_data_frame <- mutate_col_names %>%
  group_by(major, reason, attitude, sleep_amount, diet) %>%
  summarize(
    average_gpa = mean(gpa, na.rm = TRUE),
    maximum_gpa = max(gpa, na.rm = TRUE),
    median_gpa = median(gpa, na.rm = TRUE),
    total_students = n()
  )
# this prints the table in a way that shows the whole table (n = nrow(df))
print(agregated_data_frame, n = nrow(agregated_data_frame))
