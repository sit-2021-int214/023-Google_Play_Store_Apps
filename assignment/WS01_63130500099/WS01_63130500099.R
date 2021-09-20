#63130500099
#install package
install.packages("readr")
install.packages("assertive")
install.packages("stringr")
install.packages("dplyr")

#loading library
library(dplyr)
library(readr)      # A fast and friendly way to read rectangular data
library(stringr)    # Character manipulation
library(assertive)  # Readable check functions to ensure code integrity

#loading data set from csv file
sat_score <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv")

#Observe the data
View(sat_score)
glimpse(sat_score)

#Changing the types of values
##check type
is.numeric(sat_score$math_score)
assert_is_numeric(sat_score$math_score)
is.numeric(sat_score$reading_score)
assert_is_numeric(sat_score$reading_score)
is.numeric(sat_score$writing_score)
assert_is_numeric(sat_score$writing_score)

##change type
sat_score$math_score <- as.numeric(sat_score$math_score)
sat_score$reading_score <- as.numeric(sat_score$reading_score)
sat_score$writing_score <- as.numeric(sat_score$writing_score)

#List duplicate data
sat_score %>% filter(duplicated(sat_score))

#remove duplicate date
sat_score <- sat_score %>% distinct()

#count all distinct data
sat_score %>% distinct() %>% count()

#Check range value of each score
sat_score$math_score %>% na.omit() %>% 
  assert_all_are_in_closed_range(sat_score$math_score, lower = 200, upper = 800)

sat_score$reading_score %>% na.omit() %>% 
  assert_all_are_in_closed_range(sat_score$reading_score, lower = 200, upper = 800)

sat_score$writing_score %>% na.omit() %>% 
  assert_all_are_in_closed_range(sat_score$writing_score, lower = 200, upper = 800)

#Handling with NA
sat_score$math_score <- replace(sat_score$math_score,sat_score$math_score <200|sat_score$math_score >800, NA)
sat_score$reading_score <- replace(sat_score$reading_score,sat_score$reading_score <200|sat_score$reading_score >800, NA)
sat_score$writing_score <- replace(sat_score$writing_score,sat_score$writing_score <200|sat_score$writing_score >800, NA)

#Calculate total score and assign in sum_score column
sat_score <- sat_score %>% mutate(sum_score = math_score+reading_score+writing_score)

#What is min, max, average, quantile of each part in SAT ?
sat_score %>% summary()

## check quantile math_score
sat_score$math_score %>% na.omit() %>% quantile()

## check quantile reading_score
sat_score$reading_score%>% na.omit() %>% quantile()

## check quantile writing_score
sat_score$writing_score%>% na.omit() %>% quantile()

#What is min, max, average, quantile of total score in SAT ?
sat_score %>%select(sum_score) %>%summary()
#check sum_score quantile
sat_score$sum_score %>% na.omit() %>% quantile()

#Which school is get highest SAT score ?
sat_score %>% select(school_name,sum_score) %>% arrange(desc(sum_score)) 
