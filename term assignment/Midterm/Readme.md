# Answer to all defined question
## Questions
1. [หาจำนวนของแอปพลิเคชั่นที่มี Rating มากกว่า 4.5 เทียบกับแอปพลิเคชั่นทั้งหมด](https://github.com/sit-2021-int214/023-Google_Play_Store_Apps/tree/main/term%20assignment/Midterm#question-1-%E0%B8%AB%E0%B8%B2%E0%B8%A2%E0%B8%AD%E0%B8%94%E0%B8%94%E0%B8%B2%E0%B8%A7%E0%B8%99%E0%B9%8C%E0%B9%82%E0%B8%AB%E0%B8%A5%E0%B8%94%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B9%81%E0%B8%AD%E0%B8%9B%E0%B8%9E%E0%B8%A5%E0%B8%B4%E0%B9%80%E0%B8%84%E0%B8%8A%E0%B8%B1%E0%B9%88%E0%B8%99%E0%B8%97%E0%B8%B5%E0%B9%88%E0%B8%A1%E0%B8%B5-rating-%E0%B8%A1%E0%B8%B2%E0%B8%81%E0%B8%81%E0%B8%A7%E0%B9%88%E0%B8%B2-45-)
2. [Rating ของแอปพลิเคชั่นที่มีราคา](https://github.com/sit-2021-int214/023-Google_Play_Store_Apps/tree/main/term%20assignment/Midterm#question-2-ating-%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B9%81%E0%B8%AD%E0%B8%9B%E0%B8%9E%E0%B8%A5%E0%B8%B4%E0%B9%80%E0%B8%84%E0%B8%8A%E0%B8%B1%E0%B9%88%E0%B8%99%E0%B8%97%E0%B8%B5%E0%B9%88%E0%B8%A1%E0%B8%B5%E0%B8%A3%E0%B8%B2%E0%B8%84%E0%B8%B2-)
3. [หาแอปพลิเคชั่นที่มียอดรีวิวสูงสุดของกลุ่มฟรีและที่มีราคา](https://github.com/sit-2021-int214/023-Google_Play_Store_Apps/tree/main/term%20assignment/Midterm#question-3-%E0%B8%AB%E0%B8%B2%E0%B9%81%E0%B8%AD%E0%B8%9B%E0%B8%9E%E0%B8%A5%E0%B8%B4%E0%B9%80%E0%B8%84%E0%B8%8A%E0%B8%B1%E0%B9%88%E0%B8%99%E0%B8%97%E0%B8%B5%E0%B9%88%E0%B8%A1%E0%B8%B5%E0%B8%A2%E0%B8%AD%E0%B8%94%E0%B8%A3%E0%B8%B5%E0%B8%A7%E0%B8%B4%E0%B8%A7%E0%B8%AA%E0%B8%B9%E0%B8%87%E0%B8%AA%E0%B8%B8%E0%B8%94%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B8%81%E0%B8%A5%E0%B8%B8%E0%B9%88%E0%B8%A1%E0%B8%9F%E0%B8%A3%E0%B8%B5%E0%B9%81%E0%B8%A5%E0%B8%B0%E0%B8%97%E0%B8%B5%E0%B9%88%E0%B8%A1%E0%B8%B5%E0%B8%A3%E0%B8%B2%E0%B8%84%E0%B8%B2)
4. [หาฐานนิยมของ Genres ?](https://github.com/sit-2021-int214/023-Google_Play_Store_Apps/tree/main/term%20assignment/Midterm#question-4-%E0%B8%AB%E0%B8%B2%E0%B8%90%E0%B8%B2%E0%B8%99%E0%B8%99%E0%B8%B4%E0%B8%A2%E0%B8%A1%E0%B8%82%E0%B8%AD%E0%B8%87-genres-)
## Question 1: หาจำนวนของแอปพลิเคชั่นที่มี Rating มากกว่า 4.5 เทียบกับแอปพลิเคชั่นทั้งหมด ?
```
count(ggp %>% filter(Rating >= 4.5))
count(ggp)
```
Result:

```
2956
10841
```
- Summary <br>
แอปพลิเคชั่นที่มี Rating มากกว่า 4.5 มีเพียง 2956 จาก 10841 แอปพลิเคชั่นตัวอย่าง
## Question 2: ค่าเฉลี่ย Rating ของแอปพลิเคชั่นที่มีราคา ?
```

```
Result:

```
```
- Summary <br>
อธิบายค่าาาาาาาาาาาาา
## Question 3: หาแอปพลิเคชั่นที่มียอดรีวิวสูงสุดของกลุ่มฟรีและที่มีราคา?
```
ggp %>% filter(Reviews == max(ggp %>% filter(Price == 0) %>% select(Reviews),na.rm = TRUE)) %>% select(App, Reviews)
```
Result:
```
       App  Reviews
1 Facebook 78158306
```
```
ggp %>% filter(Reviews == max(ggp %>% filter(Price != 0) %>% select(Reviews),na.rm = TRUE)) %>% select(App, Reviews)
```
Result:
```
        App Reviews
1 Minecraft 2376564
```
- Summary <br>
แอปพลิเคชั่นกลุ่มฟรีที่มียอดรีวิวสูงสุดคิอ Facebook ส่วนแอปพลิเคชั่นเสียเงินที่มียอดรีวิวสูงสุดคือเกม Minecraft

## Question 4: หาฐานนิยมของ Genres ?
```
my_mode <- function(x) {                     # Create mode function 
  unique_x <- unique(x)
  tabulate_x <- tabulate(match(x, unique_x))
  unique_x[tabulate_x == max(tabulate_x)]
}

my_mode(ggp$Genres)
Mode(ggp$Genres)
```
Result:

```
Tools
842
```
- Summary <br>
Genre แอปพลิเคชั่นที่มีจำนวนเยอะที่สุดคือ Tools มีจำนวนแอปพลิเคชั่น 842

