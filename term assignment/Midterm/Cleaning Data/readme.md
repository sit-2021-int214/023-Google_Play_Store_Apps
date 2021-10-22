# Cleaning Data
## Step 0 : from (Loading Library and dataset)[https://github.com/sit-2021-int214/023-Google_Play_Store_Apps/tree/main/term%20assignment/Midterm/Original%20Data#loading-library-and-dataset]
## Step 1: Remove Duplicate Data && remove Free Applications;
ตรวจสอบดูว่ามีข้อมูลซ้ำหรือไป
```
ggp %>% filter(duplicated(ggp)) %>% head(10)
```

Result:

```
                            App Category Rating Reviews               Size    Installs Type Price Content.Rating   Genres      Last.Updated        Current.Ver        Android.Ver
1  Quick PDF Scanner + OCR FREE BUSINESS    4.2   80805 Varies with device  5,000,000+ Free     0       Everyone Business February 26, 2018 Varies with device       4.0.3 and up
2                           Box BUSINESS    4.2  159872 Varies with device 10,000,000+ Free     0       Everyone Business     July 31, 2018 Varies with device Varies with device
3            Google My Business BUSINESS    4.4   70991 Varies with device  5,000,000+ Free     0       Everyone Business     July 24, 2018   2.19.0.204537701         4.4 and up
4           ZOOM Cloud Meetings BUSINESS    4.4   31614                37M 10,000,000+ Free     0       Everyone Business     July 20, 2018     4.1.28165.0716         4.0 and up
5     join.me - Simple Meetings BUSINESS    4.0    6989 Varies with device  1,000,000+ Free     0       Everyone Business     July 16, 2018          4.3.0.508         4.4 and up
6                           Box BUSINESS    4.2  159872 Varies with device 10,000,000+ Free     0       Everyone Business     July 31, 2018 Varies with device Varies with device
7                      Zenefits BUSINESS    4.2     296                14M     50,000+ Free     0       Everyone Business     June 15, 2018              3.2.1         4.1 and up
8                    Google Ads BUSINESS    4.3   29313                20M  5,000,000+ Free     0       Everyone Business     July 30, 2018             1.12.0       4.0.3 and up
9            Google My Business BUSINESS    4.4   70991 Varies with device  5,000,000+ Free     0       Everyone Business     July 24, 2018   2.19.0.204537701         4.4 and up
10                        Slack BUSINESS    4.4   51507 Varies with device  5,000,000+ Free     0       Everyone Business    August 2, 2018 Varies with device Varies with device
```
ดูว่ามีจำนวนกี่ตัว
```
ggp %>% filter(duplicated(ggp)) %>% count()
```

Result:
```
    n
1 483
```

จะเห็นว่ามีข้อมูลที่ซ้ำกัน 483 rows

ทำการลบข้อมูลที่ซ้ำออก
```
## remove duplicated
ggp <- ggp %>% distinct(App,Category, .keep_all = TRUE)
```

ตรวจสอบซ้ำอีกรอบ
```
ggp %>% filter(duplicated(ggp))
```

Result:

```
[1] App            Category       Rating         Reviews        Size           Installs       Type          
 [8] Price          Content.Rating Genres         Last.Updated   Current.Ver    Android.Ver   
<0 rows> (or 0-length row.names)
```
จะเห็นว่าไม่มีข้อมูลที่ซ้ำกันแล้ว


## Step 2: Change Reviews, Price, Installs datatype from chr to numeric
```
ggp$Reviews <- ggp$Reviews %>% as.numeric
ggp$Price <- parse_number(ggp$Price)
```
- เปลี่ยนรีวิว จาก chr เป็นตัวเลข เพื่อนำไปใช้คำนวณต่อ
- เปลี่ยนราคา จาก chr เป็นตัวเลข เพื่อนำไปใช้คำนวณต่อ

## Step 3: Export to CSV file
```
write.csv(ggp,"./CleaningData.csv")
```
- นำไฟล์ที่ทำการ Cleaning เสร็จแล้วมา Export เป็นไฟล์ CSV
