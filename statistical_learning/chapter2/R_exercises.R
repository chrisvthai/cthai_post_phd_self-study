library("ISLR")

# Exercise 8
college_dataset = read.csv("https://www.statlearning.com/s/College.csv")

fix(college_dataset)
rownames(college_dataset) = college_dataset[,1]
college_dataset = college_dataset[,-1]

summary(college_dataset)
pairs(college_dataset[,2:11])

boxplot(Outstate ~ Private, college_dataset)

Elite = rep("No", nrow(college_dataset))
Elite[ college_dataset$Top10perc > 50 ] = "Yes" 
Elite = as.factor(Elite)
college_dataset = data.frame(college_dataset, Elite)
summary(college_dataset)
boxplot(Outstate ~ Elite, college_dataset)

hist(college_dataset$Top25perc)

# Exercise 9
summary(Auto)

# Quantitative predictors are MPG, cylinders, displacement, horsepower, weight, acceleration
# Qualitative predictors are year and origin

sapply(Auto[, 1:6], range)
sapply(Auto[, 1:6], sd)
sapply(Auto[, 1:6], mean)

auto_trimmed <- Auto[-c(10:85), ]
sapply(auto_trimmed[, 1:6], range)
sapply(auto_trimmed[, 1:6], sd)
sapply(auto_trimmed[, 1:6], mean)

plot(Auto$horsepower, Auto$mpg) # higher horsepower cars tend to have low MPG
plot(Auto$horsepower, Auto$acceleration) # strangely, higher horsepower cars tended to have lower accelerations?
plot(Auto$weight, Auto$acceleration) # vehicle weight doesn't seem to have that big an effect on acceleration
plot(Auto$year, Auto$mpg) # newer cars seem to be more fuel efficient

# Year and horsepower are definitely useful to predict gas mileage

# Exercise 10
library("MASS")
summary(Boston)
?Boston

# crime rate v/s median home value
plot(Boston$crim, Boston$medv) # obviously, low crime rate means higher median home value
plot(Boston$age, Boston$medv) # slight trend of older homes -> lower median value
plot(Boston$tax, Boston$crim) # there is a collection of high property tax bracket towns with higher crime rate

nrow(Boston[Boston$chas == 1, ]) # 35 suburbs bound to Charles River

median(Boston$ptratio) # median of 19.05 pupils to teachers

Boston[Boston$medv == min(Boston$medv), ] # fairly high crime rate, all homes are built prior to 1940
range(Boston$crim)

nrow(Boston[Boston$rm > 7,])
nrow(Boston[Boston$rm > 8,])
