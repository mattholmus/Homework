# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R

UNStats <- read.csv("~/R/r_programming_bsos/r_programming_bsos/UNStats.csv", na.strings = C("..", "-")
View(UNStats)
summary(UNStats)

# 2. Peek at the top few rows

head(UNStats, n=3) #OR
UNStats[1:5,]

# 3. Peek at the top few rows for only a few columns

UNStats[1:5,1:5]

# 4. How many rows does your data have?

dim(UNStats)
# the data has 199 rows and 16 columns

# 5. Get a summary for every column

summary(UNStats)

# 6. Get a summary for one column

population <- subset(UNStats, select = 2)
summary(population)

# 7. Are any of the columns giving you unexpected values?
#    - missing values? (NA)

is.na(UNStats)
#yes, several are missing. But how do you check row by row, or in a summarized format?

# 8. Select a few key columns, make a vector of the column names

colnames(UNStats)
keyinfo <- UNStats[, c(1, 2, 8, 9)]
colnames(keyinfo) # shows that it includes country name, population, % urban population, and GDP

# 9. Create a new data.frame with just that subset of columns
#    from #7
#    - do this in at least TWO different ways

key.data <- data.frame(keyinfo)
#OR
key.data2 <- data.frame(UNStats[, c(1, 2, 8, 9)])


# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from #8

key.data3 <- data.frame(key.data[c(1:10, 190:199), ])

# 11. Create a new data.frame that is a random sample of half of the rows.

random.data <- data.frame(UNStats[c(sample(c(1:100)), size = 50, replace = FALSE, prob = NULL), ])
#not sure why the size argument isn't changing things, but this does generate a sample of half the rows.

# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test for that comparison
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)
#     - run the t.test with BOTH the formula and "vector"
#       formats, if possible
#     - if one is NOT possible, say why you can't do it

group1 <- UNStats$Urbanization..percentage.of.total.population.[1:10]
group2 <- UNStats$Urbanization..percentage.of.total.population.[11:20]
as.numeric(group1)
as.numeric(group2)
t.test(group1, group2)

#I'm having trouble with the t.test because the numbers are being read as integers. 

t.test(Urban~GDP)

# Its giving me an invalid type error because population is a list, not sure why though.

# 13. Repeat #10 for TWO more comparisons
#     - ALTERNATIVELY, if correlations are more interesting,
#       do those instead of t-tests (and try both Spearman and
#       Pearson correlations)

cor1 <- data.frame(UNStats[, c(8, 9)]) # Urban Population and GDP
cor(cor1, use="complete.obs", method="pearson")

cor2 <- data.frame(UNStats[, c(11, 9)]) # Gini index and GDP
cor(cor2, use="complete.obs", method="pearson")

#I'm having the same problem as in question 12 because the data is in integer and not numeric form. How do I convert that?

# 14. Save all results from #12 and #13 in an .RData file

save.image("Day2Homework_Matt_Kuniholm.RData")

# 15. Email me your version of this script, PLUS the .RData

# note that there's no data frmo the last question because the function wasn't working. 
#     file from #14
