#install package
install.packages("DescTools")
install.packages("readr")
install.packages("assertive")
install.packages("stringr")
install.packages("dplyr")
install.packages("tidyverse")
install.packages("ggplot2")

#loading library
library(dplyr)
library(readr)      
library(stringr)    
library(assertive)  
library(DescTools)
library(ggplot2)

#loading dataset
ggp <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/023-Google_Play_Store_Apps/main/term%20assignment/Midterm/Original%20Data/Google_Play_Store_Apps_Original.csv")

#remove duplicated
ggp <- ggp %>% distinct(App,Category, .keep_all = TRUE)
#change type
ggp$Reviews <- ggp$Reviews %>% as.numeric
ggp$Price <- parse_number(ggp$Price)

#make gApp
gApp <- ggp %>% distinct(App, .keep_all = TRUE)

#1
gApp <- ggp %>% distinct(App, .keep_all = TRUE)
count(gApp %>% filter(Rating >= 4.5))
count(gApp)

#2
count(gApp %>% filter(Price == 0))
count(gApp %>% filter(Price != 0))

#3
##Free
gApp %>% filter(Reviews == max(ggp %>% filter(Price == 0) %>% select(Reviews),na.rm = TRUE)) %>% select(App, Reviews)
##Not Free
gApp %>% filter(Reviews == max(ggp %>% filter(Price != 0) %>% select(Reviews),na.rm = TRUE)) %>% select(App, Reviews)

#4
my_mode <- function(x) {                     # Create mode function 
  unique_x <- unique(x)
  tabulate_x <- tabulate(match(x, unique_x))
  unique_x[tabulate_x == max(tabulate_x)]
}

my_mode(ggp$Genres)
Mode(ggp$Genres)

#5
bar <- ggp %>% 
  ggplot(aes(y=Category)) + geom_bar(aes(color=Category))

bar

#6
plot <- ggp %>% 
  filter(Price != 0 ) %>% 
  ggplot(aes(x=Rating,y=Price)) + ggtitle("Rating and Paid Apps Relations") + geom_point(aes(color=Price))

plot
