# NOTE: I assume that the csv files have been extracted to the current working folder

#test load the combined data set and view in RStudio

data <- read.csv("combined-data.csv", na.strings="NULL")

View(data)

#############################
#Catch the pink flam data exploration

#query 1
user_data <- read.csv("user-session.csv")

unique(user_data$platformType)

table(user_data$platformType) 

#query 2
adclick_data <- read.csv("ad-clicks.csv")

sort(table(adclick_data$adCategory),decreasing=TRUE)

#query 3
buyclick_data <- read.csv("buy-clicks.csv")

sort(table(buyclick_data$buyId),decreasing=TRUE)

#query 4

team_data <- read.csv("team-assignments.csv")
table(team_data$team)
mean(table(team_data$team))


######################
#aggregate calcs

#part 1: simple aggregation

gameclicks_data <- read.csv("game-clicks.csv")

#sum(complete.cases(gameclicks_data)==FALSE)

mean(gameclicks_data$isHit)

buyclick_data <- read.csv("buy-clicks.csv")

min(buyclick_data$price)
max(buyclick_data$price)
sum(buyclick_data$price)

#part 2: Filtering and aggregation

user_data <- read.csv("user-session.csv")

mean(user_data[user_data$platformType=="windows" & user_data$sessionType=="end",]$teamLevel)

mean(user_data[user_data$platformType=="iphone" | user_data$platformType=="mac",]$teamLevel)



