# R-Assignment 4

**Created by Name-Surname (ID: 63130500122)**

Choose Dataset:
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
library(name)
library(readr)
library(ggplot2)
library(stringr)

# Dataset
data <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")
```

In this dataset has
```
#Show Date
glimpse(data)
```
All Result
```
Rows: 9,800
Columns: 18
$ `Row ID`        <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 2~
$ `Order ID`      <chr> "CA-2017-152156", "CA-2017-152156", "CA-2017-138688", "US-2016-108966", "US-2016-108966", "CA-20~
$ `Order Date`    <chr> "08/11/2017", "08/11/2017", "12/06/2017", "11/10/2016", "11/10/2016", "09/06/2015", "09/06/2015"~
$ `Ship Date`     <chr> "11/11/2017", "11/11/2017", "16/06/2017", "18/10/2016", "18/10/2016", "14/06/2015", "14/06/2015"~
$ `Ship Mode`     <chr> "Second Class", "Second Class", "Second Class", "Standard Class", "Standard Class", "Standard Cl~
$ `Customer ID`   <chr> "CG-12520", "CG-12520", "DV-13045", "SO-20335", "SO-20335", "BH-11710", "BH-11710", "BH-11710", ~
$ `Customer Name` <chr> "Claire Gute", "Claire Gute", "Darrin Van Huff", "Sean O'Donnell", "Sean O'Donnell", "Brosina Ho~
$ Segment         <chr> "Consumer", "Consumer", "Corporate", "Consumer", "Consumer", "Consumer", "Consumer", "Consumer",~
$ Country         <chr> "United States", "United States", "United States", "United States", "United States", "United Sta~
$ City            <chr> "Henderson", "Henderson", "Los Angeles", "Fort Lauderdale", "Fort Lauderdale", "Los Angeles", "L~
$ State           <chr> "Kentucky", "Kentucky", "California", "Florida", "Florida", "California", "California", "Califor~
$ `Postal Code`   <dbl> 42420, 42420, 90036, 33311, 33311, 90032, 90032, 90032, 90032, 90032, 90032, 90032, 28027, 98103~
$ Region          <chr> "South", "South", "West", "South", "South", "West", "West", "West", "West", "West", "West", "Wes~
$ `Product ID`    <chr> "FUR-BO-10001798", "FUR-CH-10000454", "OFF-LA-10000240", "FUR-TA-10000577", "OFF-ST-10000760", "~
$ Category        <chr> "Furniture", "Furniture", "Office Supplies", "Furniture", "Office Supplies", "Furniture", "Offic~
$ `Sub-Category`  <chr> "Bookcases", "Chairs", "Labels", "Tables", "Storage", "Furnishings", "Art", "Phones", "Binders",~
$ `Product Name`  <chr> "Bush Somerset Collection Bookcase", "Hon Deluxe Fabric Upholstered Stacking Chairs, Rounded Bac~
$ Sales           <dbl> 261.9600, 731.9400, 14.6200, 957.5775, 22.3680, 48.8600, 7.2800, 907.1520, 18.5040, 114.9000, 17~

```
Summary Data
```
#show Summary Data
summary(books)
```
Result
```
 Row ID       Order ID          Order Date         Ship Date          Ship Mode         Customer ID       
 Min.   :   1   Length:9800        Length:9800        Length:9800        Length:9800        Length:9800       
 1st Qu.:2451   Class :character   Class :character   Class :character   Class :character   Class :character  
 Median :4900   Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character  
 Mean   :4900                                                                                                 
 3rd Qu.:7350                                                                                                 
 Max.   :9800                                                                                                 
                                                                                                              
 Customer Name        Segment            Country              City              State            Postal Code   
 Length:9800        Length:9800        Length:9800        Length:9800        Length:9800        Min.   : 1040  
 Class :character   Class :character   Class :character   Class :character   Class :character   1st Qu.:23223  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character   Median :58103  
                                                                                                Mean   :55273  
                                                                                                3rd Qu.:90008  
                                                                                                Max.   :99301  
                                                                                                NA's   :11     
    Region           Product ID          Category         Sub-Category       Product Name           Sales          
 Length:9800        Length:9800        Length:9800        Length:9800        Length:9800        Min.   :    0.444  
 Class :character   Class :character   Class :character   Class :character   Class :character   1st Qu.:   17.248  
 Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character   Median :   54.490  
                                                                                                Mean   :  230.769  
                                                                                                3rd Qu.:  210.605  
                                                                                                Max.   :22638.480                                                                                
```
Missing values in Data
```
#How Many missing values in Data
table(is.na(data))
```
Result
```
 FALSE   TRUE 
176389     11 
```
## Part 2: Learning function from Tidyverse

- Function `select()` from package [dplyr](https://dplyr.tidyverse.org/articles/dplyr.html#select-columns-with-select)). It using for select columns

```
#Select()
data %>% select(Country,City,`Product ID`)
```
- Result
```
# A tibble: 9,800 x 3
   Country       City            `Product ID`   
   <chr>         <chr>           <chr>          
 1 United States Henderson       FUR-BO-10001798
 2 United States Henderson       FUR-CH-10000454
 3 United States Los Angeles     OFF-LA-10000240
 4 United States Fort Lauderdale FUR-TA-10000577
 5 United States Fort Lauderdale OFF-ST-10000760
 6 United States Los Angeles     FUR-FU-10001487
 7 United States Los Angeles     OFF-AR-10002833
 8 United States Los Angeles     TEC-PH-10002275
 9 United States Los Angeles     OFF-BI-10003910
10 United States Los Angeles     OFF-AP-10002892
# ... with 9,790 more rows
```
- Function `group_by()` from package [dplyr](https://dplyr.tidyverse.org/reference/group_by.html)). It using for group data
```
#Group_by()
data %>% group_by(`Sub-Category`)
```
- Result
```
# A tibble: 9,800 x 18
# Groups:   Sub-Category [17]
   `Row ID` `Order ID`     `Order Date` `Ship Date` `Ship Mode`    `Customer ID`
      <dbl> <chr>          <chr>        <chr>       <chr>          <chr>        
 1        1 CA-2017-152156 08/11/2017   11/11/2017  Second Class   CG-12520     
 2        2 CA-2017-152156 08/11/2017   11/11/2017  Second Class   CG-12520     
 3        3 CA-2017-138688 12/06/2017   16/06/2017  Second Class   DV-13045     
 4        4 US-2016-108966 11/10/2016   18/10/2016  Standard Class SO-20335     
 5        5 US-2016-108966 11/10/2016   18/10/2016  Standard Class SO-20335     
 6        6 CA-2015-115812 09/06/2015   14/06/2015  Standard Class BH-11710     
 7        7 CA-2015-115812 09/06/2015   14/06/2015  Standard Class BH-11710     
 8        8 CA-2015-115812 09/06/2015   14/06/2015  Standard Class BH-11710     
 9        9 CA-2015-115812 09/06/2015   14/06/2015  Standard Class BH-11710     
10       10 CA-2015-115812 09/06/2015   14/06/2015  Standard Class BH-11710     
# ... with 9,790 more rows, and 12 more variables: Customer Name <chr>,
#   Segment <chr>, Country <chr>, City <chr>, State <chr>, Postal Code <dbl>,
#   Region <chr>, Product ID <chr>, Category <chr>, Sub-Category <chr>,
#   Product Name <chr>, Sales <dbl>
```

- Function `arrange()` from package [dplyr](https://dplyr.tidyverse.org/reference/arrange.html)). It using for orders the rows of a data frame by the values of selected columns.

```
#Arrange()
data %>% count(Region) %>% group_by(Region) %>% rename(`totalsales` = n) %>%arrange(`totalsales`)
```
- Result
```
# A tibble: 4 x 2
# Groups:   Region [4]
  Region  totalsales
  <chr>        <int>
1 South         1598
2 Central       2277
3 East          2785
4 West          3140
```


## Part 3: Transform data with dplyr and finding insight the data

### 1.)Find Customer ID starting with "TB"?

```
#1
data %>% filter(str_detect(`Customer ID`, "^TB"))
```

Result:

```
# A tibble: 131 x 18
   `Row ID` `Order ID`     `Order Date` `Ship Date` `Ship Mode`    `Customer ID`
      <dbl> <chr>          <chr>        <chr>       <chr>          <chr>        
 1       28 US-2016-150630 17/09/2016   21/09/2016  Standard Class TB-21520     
 2       29 US-2016-150630 17/09/2016   21/09/2016  Standard Class TB-21520     
 3       30 US-2016-150630 17/09/2016   21/09/2016  Standard Class TB-21520     
 4       31 US-2016-150630 17/09/2016   21/09/2016  Standard Class TB-21520     
 5       32 US-2016-150630 17/09/2016   21/09/2016  Standard Class TB-21520     
 6       33 US-2016-150630 17/09/2016   21/09/2016  Standard Class TB-21520     
 7       34 US-2016-150630 17/09/2016   21/09/2016  Standard Class TB-21520     
 8       56 CA-2017-111682 17/06/2017   18/06/2017  First Class    TB-21055     
 9       57 CA-2017-111682 17/06/2017   18/06/2017  First Class    TB-21055     
10       58 CA-2017-111682 17/06/2017   18/06/2017  First Class    TB-21055     
# ... with 121 more rows, and 12 more variables: Customer Name <chr>, Segment <chr>,
#   Country <chr>, City <chr>, State <chr>, Postal Code <dbl>, Region <chr>,
#   Product ID <chr>, Category <chr>, Sub-Category <chr>, Product Name <chr>,
#   Sales <dbl>

```
//Explain

-  Use `filter()` to find Customer ID.
-  Use str_detect from library(stringr).
- `str_detect()` is return TRUE or FALSE based on whether a given text or pattern is detected in the data or not.
- `^` meaning is start with...

### 2.)Find City has total sales more than 100000?

```
#2
  data %>% 
  group_by(City) %>% 
  summarise(totalsales = sum(Sales)) %>%
  filter(totalsales > 100000) %>%
  arrange(desc(totalsales))
```

Result:

```
# A tibble: 5 x 2
  City          totalsales
  <chr>              <dbl>
1 New York City    252463.
2 Los Angeles      173420.
3 Seattle          116106.
4 San Francisco    109041.
5 Philadelphia     108842.

```
//Explain

-  Use `group_by()` to group city.
-  Use `summarise()` to create totalsales for sum of sales in either city.
-  Use `filter()` to Compare totalsales must more than 100000.
-  Use `arrange()` to sorting totalsales.


### 3.)Find Customer name and id who buy minimal purchase?

```
#3
  data %>%
  select(`Customer Name`,`Customer ID`) %>%
  filter(data$Sales == min(data$Sales))

```

Result:

```
# A tibble: 1 x 2
  `Customer Name`  `Customer ID`
  <chr>            <chr>        
1 Zuschuss Carroll ZC-21910  
```
//Explain

-  Use `select()` to show Customer Name and Customer ID.
-  Use `filter()` and `min()` to find customer who buy minimal.

### 4.)Find total of each Segment and sort by ascending?

```
#4
  data %>% 
  count(Segment) %>% 
  group_by(Segment) %>% 
  rename(totalsegment = n) %>%
  arrange(totalsegment)
```

Result:

```
# A tibble: 3 x 2
# Groups:   Segment [3]
  Segment     totalsegment
  <chr>              <int>
1 Home Office         1746
2 Corporate           2953
3 Consumer            5101
```
//Explain

-  Use `count()` to count segment.
-  Use `group_by()` to group each segment.
-  Use `rename()` to rename to totalsegment.
-  Use `arrange()` to sorting totalsegment.

### 5.)Find Product Name Prduct ID sent on the 17/06/2017

```
#5
  data %>%
  select(`Product Name`,`Product ID`,`Ship Date`) %>%
  filter(`Ship Date` == "17/06/2017")
```

Result:

```
# A tibble: 13 x 3
   `Product Name`                                                                  `Product ID`    `Ship Date`
   <chr>                                                                           <chr>           <chr>      
 1 "Newell 326"                                                                    OFF-AR-10001545 17/06/2017 
 2 "GE General Purpose, Extra Long Life, Showcase & Floodlight Incandescent Bulbs" FUR-FU-10000206 17/06/2017 
 3 "Logitech ClearChat Comfort/USB Headset H390"                                   TEC-AC-10001013 17/06/2017 
 4 "Newell 346"                                                                    OFF-AR-10002255 17/06/2017 
 5 "Computer Printout Index Tabs"                                                  OFF-BI-10003784 17/06/2017 
 6 "GBC Wire Binding Combs"                                                        OFF-BI-10001617 17/06/2017 
 7 "Stacking Tray, Side-Loading, Legal, Smoke"                                     FUR-FU-10004415 17/06/2017 
 8 "Xerox 1978"                                                                    OFF-PA-10002160 17/06/2017 
 9 "Avery 51"                                                                      OFF-LA-10003148 17/06/2017 
10 "IBM Multi-Purpose Copy Paper, 8 1/2 x 11\", Case"                              OFF-PA-10000241 17/06/2017 
11 "Bionaire 99.97% HEPA Air Cleaner"                                              OFF-AP-10004036 17/06/2017 
12 "GBC Twin Loop Wire Binding Elements"                                           OFF-BI-10002082 17/06/2017 
13 "Verbatim Slim CD and DVD Storage Cases, 50/Pack"                               TEC-AC-10000521 17/06/2017 
```
//Explain

-  Use `select()` to show Product Name , Product ID and Ship Date.
-  Use `filter()` to check product sent on 17/06/2017.

### 6.)Find the products send with "First Class" and "Second Class" with Order ID start with "CA".

```
#6
  Productship <- data %>%
  select(`Product ID`,`Product Name`,`Order ID`,`Ship Mode`) %>%
  filter(`Ship Mode` == "First Class"|`Ship Mode` == "Second Class")
  
  Productship %>% filter(str_detect(`Order ID`,"^CA"))
  
  Productship
```

Result:

```
# A tibble: 3,403 x 4
   `Product ID`    `Product Name`                                                `Order ID`     `Ship Mode` 
   <chr>           <chr>                                                         <chr>          <chr>       
 1 FUR-BO-10001798 "Bush Somerset Collection Bookcase"                           CA-2017-152156 Second Class
 2 FUR-CH-10000454 "Hon Deluxe Fabric Upholstered Stacking Chairs, Rounded Back" CA-2017-152156 Second Class
 3 OFF-LA-10000240 "Self-Adhesive Address Labels for Typewriters by Universal"   CA-2017-138688 Second Class
 4 OFF-ST-10000107 "Fellowes Super Stor/Drawer"                                  CA-2015-167164 Second Class
 5 OFF-AR-10003056 "Newell 341"                                                  CA-2015-143336 Second Class
 6 TEC-PH-10001949 "Cisco SPA 501G IP Phone"                                     CA-2015-143336 Second Class
 7 OFF-BI-10002215 "Wilson Jones Hanging View Binder, White, 1\""                CA-2015-143336 Second Class
 8 FUR-CH-10002774 "Global Deluxe Stacking Chair, Gray"                          US-2018-156909 Second Class
 9 OFF-BI-10001634 "Wilson Jones Active Use Binders"                             CA-2017-121755 Second Class
10 TEC-AC-10003027 "Imation 8GB Mini TravelDrive USB 2.0 Flash Drive"            CA-2017-121755 Second Class
# ... with 3,393 more rows
```
//Explain

-  Create Productship variable to get Product ID , Product Name , Order ID and Ship Mode from Data.
-  Use `filter()` to filter ship mode "First Class" and "Second Class".
-  Use str_detect from library(stringr).
- `str_detect()` is return TRUE or FALSE based on whether a given text or pattern is detected in the data or not.
- `^` meaning is start with...


## Part 4: Visualization with GGplot2
### 1.) Graph show relation between City and Sales > 5000
```
#Graph1
  data %>%  
  filter(Sales > 5000)%>% 
  ggplot(aes(x=City,y=Sales)) + geom_point() 
```
Result:

![Graph 1](https://github.com/sit-2021-int214/023-Google_Play_Store_Apps/blob/main/assignment/HW04/HW04_63130500122/image/Rplot01.png)

### 2.) Graph show number of Ship Mode
```
#Graph2
  bar <- data %>% 
    ggplot(aes(x=`Ship Mode`)) + geom_bar(aes(color=`Ship Mode`))
  bar
```
Result:

![Graph 2](https://github.com/sit-2021-int214/023-Google_Play_Store_Apps/blob/main/assignment/HW04/HW04_63130500122/image/Rplot2.png)
