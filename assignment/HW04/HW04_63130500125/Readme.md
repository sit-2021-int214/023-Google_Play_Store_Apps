# R-Assignment 4

**Created by Surawit Nakgaew (ID: 6313050012)**

Choose Dataset: Top 270 Computer Science / Programing Books (Data from Thomas Konstantin, [Kaggle](https://www.kaggle.com/thomaskonstantin/top-270-rated-computer-science-programing-books)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv)
1. Top 270 Computer Science / Programing Books (Data from Thomas Konstantin, [Kaggle](https://www.kaggle.com/thomaskonstantin/top-270-rated-computer-science-programing-books)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv)

2. Superstore Sales Dataset (Data from Rohit Sahoo,[Kaggle](https://www.kaggle.com/rohitsahoo/sales-forecasting)) >> [Using CSV](https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv)

### Outlines
1. Explore the dataset
2. Learning function from Tidyverse
3. Transform data with dplyr and finding insight the data
4. Visualization with GGplot2

## Part 1: Explore the dataset

```
# Library
library(ggplot2)
library(stringr)
library(readr)
library(dplyr)

# Dataset
dataset <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")
```

In this dataset has 271 Observations , 7 Variables

```
glimpse(dataset)
```

```
Rows: 271
Columns: 7
$ Rating          <dbl> 4.17, 4.01, 3.33, 3.97, 4.06, 3.84, 4.09, 4.15, 3.87, 4.62, 4.03, 3.78, 3.73, 3.87, 3.87, 3.95, 3.85, 3.94, 3.75, 4.10, 4.22, 3.71, 4~
$ Reviews         <dbl> 3829, 1406, 0, 1658, 1325, 117, 5938, 1817, 2093, 0, 160, 481, 33, 1255, 593, 417, 80, 279, 370, 2092, 27, 676, 16, 1268, 0, 19, 491,~
$ Book_title      <chr> "The Elements of Style", "The Information: A History, a Theory, a Flood", "Responsive Web Design Overview For Beginners", "Ghost in t~
$ Description     <chr> "This style manual offers practical advice on improving writing skills. Throughout, the emphasis is on promoting a plain English styl~
$ Number_Of_Pages <dbl> 105, 527, 50, 393, 305, 288, 256, 368, 259, 128, 352, 352, 200, 328, 240, 288, 392, 304, 336, 542, 192, 242, 224, 412, 318, 432, 336,~
$ Type            <chr> "Hardcover", "Hardcover", "Kindle Edition", "Hardcover", "Kindle Edition", "Paperback", "Hardcover", "Hardcover", "Hardcover", "Paper~
$ Price           <dbl> 9.323529, 11.000000, 11.267647, 12.873529, 13.164706, 14.188235, 14.232353, 14.364706, 14.502941, 14.641176, 15.229412, 15.229412, 15~
```
- Rating : ค่าความนิยมของหนังสือ (numeric)
- Reviews : ยอดการรีวิวหนังสือ (numeric)
- Book_title : ชื่อหนังสือ (character)
- Description : คำอธิบายหนังสือ (character)
- Number_Of_Pages : จำนวนหน้าของหนังสือ (numeric)
- Type : ประเภทของหนังสือ (character)
- Price : ราคาของหนังสือ (numeric)

### 1. เช็คข้อมูลใน Dataset ว่ามีข้อมูลที่เป็น Not Available (NA) ไหม

```
is.na(dataset) %>% table()
```
Result : ไม่มีข้อมูลที่เป็น Not Available (NA)
```
.
FALSE 
 1897 
```
### 2. เช็คข้อมูลใน Dataset ว่ามีข้อมูลที่ซ้ำกันไหม

```
dataset %>% filter(duplicated(dataset))
```
Result : ไม่มีข้อมูลที่ซ้ำกัน
```
# A tibble: 0 x 7
# ... with 7 variables: Rating <dbl>, Reviews <dbl>, Book_title <chr>, Description <chr>, Number_Of_Pages <dbl>, Type <chr>, Price <dbl>
```
### 3. สรุปข้อมูลเบื้องต้น

```
dataset %>% summary()
```
Result :
```
     Rating         Reviews        Book_title        Description        Number_Of_Pages      Type               Price        
 Min.   :3.000   Min.   :   0.0   Length:271         Length:271         Min.   :  50.0   Length:271         Min.   :  9.324  
 1st Qu.:3.915   1st Qu.:   5.5   Class :character   Class :character   1st Qu.: 289.0   Class :character   1st Qu.: 30.751  
 Median :4.100   Median :  35.0   Mode  :character   Mode  :character   Median : 384.0   Mode  :character   Median : 46.318  
 Mean   :4.067   Mean   : 185.6                                         Mean   : 475.1                      Mean   : 54.542  
 3rd Qu.:4.250   3rd Qu.: 116.5                                         3rd Qu.: 572.5                      3rd Qu.: 67.854  
 Max.   :5.000   Max.   :5938.0                                         Max.   :3168.0                      Max.   :235.650  
```

## Part 2: Learning function from Tidyverse

- Function `filter()` from package [dplyr](https://dplyr.tidyverse.org/reference/filter.html)). is used to subset a data frame, retaining all rows that satisfy your conditions.

```
dataset %>% filter(Rating < 3.5)
```
Result : ดูข้อมูลใน Dataset ว่า หนังสือเล่มไหนที่มีค่าความนิยมของหนังสือน้อยกว่า 3.5
```
# A tibble: 11 x 7
   Rating Reviews Book_title                                          Description                                                 Number_Of_Pages Type    Price
    <dbl>   <dbl> <chr>                                               <chr>                                                                 <dbl> <chr>   <dbl>
 1   3.33       0 Responsive Web Design Overview For Beginners        "In Responsive Web Design Overview For Beginners, you'll g~              50 Kindle~  11.3
 2   3.2        0 Game Programming Golden Rules                       "'Game Programming Golden Rules' provides indispensable te~             318 Paperb~  19.2
 3   3.32       3 Sams Teach Yourself JavaScript in 24 Hours          "JavaScript is one of the easiest, most straightforward wa~             442 Paperb~  27.8
 4   3.22       2 Beginning Java 2                                    "What is this book about? The Java language has been growi~            1200 Paperb~  36.6
 5   3.38       2 Sams Teach Yourself Perl in 24 Hours                "Learn Perl programming quickly and easily with 24 one-hou~             462 Paperb~  38.2
 6   3.37       1 Unity Virtual Reality Projects                      "If you are a non-programmer unfamiliar with 3D computer g~             286 Paperb~  45.7
 7   3          0 Advanced Game Programming: A Gamedev.Net Collection "Welcome to \"Advanced Game Programming: A GameDev.net Col~             464 Paperb~  59.1
 8   3          0 Cross-Platform Game Programming (Game Development)~ "With many of today's games being released simultaneously ~             460 Paperb~  60.4
 9   3          0 Lambda-Calculus, Combinators and Functional Progra~ "Originally published in 1988, this book presents an intro~             192 Paperb~  61.2
10   3.48       3 Optimized C++: Proven Techniques for Heightened Pe~ "In today's fast and competitive world, a program's perfor~             388 Paperb~  83.2
11   3.45       1 3D Game Engine Design: A Practical Approach to Rea~ "A major revision of the international bestseller on game ~            1040 Hardco~ 118. 
```


## Part 3: Transform data with dplyr and finding insight the data

### 1. แสดง ค่าความนิยมของหนังสือ (Rating) , ชื่อของหนังสือ (Book_title) , ราคาของหนังสือ (Price) ของหนังสือที่มีค่าความนิยมมากกว่าค่าเฉลี่ยของค่าความนิยมของหนังสือทั้งหมด 

```
dataset$Rating %>% mean() # 4.067417
dataset %>% select(Rating,Book_title,Price) %>% filter(Rating > mean(Rating))
```
Result: ข้อมูล Rating , Book_title , Price ของหนังสือที่มีค่าความนิยม (Rating) มากกว่าค่าเฉลี่ยของค่าความนิยมของหนังสือทั้งหมด 
```
# A tibble: 147 x 3
   Rating Book_title                                                                                            Price
    <dbl> <chr>                                                                                                 <dbl>
 1   4.17 The Elements of Style                                                                                  9.32
 2   4.09 Start with Why: How Great Leaders Inspire Everyone to Take Action                                     14.2 
 3   4.15 Algorithms to Live By: The Computer Science of Human Decisions                                        14.4 
 4   4.62 ZX Spectrum Games Code Club: Twenty fun games to code and learn                                       14.6 
 5   4.1  The Innovators: How a Group of Hackers, Geniuses and Geeks Created the Digital Revolution             17.2 
 6   4.22 Debugging: The 9 Indispensable Rules for Finding Even the Most Elusive Software and Hardware Problems 17.5 
 7   4.21 Help Your Kids with Computer Coding                                                                   18.9 
 8   4.28 The Code Book: The Science of Secrecy from Ancient Egypt to Quantum Cryptography                      19.1 
 9   4.37 Adventures in Minecraft                                                                               21.0 
10   4.25 Coding Games in Scratch                                                                               21.1 
# ... with 137 more rows
```

- หาค่าเฉลี่ยของ ค่าความนิยมของหนังสือ (Rating) ก่อนว่ามีค่าเท่าไหร่ (mean = 4.067417)
- เลือกข้อมูลใน Dataset โดยเอาแค่ Rating , Book_title , Price แล้ว filter ค่า Rating ที่มีค่ามากกว่า 4.067417 หรือ Rating > mean(Rating)

### 2. แสดง ค่าความนิยมของหนังสือ (Rating) , ชื่อของหนังสือ (Book_title) , ราคาของหนังสือ (Price) ของหนังสือที่มีค่าความนิยมมากกว่าค่าเฉลี่ยของค่านิยมของหนังสือทั้งหมดและมีราคาสูงกว่าค่าเฉลี่ยของราคาของหนังสือทั้งหมด

```
dataset$Price %>% mean() # 54.54186
dataset %>% select(Rating,Book_title,Price) %>% filter(Price > mean(Price) & Rating > mean(Rating))
```
Result: ข้อมูล Rating , Book_title , Price ของหนังสือที่มีค่าความนิยม (Rating) มากกว่าค่าเฉลี่ยของค่าความนิยมของหนังสือและมีราคามากกว่าค่าเฉลี่ยของหนังสือทั้งหมด
```
# A tibble: 58 x 3
   Rating Book_title                                                                                          Price
    <dbl> <chr>                                                                                               <dbl>
 1   4.18 Building Microservices: Designing Fine-Grained Systems                                               54.9
 2   4.21 Exceptional C++: 47 Engineering Puzzles, Programming Problems, and Solutions                         56.1
 3   4.25 Reviewing Java                                                                                       56.6
 4   4.35 Microsoft Visual C# Step by Step                                                                     56.6
 5   4.25 Refactoring: Improving the Design of Existing Code                                                   57.2
 6   4.19 Growing Object-Oriented Software, Guided by Tests                                                    57.2
 7   4.24 Modern C++ Design: Generic Programming and Design Patterns Applied                                   58.4
 8   4.46 Structure and Interpretation of Computer Programs (MIT Electrical Engineering and Computer Science)  58.9
 9   4.46 Structure and Interpretation of Computer Programs                                                    58.9
10   4.16 C: A Reference Manual                                                                                60.0
# ... with 48 more rows
```

- ใช้ค่าเฉลี่ยของ Rating จากข้อ 1 (mean = 4.067417)
- หาค่าเฉลี่ยของ ราคาของหนังสือ (Price) ก่อนว่ามีค่าเท่าไหร่ (mean = 54.54186)
- เลือกข้อมูลใน Dataset โดยเอาแค่ Rating , Book_title , Price แล้ว filter ค่า Rating ที่มีค่ามากกว่า 4.067417 หรือ Rating > mean(Rating) และ Price ที่มีค่ามากกว่า 54.54186 หรือ Price > mean(Price)

### 3. แสดง ค่าความนิยมของหนังสือ (Rating) ชื่อหนังสือ (Book_title) และ ราคาของหนังสือ (Price) ของหนังสือที่มีราคามากที่สุด

```
dataset %>% select (Rating,Book_title,Price) %>% filter(Price == max(Price))
```
Result: ข้อมูล Rating , Book_title , Price ของหนังสือที่มีราคามากที่สุด
```
# A tibble: 1 x 3
  Rating Book_title                            Price
   <dbl> <chr>                                 <dbl>
1   3.84 A Discipline for Software Engineering  236.
```

- เลือกข้อมูลใน Dataset โดยเอาแค่ Rating , Book_title , Price แล้ว filter ค่า Price ที่มีค่าเท่ากับค่าสูงสุดของราคาของหนังสือ max(Price)

### 4. แสดง ค่าความนิยมของหนังสือ (Rating) ชื่อหนังสือ (Book_title) และ ราคาของหนังสือ (Price) ของหนังสือที่มีราคาน้อยที่สุด

```
dataset %>% select (Rating,Book_title,Price) %>% filter(Price == min(Price))
```
Result: ข้อมูล Rating , Book_title , Price ของหนังสือที่มีราคาน้อยที่สุด
```
# A tibble: 1 x 3
  Rating Book_title            Price
   <dbl> <chr>                 <dbl>
1   4.17 The Elements of Style  9.32
```

- เลือกข้อมูลใน Dataset โดยเอาแค่ Rating , Book_title , Price แล้ว filter ค่า Price ที่มีค่าเท่ากับค่าน้อยสุดของราคาของหนังสือ min(Price)

### 5. ประเภทของหนังสือทั้งหมด มีประเภทอะไรบ้าง

```
dataset %>% select(Type) %>% distinct()
```
Result: ประเภทของหนังสือทั้งหมดใน Dataset
```
# A tibble: 6 x 1
  Type                 
  <chr>                
1 Hardcover            
2 Kindle Edition       
3 Paperback            
4 ebook                
5 Unknown Binding      
6 Boxed Set - Hardcover
```

- เลือกข้อมูลใน Dataset โดยเอาแค่ Type แล้วใช้ distinct เพื่อเอาตัวที่ซ้ำออก

### 6. มีหนังสือประเภทไหนเยอะที่สุด

```
book_type_frequency <- as.data.frame(table(dataset$Type)) 
book_type_frequency$Var1[book_type_frequency$Freq == max(book_type_frequency$Freq)]
```
Result: ข้อมูล ประเภทของหนังสือ (Type) ที่มีเยอะที่สุด
```
[1] Paperback
Levels: Boxed Set - Hardcover ebook Hardcover Kindle Edition Paperback Unknown Binding
```

- สร้าง book_type_frequency เก็บ data.frame ของ table dataset$type (จะได้ Type กับ Freq)
- เลือกข้อมูล Type ที่มีค่า Freq สูงที่สุด (book_type_frequency$Freq == max(book_type_frequency$Freq))

## Part 4: Visualization with GGplot2
### 1.) Rating & Price Relations

```
scat_plot <- dataset %>% ggplot(aes(x=Rating,y=Price)) + ggtitle("Rating and Price Relaltions") + geom_point(aes(color=Type))
scat_plot
```
Result :

![Graph 1](graph/rating%20and%20price%20relations.jpg)

### 2.) Average rating of each type of book
```
rating_plot <- dataset %>% mutate(Type) %>%  group_by(Type) %>% summarise(Rating = mean(Rating))
rating_plot <- rating_plot %>% ggplot(aes(x = Type , y = Rating ,fill=Type)) + geom_point(aes(color=Type))
rating_plot
```
Result :

![Graph 2](graph/Average%20rating%20of%20each%20type%20of%20book.png)
