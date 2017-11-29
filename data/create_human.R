# Mika Vehka
# Data wrangling exercise 27.11.2017

# Now we read the "Human development" and "Gender inequality" datas into R.

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
head(hd)

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")
head(gii)


# Exercise 3: Now let's explore the datasets, see the structure and dimensions of the data and create summaries of the variables.

str(hd)
dim(hd)
summary(hd)

str(gii)
dim(gii)
summary(gii)

# The Human development data has 195 observations (countries) and 8 variables, for example HDI rank, life expectancy, mean years of education, Gross National Income etc.

# Gender inequality data has 195 observations and 10 variables, for example GenderInequality Index, Maternal MortalityRatio, Percent Representation in Parliament etc. 
 

# Exercise 4: Renaming the variables

library(dplyr)

rename(hd,devel=HDI.Rank,count=Country, devel=Human.Development.Index..HDI.,life=Life.Expectancy.at.Birth,exp_edu=Expected.Years.of.Education,mean_edu=Mean.Years.of.Education,income=Gross.National.Income..GNI..per.Capita,gni_minus_hdi=GNI.per.Capita.Rank.Minus.HDI.Rank)

rename(gii,gii_rank=GII.Rank, count=Country, gen_in_ind=Gender.Inequality.Index..GII., mater_mort=Maternal.Mortality.Ratio, ado_birth=Adolescent.Birth.Rate, parliament=Percent.Representation.in.Parliament, second_ed_f=Population.with.Secondary.Education..Female., second_ed_m=Population.with.Secondary.Education..Male., labour_f=Labour.Force.Participation.Rate..Female., labour_m=Labour.Force.Participation.Rate..Male.)


# Exercise 5: new variables

gii <- mutate(gii, sex_ed_rat=Population.with.Secondary.Education..Female./Population.with.Secondary.Education..Male.)

gii <- mutate(gii, sex_lab_rat=Labour.Force.Participation.Rate..Female./Labour.Force.Participation.Rate..Male.)


# Exercise 6: joining datasets

human <- inner_join(hd,gii,by="Country") # Keeps only the countries in both data sets by default.
head(human)
str(human) # The new data set has 195 observations and 19 variables as was expected.

write.csv(human,"C:/Users/Omistaja/Documents/GitHub/IODS-project/human.csv")