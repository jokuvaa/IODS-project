# Mika Vehka
# 17.11.2017
# Data wrangling exercises on alcohol use.

# Exercise 3
library(readr)
student_mat <- read_delim("~/GitHub/IODS-project/data/student/student-mat.csv", 
                            +     ";", escape_double = FALSE, trim_ws = TRUE)
student_mat
library(readr)
student_por <- read_delim("~/GitHub/IODS-project/data/student/student-por.csv", 
                            +     ";", escape_double = FALSE, trim_ws = TRUE)
student_por

dim(student_mat)
str(student_mat)

# The data includes 395 observations and 33 variables, for example students sex, age, family size etc.

dim(student_por)
str(student_por)

# ..and this data includes 649 observations of 33 variables. 


# Exercise 4

joined_data<-merge(student_mat, student_por, by=c("school", "sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery","internet"))
dim(joined_data)
str(joined_data)
# keeps only those students that are present in both datasets by default.
# The data consist of 382 observations and  53 variables.
