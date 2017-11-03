library (MASS)
#calling menarche dataset
head(menarche)
#plotting
plot(Menarche/Total ~ Age, data=menarche)
#applying generalized linear model
glm.out = glm(cbind(Menarche, Total-Menarche) ~ Age, family=binomial(logit), data=menarche)
summary(glm.out)
glm.out
#creating a new column in the dataframe
menarche$log<-menarche$Menarche/menarche$Total
#applying generalized linear model
glm.out1 = glm(log ~ Age, family=binomial(logit), data=menarche)
glm.out1
#plotting
plot(log~Age, data=menarche)
lines(menarche$Age, glm.out1$fitted, col="blue")
glm.out1$coefficients
#confidence interval
confint(glm.out1)
summary(glm.out1, level=0.99)
#calling bankloan dataset
bank <- read.csv("/Users/admin/practice/bankloan.csv", header=TRUE)
head(bank)
View(bank)
#plotting response variable
plot(bank$default)
#applying generalized linear model for single independent variable
glm.bank = glm(default ~ age, family=binomial(logit), data=bank)
glm.bank
#applying generalized linear model for multiple independent variables
glm.bank1 = glm(default ~ age+ed+income, family=binomial(logit), data=bank)
glm.bank1
#applying generalized linear model for all independent variables
glm.bank2 = glm(default ~ ., family=binomial(logit), data=bank)
glm.bank2
#prediction based on various models created
pred.bank <- predict(glm.bank,data.frame(age=35),interval="prediction")
pred.bank
pred.bank1 <- predict(glm.bank,data.frame(age=76))
pred.bank1
pred.bank2 <- predict(glm.bank,data.frame(age=76), interval=confidence)
pred.bank2
?predict
pred.bank3 <- predict(glm.bank,data.frame(age=98), interval=confidence)
pred.bank3
#trying various combinations of independent variable
glm.bank.ed = glm(default ~ ed, family=binomial(logit), data=bank)
glm.bank.ed
pred.bank.ed <- predict(glm.bank.ed,data.frame(ed=3))
pred.bank.ed
cor(bank)
pred.bank.3 <- predict(glm.bank1,data.frame(age=23,ed=3,income=150))
pred.bank.3
glm.bank4 = glm(default ~ income+debtinc+creddebt, family=binomial(logit), data=bank)
glm.bank4
glm.bank5 = glm(default ~ debtinc+creddebt+income, family=binomial(logit), data=bank)
glm.bank5
glm.bank6 = glm(default ~ creddebt+income+debtinc, family=binomial(logit), data=bank)
glm.bank6
pred.bank.4 <- predict(glm.bank4,data.frame(income=150,debtinc=15,creddebt=10))
pred.bank.4
glm.bank7 = glm(default ~ income, family=binomial(logit), data=bank)
glm.bank8 = glm(default ~ debtinc, family=binomial(logit), data=bank)
glm.bank9 = glm(default ~ creddebt, family=binomial(logit), data=bank)
glm.bank7
glm.bank8
glm.bank9
