#bar chart
#This is a stacked bar chart that shows the composition of Olympic medals that each country won
#I picked a bar chart because it can have more variables than a pie chart
#and because it nicely displays the medal types all at once
library(googleVis)
libr
oly = read.csv("/Users/eaalthoff/Documents/EdgewoodSchoolWork/2021-2022/SpringSemester2022/CS305/Data/Tokyo 2021 dataset v4.csv", header = TRUE)
head(oly)
#changing the col names because they have spaces
colnames(oly) <- c("Rank", "TeamNOC", "GoldMedal", "SilverMedal", "BronzeMedal", "Total", "RankByTotal", "NOCCode", "Continent")
head(oly)

#note: I'm using a subset because there's lots of results, which makes the chart cluttered
oly=oly[1:10,]
barpt = gvisBarChart(oly, xvar = "TeamNOC", yvar = c("BronzeMedal", "SilverMedal", "GoldMedal"), options = list(orientation = "horizontal", width = 1400, height = 500,title = "Tokyo Olympics 2021 Total Medals per Continent",hAxis = "{title :'Country',titleTextStyle :{color:'blue'}}",vAxis = "{title : 'Number of Medals',titleTextStyle :{color: 'blue'}}",bar = "{groupWidth: '100%'}", isStacked=TRUE, colors="['brown', 'silver', 'gold']"))
plot(barpt)

