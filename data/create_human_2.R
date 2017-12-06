# Mika Vehka
# The dataset originates from the United Nations Development Programme.
# Data comes from http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt


# Loading the data:

human<-read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt",header=TRUE,sep=",")
head(human)

# 1. Mutating the data: transform the Gross National Income (GNI) variable to numeric.
library(stringr)
str_replace(human$GNI,pattern=",",replace="")%>%as.numeric


# 2. Excluding unneeded variables:

library(dplyr)
keep<-c("Country", "Edu2.FM", "Labo.FM", "Edu.Exp", "Life.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")
human<-select(human, one_of(keep))
head(human)


# 3. Removing all rows with missing values.

complete.cases(human)
data.frame(human[-1],comp=complete.cases(human))
human_<-filter(human,complete.cases(human))
str(human)
str(human_) 
# Now there are only 162 observations...


# 4. Removing the observations which relate to regions instead of countries...

human_$Country
# observations 1-155 seem to be countries and last 7 regions.
last<-nrow(human_)-7
human_<-human[1:last, ]
str(human_)
# Now there are 155 observations.


# 5. Now let's define the row names of the data by the country names and remove the country name column from the data.

rownames(human_)<-human_$Country
human_<-select(human_,-Country)
str(human_)# The data now has 155 observations and 8 variables...
rownames(human_) # ... and countries as rownames.

write.csv(human_,"C:/Users/Omistaja/Documents/GitHub/IODS-project/data/human2.csv", row.names=TRUE)
