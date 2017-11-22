# Mika Vehka
# 17.11.2017
# Data wrangling exercises on alcohol use.


# Exercise 3: Reading data into R and exploring dimensions and structure

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


# Exercise 4: joining datasets

library(dplyr)
commonvariables<-c("school", "sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery","internet")
stumat_stupor<-inner_join(student_mat, student_por, by=commonvariables)
dim(stumat_stupor)
str(stumat_stupor)
# keeps only those students that are present in both datasets by default.
# The data consist of 382 observations and  53 variables.



# Exercise 5: compining duplicated answers

# Joined colums

joined=select(stumat_stupor,one_of(commonvariables))
not_joined=colnames(student_mat)[!colnames(student_mat)%in%commonvariables]
# if else structure
for(col_name in not_joined){
  two_cols<-select(stumat_stupor,starts_with(col_name))
  first_col<-select(two_cols, 1)[[1]]
  if(is.numeric(first_col)){
    joined[col_name]<-round(rowMeans(two_cols))
  }else{
    joined[col_name]<-first_col
  }
}

head(joined)


# Exercise 6: Average of alcohol use and high alcohol use

# Average alcohol use

joined<-joined %>%
  mutate(
    alc_use=(Dalc+Walc)/2)

# High alcohol use

joined<-joined %>%
  mutate(
    high_use=alc_use>2)


# Exercise 7: Exploration of dataset

glimpse(joined)

write.csv(joined,"C:/Users/Omistaja/Documents/GitHub/IODS-project/alc_use.csv")

