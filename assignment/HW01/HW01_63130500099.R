# Exercise 1
num <- c(10.4, 5.6, 3.1, 6.4, 21.7)
print(mean(num))   # 9.44  
print(sum(num))    # 47.2
print(median(num)) # 6.4
print(sd(num))     # 7.33846
print(var(num))    # 53.853

# Exercise 2
# List of Marvel movies (Order by Marvel Phase released)
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

# List of released year of Marvel movies
years <- c(2008,2008,2010,2011,2011,2012,2013,2013,2014,2014,2015,2015,2016,2016,
           2017,2017,2017,2017,2018,2018,2019,2019,2019,2021,2021,2021,2021)

Marvel_movies <- data.frame(names,years)     # เพราะว่าจะทำเป็นตารางเลยใช้เป็น Dataframe

Modes <- function(x) {
  ux <- unique(x)
  tab <- tabulate(match(x, ux))
  ux[tab == max(tab)]
}

#1
print(length(Marvel_movies$names)) # 27
#2
print(Marvel_movies$names[19])     # "Avengers: Infinity War"
#3
print(Modes(Marvel_movies$years))   # 2017 2021

Mode()

roll_two_dices <- function( ) {
  die1 <- sample(1:6, 1)
  die2 <- sample(1:6, 1)
  total <- die1 + die2
  print(total)
}
roll_two_dices()




