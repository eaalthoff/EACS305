#pie chart
#This pie chart shows the total Olympic medal composition for the top 6 countries
#This gives the information more focus than it would in the bar chart
library(googleVis)
library(datasets)
library(dplyr)
library(plotrix)

oly = read.csv("/Users/eaalthoff/Documents/EdgewoodSchoolWork/2021-2022/SpringSemester2022/CS305/Data/Tokyo 2021 dataset v4.csv", header = TRUE)
#changing col names because they have spaces
colnames(oly) <- c("Rank", "TeamNOC", "GoldMedal", "SilverMedal", "BronzeMedal", "Total", "RankByTotal", "NOCCode", "Continent")
head(oly)

#getting just the information I want
oly=oly[1:6,]
head(oly)
MedalTotal = subset(oly, select = c(Total))
head(MedalTotal)
medalCount=c(113, 88, 58, 65, 71, 46)

#making pie percent for labels
piepercent<- round(100*medalCount/sum(medalCount), 1)

pie(medalCount,col = rainbow(length(medalCount)), radius = 1, init.angle = 90, clockwise = TRUE, labels =piepercent, main = "Composition of Medals from US")
legend("topright", c("United States of America","People's Republic of China","Japan", "Great Britain", "ROC", "Australia"), cex=0.5, fill = rainbow(length(medalCount)))