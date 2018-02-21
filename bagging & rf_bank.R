bankloan<-read.csv("/Users/admin/Documents/Documents/JLU/4th Sem/Datasets/bankloan.csv")
head(bankloan)
install.packages("ada")
install.packages("adabag")
library(ada)
library(adabag)
#train test split
nrow(bankloan)
700*0.8
sample<-sample(700,560)
head(sample)
train <- bankloan[sample,]
test <- bankloan[-sample,]
head(train)
head(test)
prop.table(table(bankloan$default))
prop.table(table(train$default))
prop.table(table(test$default))
library(ipred)
#Applying bagging on train dataset
bank_bagging<-bagging(default~.,data = train)
bank_bagging
summary(bank_bagging)
str(train)
plot(bank_bagging)
plot(bank_bagging$y)
#predicting test on train
pred_bank <- predict(bank_bagging,test,type="class")
head(pred_bank)
#confusion matrix
cm_bank <- table(round(pred_bank),test$default)
cm_bank

#linear regression
lr_bank <- lm(default~.,data = train)
lr_bank
#predicting test on train
pred_bank1 <- predict(lr_bank,test)
head(pred_bank1)
#confusion matrix
cm_bank1 <- table(round(pred_bank1),test$default)
cm_bank1

#decision tree
library(tree)
tree_bank <- tree(default~.,data=train)
tree_bank
#predicting test on train
pred_bank2 <- predict(tree_bank,test)
head(pred_bank2)
#confusion matrix
cm_bank2 <- table(round(pred_bank2),test$default)
cm_bank2

#random forest
library(randomForest)
rf_bank <- randomForest(default~.,data=train)
rf_bank
#Important variables
importance(rf_bank)
varImpPlot(rf_bank)
#predicting test on train
pred_bank3 <- predict(rf_bank,test)
head(pred_bank3)
#confusion matrix
cm_bank3 <- table(round(pred_bank3),test$default)
cm_bank3

#comparing cm
cm_bank
cm_bank1
cm_bank2
cm_bank3

sum(diag(cm_bank))
sum(diag(cm_bank1))
sum(diag(cm_bank2))
sum(diag(cm_bank3))
