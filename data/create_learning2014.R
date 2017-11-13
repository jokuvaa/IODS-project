Mika Vehka 
9.11.2017
The data is from international survey of Approaches to Learning.


tiedosto <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
head(tiedosto)
dim(tiedosto)
str(tiedosto)
# We have 183 observations and 60 variables
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")
library(dplyr)
deep_columns <- select(tiedosto, one_of(deep_questions))
tiedosto$deep <- rowMeans(deep_columns)
tiedosto$deep
surface_columns <- select(tiedosto, one_of(surface_questions))
tiedosto$surf <- rowMeans(surface_columns)
tiedosto$surf
strategic_columns <- select(tiedosto, one_of(strategic_questions))
tiedosto$stra <- rowMeans(strategic_columns)
tiedosto$stra
# Other variables are already there
tiedosto
# Then we select only those variables that are used.
My_data_frame<-select(tiedosto, c("gender","Age","Attitude","deep","stra","surf","Points"))
My_data_frame
# Then we select only those that did not get 0 points.
My_data_frame_2<-filter(My_data_frame,Points>0)
My_data_frame_2
# E. 4
getwd()
setwd("~/GitHub/IODS-project")
?write.csv
write.table(My_data_frame_2, file="Learning2014.txt",sep="\t",col.names=TRUE)
?read.table
a<-read.table("Learning2014.txt", header=TRUE)
head(a)
str(a)
