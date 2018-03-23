#Support Vector Machine
library(e1071)
#calling the bank loan dataset
bankloan <- read.csv("/Users/admin/Documents/Documents/JLU/4th Sem/Datasets/bankloan.csv")
View(bankloan)

library(readr)
library(caTools)

#Train test split
sample <- sample(nrow(bankloan),nrow(bankloan)*0.8)
sample
train_bank <- bankloan[sample,] 
train_bank
test_bank <- bankloan[-sample,]
test_bank

#SVM model on train dataset
fitmodel <- svm(default~.,data = train_bank,kernel="linear",cost=100,scale = FALSE)
summary(fitmodel)
plot(fitmodel)
fitmodel

#kernal is for unknown values which will fall in the undefined area, not being a part of
#any cluster

#prediction
pred <- predict(fitmodel,test_bank)

#cm
cm <- table(round(pred),test_bank$default)
cm
cm2 <- table(pred>.5,test_bank$default)
cm2
