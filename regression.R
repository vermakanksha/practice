#Assigning some values in height and circumference variables
height = c(27.75, 24.5, 25.5, 26, 25, 27.75, 26.5, 27, 26.75, 26.75, 27.5)
circ = c(17.5, 17.1, 17.1, 17.3, 16.9, 17.6, 17.3, 17.5, 17.3, 17.5, 17.5)
#Creating a dataframe
df = data.frame(height,circ)
#Plotting
plot(df)
cov(df) #Covariance
cor(df) #Correlation
cor.test(df)
cor.test(height,circ, alternative = "two.sided", method = "pearson")
#regression
regression = lm(height~circ)
#anova of regression output
anova(regression)
#regression from origin
#Assigning some values in units, cost and sales variable
units = c(20,196,115,50,122,100,33,154,80,147,182,160)
cost = c(114,921,560,245,575,475,138,727,375,670,828,762)
sales = c(100,850,400,225,475,400,130,600,325,575,728,728)
results = lm(cost ~ units -1)
results
results1 = lm(cost ~ units)
results1
results_sales = lm(sales ~ units)
plot(units,sales)
#Plotting regression line
abline(results_sales)
results2 = lm(cost ~ units +1)
results2
results3 = lm(cost ~ units +0)
results3
results4 = lm(cost ~ units -1-1)
results4
#confidence interval
confint(results, level=0.90)
confint(results, level=0.95)
confint(results, level=0.99)
#Prediction from regression model
predict(results,data.frame(units=100),interval="prediction",level=0.90)
#Creating dataframe
df1 = data.frame(units,cost,sales)
df1
colnames(df1)
df1[5,3]
plot(df1)
result_ml = lm(sales ~ units+cost, data=df1)
result_ml
result_glm = glm(sales ~ units+cost, data = df1)
result_glm
summary(result_ml)
summary(result_glm)
cor(sales,units)
cor(sales,cost)
a = c(units,cost)
cor(df1)
#Regression using linear model
result_ml1 = lm(sales ~ cost+units, data=df1)
result_ml1
#Regression using generalized linear model
result_glm1 = glm(sales ~ cost+units, data = df1)
result_glm1
predict(result_ml,data.frame(units=200,cost=150),interval="prediction",level=0.95)

