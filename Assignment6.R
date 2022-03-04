#read the dataset, create a dataframe/tibble
df <- read_csv("/Users/eaalthoff/Downloads/starbucks_drinkMenu_expanded.csv")
head(df)
view(df)

#Rename the columns to remove unwanted characters
colnames(df) <- c("Beverage Category", "Beverage", "Beverage Prep", "Calories", "Total Fat", "Trans Fat","Saturated Fat", "Sodium", "Total Carbs", "Cholesterol", "Dietary Fibers", "Sugar", "Protein", "Vitamin A", "Vitamin C", "Iron", "Caffeine")
head(df)

#Change the encoding of the beverage_category and beverage columns to be ascii
df['Beverage'] <- iconv(df['Beverage'], 'utf-8', 'ascii')
df['Beverage Category'] <- iconv(df['Beverage'], 'utf-8', 'ascii')
head(df)

#drop unwanted columns by keeping wanted columns
df2 = subset(df, select = c('Beverage Prep','Calories','Total Fat','Sugar'))
head(df2)

#add another column based on another column's values
df2 <- df2 %>% 
  mutate(IsTooSweet = if_else(Sugar < 20, "No", "Yes"))
print(df2)
view(df2)

#remove outliers for one column
summary(df2)
boxplot(df2$Sugar)
Q1 <- quantile(df2$Sugar, .25)
Q3 <- quantile(df2$Sugar, .75)
IQR <- IQR(df2$Sugar)
nooutlier_df <- subset(df2, df2$Sugar > (Q1 - 1.5*IQR) & df2$Sugar < (Q3 + 1.5*IQR))
boxplot(nooutlier_df$Sugar)
summary(nooutlier_df)

