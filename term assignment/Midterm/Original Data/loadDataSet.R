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
