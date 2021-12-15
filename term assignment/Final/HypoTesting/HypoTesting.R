install.packages('dplyr');
install.packages('readr');

library(dplyr);
library(readr);

app <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/023-Google_Play_Store_Apps/main/term%20assignment/Midterm/Cleaning%20Data/CleaningData.csv")

is.na(app$Rating)

app <- app%>%filter(!is.na(app$Rating))

n <- count(app)
sd <- sd(app$Rating) 
xbar <- mean(app$Rating)
u0 <- 4

#H0:u>=4 Ha:u<4
alpha <- 0.05

z <- ((xbar - u0) / (sd/sqrt(n)));

z <- z$n

# P-value approach
pvalue <- pnorm(z); pvalue

# Critical Value approach
zalpha <- qnorm(alpha);zalpha

# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Using critical value
if(z<=zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}


