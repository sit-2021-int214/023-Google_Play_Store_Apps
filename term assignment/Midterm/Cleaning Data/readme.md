# Cleaning Data
## Step 1: Remove Duplicate Data && remove Free Applications;
```
ggp %>% filter(duplicated(ggp))
ggp <- distinct(ggp)
ggp <- ggp %>% distinct()
ggp %>%  filter(Price != 0)  %>% select(App,Price)
```
- เอาข้อมูลที่ซ้ํากันออก
- เอาแอปพลิเคชันฟรีออก
## Step 2: Change Reviews, Price, Installs datatype from chr to numeric
```
ggp$Reviews <- ggp$Reviews %>% as.numeric
ggp$Price <- parse_number(ggp$Price)
ggp$Installs <- parse_number(ggp$Installs)
```
- เปลี่ยนรีวิว, ราคา จาก chr เป็นตัวเลข เพื่อนำไปใช้คำนวณต่อ
- จำนวนการติดตั้ง จาก chr เป็นตัวเลข เพื่อนำไปใช้คำนวณต่อ
