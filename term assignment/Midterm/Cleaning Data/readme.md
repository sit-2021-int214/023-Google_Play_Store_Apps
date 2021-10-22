# Cleaning Data
## Step 0: [Loading Library and dataset](./../Original%20Data#loading-library-and-dataset)
## Step 1: Remove Duplicate Data && remove Free Applications;
ตรวจสอบดูว่ามีข้อมูลที่ชื่อ App และ Category ซ้ำกันหรือไป
```
ggp %>% count(App,Category) %>% filter(n>1) %>% head(10)
```

Result:

```
                               App           Category n
1            10 Best Foods for You HEALTH_AND_FITNESS 2
2       1800 Contacts - Lens Store            MEDICAL 2
3       2017 EMRA Antibiotic Guide            MEDICAL 2
4     21-Day Meditation Experience HEALTH_AND_FITNESS 2
5          365Scores - Live Scores             SPORTS 2
6           420 BZ Budeze Delivery            MEDICAL 2
7                      8 Ball Pool               GAME 6
8     8fit Workouts & Meal Planner HEALTH_AND_FITNESS 2
9  95Live -SG#1 Live Streaming App             DATING 2
10         A Manual of Acupuncture            MEDICAL 2
```
จะเห็นว่ามีข้อมูลที่ซ้ำกันแต่เราหยิบมาดูแค่ 10 ตัว

ทำการลบข้อมูลที่ซ้ำกันทั้งชื่อ App และ Category ออก
```
## remove duplicated
ggp <- ggp %>% distinct(App,Category, .keep_all = TRUE)
```

ตรวจสอบซ้ำอีกรอบ
```
ggp %>% count(App,Category) %>% filter(n>1) %>% head(10)
```

Result:

```
  n
1 0
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
