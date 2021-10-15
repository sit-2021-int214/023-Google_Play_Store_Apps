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

# Dataset
ggp <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/023-Google_Play_Store_Apps/main/term%20assignment/Midterm/Original%20Data/Google_Play_Store_Apps_Original.csv")

# Cleaning Data
## Remove Duplicate Data && remove Free Applications;
ggp %>% filter(duplicated(ggp))
ggp %>%  filter(Price != 0)  %>% select(App,Price)
## Change Reviews, Price, Installs datatype from chr to numeric

ggp$Reviews <- ggp$Reviews %>% as.numeric
ggp$Price <- parse_number(ggp$Price)
ggp$Installs <- parse_number(ggp$Installs)


glimpse(ggp)