#installing google API package 'googleVis'
install.packages("googleVis")
library(googleVis)
suppressPackageStartupMessages (library (googleVis))

#reading CSV file
GMedalsChart = read.csv("/Users/edgarmolinares/Desktop/Edgewood School Work/Spring 2022/Data Analytics/data/Tokyo 2021 dataset v4.csv", header = TRUE, sep =",")
head(GMedalsChart)

#creating bubble chart
bub1 = gvisBubbleChart(GMedalsChart, idvar = "NOCCode", xvar = "Gold.Medal",
        yvar = "Silver.Medal", sizevar = "Total",colorvar = "Total",
        options = list(legend = "none",width = 1000, height = 800,title =" Total Medals by Team", sizeAxis ="{maxSize : 20, minSize :0.5}",vAxis = "{title : 'Silver Medals'}",hAxis= "{title : 'Gold Medals'}"))

#plotting chart
plot(bub1)
