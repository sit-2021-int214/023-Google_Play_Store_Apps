#-----Part 1-----

# Library
library(dplyr)
library(readr)
library(ggplot2)
library(stringr)

#Dataset
data <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")

#Show Date
glimpse(data)

#show Summary Data
summary(data)

#How Many missing values in Data
table(is.na(data))

#-----Part 2-----

#Select()
data %>% select(Country,City,`Product ID`)

#Group_by()
data %>% group_by(`Sub-Category`)

#Arrange()
data %>% count(Region) %>% group_by(Region) %>% rename(`totalsales` = n) %>%arrange(`totalsales`)

#-----Part 3-----

#1
data %>% filter(str_detect(`Customer ID`, "^TB"))

#2
  data %>% 
  group_by(City) %>% 
  summarise(totalsales = sum(Sales)) %>%
  filter(totalsales > 100000) %>%
  arrange(desc(totalsales))
  
#3
  data %>%
  select(`Customer Name`,`Customer ID`) %>%
  filter(data$Sales == min(data$Sales))
  
#4
  data %>% 
  count(Segment) %>% 
  group_by(Segment) %>% 
  rename(totalsegment = n) %>%
  arrange(totalsegment)
  
#5
  data %>%
  select(`Product Name`,`Product ID`,`Ship Date`) %>%
  filter(`Ship Date` == "17/06/2017")
  
#6
  Productship <- data %>%
  select(`Product ID`,`Product Name`,`Order ID`,`Ship Mode`) %>%
  filter(`Ship Mode` == "First Class"|`Ship Mode` == "Second Class")
  
  Productship %>% filter(str_detect(`Order ID`,"^CA"))
  
  Productship
  
#-----Part 4----- 
  
#Graph1
  data %>%  
  filter(Sales > 5000)%>% 
  ggplot(aes(x=City,y=Sales)) + geom_point() 
  

#Graph2
  bar <- data %>% 
    ggplot(aes(x=`Ship Mode`)) + geom_bar(aes(color=`Ship Mode`))
  bar