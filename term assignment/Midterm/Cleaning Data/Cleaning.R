#install package
install.packages("readr")
install.packages("assertive")
install.packages("stringr")
install.packages("dplyr")
install.packages("DescTools")
#loading library
library(DescTools)
library(dplyr)
library(readr)      # A fast and friendly way to read rectangular data
library(stringr)    # Character manipulation
library(assertive)  # Readable check functions to ensure code integrity

# Dataset
ggp <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/023-Google_Play_Store_Apps/main/term%20assignment/Midterm/Original%20Data/Google_Play_Store_Apps_Original.csv")

# Cleaning Data
## Remove Duplicate Data && remove Free Applications;
ggp %>% count(App,Category) %>% filter(n>1) %>% head(10)
ggp <- ggp %>% distinct(App,Category, .keep_all = TRUE)
ggp %>% count(App,Category) %>% filter(n>1) %>% head(10)

## Change Reviews, Price datatype from chr to numeric

ggp$Reviews <- ggp$Reviews %>% as.numeric
ggp$Price <- parse_number(ggp$Price)


glimpse(ggp)
