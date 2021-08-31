# Assignment 2 (Group)
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Cat Dataset

1.) ค่าเฉลี่ยของ Bwt และ Hwt ของแมวแต่ละเพศ (F,M)
```{R}
library(MASS)
mean(cats$Bwt[cats$Sex == 'F']) 
mean(cats$Bwt[cats$Sex == 'M'])
mean(cats$Hwt[cats$Sex == 'F']) 
mean(cats$Hwt[cats$Sex == 'M'])
```
Description (1)
```
เรียกใช้ library ของ MASS เพื่อจะได้ใช้ dataset
ค่าเฉลี่ยของ Bwt ของแมวเพศเมีย =  2.359574
ค่าเฉลี่ยของ Bwt ของแมวเพศผู้ = 2.9
ค่าเฉลี่ยของ Hwt ของแมวเพศเมีย = 9.202128
ค่าเฉลี่ยของ Hwt ของแมวเพศผู้ = 11.32268
```
### Survey Dataset 
2.) ค่า Bwt ที่มีค่ามากที่สุดของแต่ละเพศ และค่าที่ซ้ำกันมากที่สุดของแต่ละเพศ
```{R}
library(DescTools) 
library(MASS)
max(cats$Bwt[cats$Sex == 'F']) #3
max(cats$Bwt[cats$Sex == 'M']) #3.9
Mode(cats$Bwt[cats$Sex == 'F']) #2.7,3.0 9
Mode(cats$Bwt[cats$Sex == 'M']) #2.3 12
```
Description (2)
```
เรียกใช้ library DescTools
เรียกใช้ library ของ MASS เพื่อจะได้ใช้ dataset
ใช้ max เพื่อหาค่ามาที่สุดจาก dataset cats คอลัมน์ Bwt ที่มีเพศ M และ F
ใช้ Mode ที่มาจาก library DescTools เพื่อเอาค่าที่ซ้ำกันและจำนวนที่ซ้ำกันออกมาทั้ง cats ที่มีเพศ F และ M 
```
3.) จากที่survey ส่วนใหญ่ใช้มือข้างใดเขียนหนังสือ
```{R}
library(MASS)
library(DescTools) 
Mode(factor(survey$W.Hnd),na.rm = TRUE) 
```
Description (3)
```
เรียกใช้ library DescTools
เรียกใช้ library ของ MASS เพื่อจะได้ใช้ dataset
ใช้ Mode ที่มาจาก library DescTools เพื่อดูว่าคนส่วนใหญ่ใช้มือข้างใดในการเขียนหนังสือ 
จะได้เป็น Right ที่มีฐานนิยมมากที่สุด
```
4.) หาค่าเฉลี่ยส่วนสูงของเพศชายและเพศหญิง ว่าเพศไหนมากกว่ากัน(เพศใดที่มีค่าเฉลี่ยส่วนสูงมาก)
```{R}
library(MASS)
mean(survey$Height[survey$Sex=='Male'],na.rm = TRUE)   
max(survey$Height[survey$Sex=='Female'],na.rm = TRUE)  
```
Description (4)
```
เรียกใช้ library ของ MASS เพื่อจะได้ใช้ dataset
ค่าเฉลี่ยของส่วนสูงเพศชาย = 178.826
ค่าเฉลี่ยของส่วนสูงเพศหญิง = 180.34
ดังนั้นเพศผญิง มีค่าเฉลี่ยส่วนสูงมากกว่าเพศชาย
ใช้ ,na.rm ไม่นำค่าที่เป็น NA มาคำนวณ
```
5.) มีจำนวนกี่คนที่ไม่เคยออกกำลังกาย
```{R}
library(MASS)
length(factor(survey$Exer[survey$Exer == 'None']))
```
Description (5)
```
เรียกใช้ library ของ MASS เพื่อจะได้ใช้ dataset
ใช้ length เพื่อดูข้อมูลทั้งหมดใน data column Exer
และนับจำนวนของคนที่ไม่เคยออกกำลังกาย(None)
```
6.) หาความถี่ของการสูบบุหรี่ กับ ไม่สูบบุหรี่ และข้อมูลความถี่อื่นๆของการสูบบุหรี่
```{R}
library(MASS)
summary(factor(survey$Smoke)) 
```
Description (6)
```
เรียกใช้ library ของ MASS เพื่อจะได้ใช้ dataset
เพื่อแสดงข้อมูลผู้สูบบุหรี่ กับ ไม่สูบบุหรี่ และแสดงข้อมูลอื่นๆ
จะได้ข้อมูลดังนี้
Heavy Never Occas Regul  NA's 
   11   189    19    17     1 
```

### Team: TusNo. 1
1. นายรพีพัฒน์ คล้ำจีน   StudentID: 63130500099
2. นายสุธีร์ วาปีทำ      StudentID: 63130500122
3. นายสุรวิช นาคแก้ว    StudentID: 63130500125
4. นายอมรพงษ์ ดวงฉวี   StudentID: 63130500131
