# R-Assignment 4

**Created by Amornpong Duangchawee (ID: 63130500131)**

Choose Dataset:
1. Top 270 Computer Science / Programming Books (Data from Thomas Konstantin, [Kaggle](https://www.kaggle.com/thomaskonstantin/top-270-rated-computer-science-programing-books)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv)

2. Superstore Sales Dataset (Data from Rohit Sahoo,[Kaggle](https://www.kaggle.com/rohitsahoo/sales-forecasting)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv)


### Outlines
1. Explore the dataset
2. Learning function from Tidyverse
3. Transform data with dplyr and finding insight the data
4. Visualization with GGplot2

## Part 1: Explore the dataset

```
library(dplyr)
library(readr)

books <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
```
In this dataset has
```
glimpse(books)
```
```
Rows: 271
Columns: 7
$ Rating          <dbl> 4.17, 4.01, 3.33, 3.97, 4.06, 3.84, 4.09, 4.15, 3.87, 4.62, 4.03, 3.78, 3.73, 3.87, 3.87, 3.95, 3.85, 3.94, 3.75, ~
$ Reviews         <chr> "3,829", "1,406", "0", "1,658", "1,325", "117", "5,938", "1,817", "2,093", "0", "160", "481", "33", "1,255", "593"~
$ Book_title      <chr> "The Elements of Style", "The Information: A History, a Theory, a Flood", "Responsive Web Design Overview For Begi~
$ Description     <chr> "This style manual offers practical advice on improving writing skills. Throughout, the emphasis is on promoting a~
$ Number_Of_Pages <int> 105, 527, 50, 393, 305, 288, 256, 368, 259, 128, 352, 352, 200, 328, 240, 288, 392, 304, 336, 542, 192, 242, 224, ~
$ Type            <chr> "Hardcover", "Hardcover", "Kindle Edition", "Hardcover", "Kindle Edition", "Paperback", "Hardcover", "Hardcover", ~
$ Price           <dbl> 9.323529, 11.000000, 11.267647, 12.873529, 13.164706, 14.188235, 14.232353, 14.364706, 14.502941, 14.641176, 15.22~
```
1.เช็คว่ามีข้อมูลซ้ำกันไหม
```
books %>% filter(duplicated(books))
```
```
[1] Rating          Reviews         Book_title     
[4] Description     Number_Of_Pages Type           
[7] Price 
<0 rows> (or 0-length row.names)
```
ไม่มีข้อมูลซ้ำกัน

2.เช็คว่ามีค่า null ในตัว dataset ไหม
```
is.na(books)
```
ไม่มีข้อมูลใน dataset ที่เป็น null

3.สำรวจข้อมูลเบื้องต้น

```
summary(books)
```

```
     Rating        Reviews           Book_title        Description        Number_Of_Pages      Type               Price        
 Min.   :3.000   Length:271         Length:271         Length:271         Min.   :  50.0   Length:271         Min.   :  9.324  
 1st Qu.:3.915   Class :character   Class :character   Class :character   1st Qu.: 289.0   Class :character   1st Qu.: 30.751  
 Median :4.100   Mode  :character   Mode  :character   Mode  :character   Median : 384.0   Mode  :character   Median : 46.318  
 Mean   :4.067                                                            Mean   : 475.1                      Mean   : 54.542  
 3rd Qu.:4.250                                                            3rd Qu.: 572.5                      3rd Qu.: 67.854  
 Max.   :5.000                                                            Max.   :3168.0                      Max.   :235.650  
 ```

## Part 2: Learning function from Tidyverse

- Function `filter()` It is a function to filter what can be conditional.

```
books %>% filter(duplicated(books))
```

```
[1] Rating          Reviews         Book_title     
[4] Description     Number_Of_Pages Type           
[7] Price 
<0 rows> (or 0-length row.names)
```
กรองดูข้อมูลที่ซ้ำกัน แต่ข้อมูลนี้ไม่มีข้อมูลที่ซ้ำกัน

## Part 3: Transform data with dplyr and finding insight the data

1.แสดงชื่อหนังสือและเรตติ้งของหนังสือที่มีเรตติ้งน้อยที่สุด

```
books %>% 
  filter(Rating == min(
    books %>% select(Rating),na.rm = TRUE)) %>% select(Book_title, Rating)
```

Result: ชื่อหนังสือและเรตติ้งของหนังสือที่มีเรตติ้งน้อยที่สุด

```
Book_title Rating
1                                       Advanced Game Programming: A Gamedev.Net Collection      3
2 Cross-Platform Game Programming (Game Development) (Charles River Media Game Development)      3
3                                   Lambda-Calculus, Combinators and Functional Programming      3

```
2.หนังสือเล่มไหนมีราคาถูกที่สุด

```
books %>% 
  filter(Price == min(Price)) %>% 
  select(Book_title,Price)
```

Result: แสดงชื่อหนังสือและราคาของหนังสือที่ถูกที่สุด

```
             Book_title    Price
1 The Elements of Style 9.323529
```

3.ค่าเฉลี่ยเรตติ้งของราคาหนังสือที่มากกว่า 14

```
books %>%
  filter(Price > 14) %>%
  summarise(mean = mean(Rating))
```

Result: แสดงค่าเฉลี่ยหนังสือ

```
      mean
1 4.070414
```

4.แสดงจำนวนหน้าของหนังสือที่มีหน้ามากที่สุดและน้อยที่สุด

```
books %>% filter(Number_Of_Pages == max(books$Number_Of_Pages) | Number_Of_Pages == min(books$Number_Of_Pages)) %>% select(Number_Of_Pages) %>% table()
```

Result: จำนวนหน้าของหนังสือที่มีหน้ามากที่สุดและน้อยที่สุด

```
  50 3168 
   1    1 
```

5.ค่าเฉลี่ยจำนวนหน้าหนังสือของหนังสือที่มีราคาต่ำกว่า 15

```
books %>% 
  filter(Price < 15) %>%
  summarise(mean = mean(Number_Of_Pages))
```

Result: ค่าเฉลี่ยจำนวนหน้าหนังสือของหนังสือที่มีราคาต่ำกว่า 15

```
   mean
1 267.9
```

6.หาประเภทหนังสือทั้งหมด

```
books %>% distinct(Type) %>% count()
```

Result: จำนวนประเภททั้งหมด

```
  n
1 6
```

## Part 4: Visualization with GGplot2
### 1.) Graph relation between Rating and Reviews

```
 scat_plot0 <- book %>% 
 filter(Reviews <= 2000 ) %>% 
 ggplot(aes(x=Rating,y=Reviews)) + geom_point(aes(color=Type))
 scat_plot0
```
Result:

![scat_plot0](scat_plot0.png)

### 2.) The chart shows the number of types.

```
 bar <- book %>% 
 ggplot(aes(x=Type)) + geom_bar(aes(color=Type))
 bar
```
Result:

![bar](bar.png)

