# Explore Data
Dataset from [Google_Play_Store_Apps_Original.csv](https://raw.githubusercontent.com/sit-2021-int214/023-Google_Play_Store_Apps/main/term%20assignment/Midterm/Original%20Data/Google_Play_Store_Apps_Original.csv)

## [Loading Library and dataset step](./../Original%20Data#loading-library-and-dataset)

## How many observation of this dataset (before cleaning) ?

```
glimpse(ggp)
```

Result:

```
Rows: 10,841
Columns: 13
$ App            <chr> "Photo Editor & Candy Camera & Grid & ScrapBook", "Coloring book moana", "U Launcher Lite โ\200“ ~
$ Category       <chr> "ART_AND_DESIGN", "ART_AND_DESIGN", "ART_AND_DESIGN", "ART_AND_DESIGN", "ART_AND_DESIGN", "ART_AN~
$ Rating         <dbl> 4.1, 3.9, 4.7, 4.5, 4.3, 4.4, 3.8, 4.1, 4.4, 4.7, 4.4, 4.4, 4.2, 4.6, 4.4, 3.2, 4.7, 4.5, 4.3, 4.~
$ Reviews        <chr> "159", "967", "87510", "215644", "967", "167", "178", "36815", "13791", "121", "13880", "8788", "~
$ Size           <chr> "19M", "14M", "8.7M", "25M", "2.8M", "5.6M", "19M", "29M", "33M", "3.1M", "28M", "12M", "20M", "2~
$ Installs       <chr> "10,000+", "500,000+", "5,000,000+", "50,000,000+", "100,000+", "50,000+", "50,000+", "1,000,000+~
$ Type           <chr> "Free", "Free", "Free", "Free", "Free", "Free", "Free", "Free", "Free", "Free", "Free", "Free", "~
$ Price          <chr> "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0~
$ Content.Rating <chr> "Everyone", "Everyone", "Everyone", "Teen", "Everyone", "Everyone", "Everyone", "Everyone", "Ever~
$ Genres         <chr> "Art & Design", "Art & Design;Pretend Play", "Art & Design", "Art & Design", "Art & Design;Creati~
$ Last.Updated   <chr> "January 7, 2018", "January 15, 2018", "August 1, 2018", "June 8, 2018", "June 20, 2018", "March ~
$ Current.Ver    <chr> "1.0.0", "2.0.0", "1.2.4", "Varies with device", "1.1", "1.0", "1.1", "6.1.61.1", "2.9.2", "2.8",~
$ Android.Ver    <chr> "4.0.3 and up", "4.0.3 and up", "4.0.3 and up", "4.2 and up", "4.4 and up", "2.3 and up", "4.0.3 ~
```

Explain

จะเห็นว่ามีข้อมูลอยู่ 10,841 observation
และมีตัวแปร 13 คอลัมน์
- APP(chr) ตัวแปรชื่อแอปพลิเคชั่น
- Category(chr) หมวดหมูแอปพลิเคชั่น
- Rating(dbl) คะแนน
- Reviews(chr) จำนวนการวิจารณ์
- Size(chr) ขนาด
- Installs(chr) จำนวนการติดตั้งแอปพลิเคชั่น(ครั้ง)
- Type(chr) ลักษณะแอปพลิเคชั่น(ไม่มีค่าใช้จ่าย, มีค่าใช้จ่าย)
- Price(chr) ราคา
- Content.Rating(chr) ระดับความเหมาะสมของผู้ใช้
- Genres(chr) ประเภทแอปพลิเคชั่น
- Last.Updated(chr) อัปเดตครั้งล่าสุด
- Current.Ver(chr) เวอร์ชั่นปัจจุบัน
- Android.Ver(chr) Android เวอร์ชั่น

## Data Analyze
ลองหยิบแอพที่มีชื่อ ROBLOX ออกมาดู
```
ggp %>% filter(App=="ROBLOX")
```
Result:
```
     App Category Rating Reviews Size     Installs Type Price Content.Rating                       Genres  Last.Updated  Current.Ver Android.Ver
1 ROBLOX     GAME    4.5 4447388  67M 100,000,000+ Free     0   Everyone 10+ Adventure;Action & Adventure July 31, 2018 2.347.225742  4.1 and up
2 ROBLOX     GAME    4.5 4447346  67M 100,000,000+ Free     0   Everyone 10+ Adventure;Action & Adventure July 31, 2018 2.347.225742  4.1 and up
3 ROBLOX     GAME    4.5 4448791  67M 100,000,000+ Free     0   Everyone 10+ Adventure;Action & Adventure July 31, 2018 2.347.225742  4.1 and up
4 ROBLOX     GAME    4.5 4449882  67M 100,000,000+ Free     0   Everyone 10+ Adventure;Action & Adventure July 31, 2018 2.347.225742  4.1 and up
5 ROBLOX     GAME    4.5 4449910  67M 100,000,000+ Free     0   Everyone 10+ Adventure;Action & Adventure July 31, 2018 2.347.225742  4.1 and up
6 ROBLOX   FAMILY    4.5 4449910  67M 100,000,000+ Free     0   Everyone 10+ Adventure;Action & Adventure July 31, 2018 2.347.225742  4.1 and up
7 ROBLOX   FAMILY    4.5 4450855  67M 100,000,000+ Free     0   Everyone 10+ Adventure;Action & Adventure July 31, 2018 2.347.225742  4.1 and up
8 ROBLOX   FAMILY    4.5 4450890  67M 100,000,000+ Free     0   Everyone 10+ Adventure;Action & Adventure July 31, 2018 2.347.225742  4.1 and up
9 ROBLOX   FAMILY    4.5 4443407  67M 100,000,000+ Free     0   Everyone 10+ Adventure;Action & Adventure July 31, 2018 2.347.225742  4.1 and up
```
Explain
จะเห็นว่ามีหลาย row ที่ App ชื่อว่า ROBLOX ซึ่งแตกต่างกันที่ Reviews กับ Category
หมายความว่า App 1 App อาจจะอยู่ได้หลาย Category เพราะฉะนั้นเราจะไม่ clean ให้ App อยู่ใน Category เดียว
แต่จะทำให้ App ชื่อเดียวกัน อยุ่ได้หลาย Category แต่จะมีชื่อเดียวกันอยู่ได้แค่ตัวเดียวต่อ 1 Category
