library(MASS)
library(DescTools)
library(dplyr)

#1.) ???????????????????????????????????? body weight in kg. ????????? heart weight in g. ?????????????????????????????????????????? (F,M)
max(cats$Bwt[cats$Sex == 'F']) 
max(cats$Bwt[cats$Sex == 'M'])
max(cats$Hwt[cats$Sex == 'F']) 
max(cats$Hwt[cats$Sex == 'M'])
cats %>% dplyr::filter(Sex == 'F') %>% summarise(Bwt = max(Bwt)) 
cats %>% dplyr::filter(Sex == 'M') %>% summarise(Bwt = max(Bwt))
cats %>% dplyr::filter(Sex == 'F') %>% summarise(Hwt = max(Hwt)) 
cats %>% dplyr::filter(Sex == 'M') %>% summarise(Hwt = max(Hwt)) 

#2.) ???????????????????????????????????? body weight in kg. ????????? heart weight in g. ?????????????????????????????????????????? (F,M)
min(cats$Bwt[cats$Sex == 'F']) 
min(cats$Bwt[cats$Sex == 'M'])
min(cats$Hwt[cats$Sex == 'F']) 
min(cats$Hwt[cats$Sex == 'M'])
cats %>% dplyr::filter(Sex == 'F') %>% summarise(Bwt = min(Bwt)) 
cats %>% dplyr::filter(Sex == 'M') %>% summarise(Bwt = min(Bwt))
cats %>% dplyr::filter(Sex == 'F') %>% summarise(Hwt = min(Hwt)) 
cats %>% dplyr::filter(Sex == 'M') %>% summarise(Hwt = min(Hwt)) 

#3.) ?????????????????????????????????????????????????????????????????? body weight in kg. ????????? heart weight in g. ?????????????????????????????????????????? (F,M)
Mode(cats$Bwt[cats$Sex == 'F'])
Mode(cats$Bwt[cats$Sex == 'M'])
Mode(cats$Hwt[cats$Sex == 'F'])
Mode(cats$Hwt[cats$Sex == 'M'])
cats %>% filter(Sex == 'F') %>% summarise(mode = Mode(Bwt,na.rm=T))
cats %>% filter(Sex == 'M') %>% summarise(mode = Mode(Bwt,na.rm=T))
cats %>% filter(Sex == 'F') %>% summarise(mode = Mode(Hwt,na.rm=T))
cats %>% filter(Sex == 'M') %>% summarise(mode = Mode(Hwt,na.rm=T))

#4.) ??????????????????????????????????????????????????????
print(table(survey$Sex))
survey %>% count(Sex)
#5.) ????????????????????????????????????????????????????????????????????????????????????????????????
Mode(survey$Sex[survey$Smoke=="Never"],na.rm = TRUE)
survey %>% filter(Smoke == "Never") %>% summarise(mode = Mode(Sex,na.rm=T))

