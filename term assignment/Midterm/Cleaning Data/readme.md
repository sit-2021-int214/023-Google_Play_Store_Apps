# Cleaning Data
## Step 1: Remove Duplicate Data && remove Free Applications;
ตรวจสอบดูว่ามีข้อมูลซ้ำหรือไป
```
ggp %>% filter(duplicated(ggp))
```

Result:

```
...
57 Free     0     Mature 17+        Dating    August 2, 2018 Varies with device Varies with device
58 Free     0     Mature 17+        Dating     July 18, 2018              6.3.7         5.0 and up
59 Free     0     Mature 17+        Dating     July 17, 2018               2.45         4.1 and up
60 Free     0     Mature 17+        Dating     June 25, 2018              4.1.2       4.0.3 and up
61 Free     0     Mature 17+        Dating     July 24, 2018            3.8.75a       4.0.3 and up
62 Free     0     Mature 17+        Dating     July 25, 2018              1.6.1         4.4 and up
63 Free     0     Mature 17+        Dating    August 1, 2018 Varies with device Varies with device
64 Free     0     Mature 17+        Dating     July 31, 2018             4.17.2         4.1 and up
65 Free     0     Mature 17+        Dating     June 20, 2018              2.0.5       4.0.3 and up
66 Free     0           Teen        Dating  November 6, 2017                1.0       4.0.3 and up
67 Free     0       Everyone        Dating     July 19, 2018              1.0.1         4.3 and up
68 Free     0     Mature 17+        Dating     July 15, 2018               4.20       4.0.3 and up
69 Free     0     Mature 17+        Dating     July 25, 2018              1.9.7         4.4 and up
70 Free     0     Mature 17+        Dating     June 19, 2018              1.0.4         4.4 and up
71 Free     0       Everyone        Dating     July 16, 2018                2.5       4.0.3 and up
72 Free     0     Mature 17+        Dating     July 24, 2018                1.0       4.0.3 and up
73 Free     0     Mature 17+        Dating     July 29, 2018              1.4.0         4.4 and up
74 Free     0     Mature 17+        Dating     July 23, 2018              5.2.9         4.1 and up
75 Free     0     Mature 17+        Dating     July 17, 2018              1.0.0         4.4 and up
76 Free     0     Mature 17+        Dating     July 16, 2018                8.2       4.0.3 and up
 [ reached 'max' / getOption("max.print") -- omitted 407 rows ]
```

จะเห็นว่ามีข้อมูลที่ซ้ำกัน 407 rows

ทำการลบข้อมูลที่ซ้ำออก
```
ggp <- ggp %>% distinct()
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
ggp$Installs <- parse_number(ggp$Installs)
```
- เปลี่ยนรีวิว จาก chr เป็นตัวเลข เพื่อนำไปใช้คำนวณต่อ
- เปลี่ยนจำนวนการติดตั้ง จาก chr เป็นตัวเลข เพื่อนำไปใช้คำนวณต่อ
- เปลี่ยนราคา จาก chr เป็นตัวเลข เพื่อนำไปใช้คำนวณต่อ
