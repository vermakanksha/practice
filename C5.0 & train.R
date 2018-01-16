library(tree)
#install.packages("C50")
library(C50)
head(mtcars)
library(caTools)

#mtcars dataset
train_mtcars<-mtcars[1:25,]
test_mtcars<-mtcars[26:32,]
nrow(train_mtcars) ; nrow(test_mtcars)
tree_mtcars<-tree(cyl~.,data=train_mtcars)
tree_mtcars
plot(tree_mtcars);text(tree_mtcars)
pred_mtcars<-predict(tree_mtcars,test_mtcars)
pred_mtcars
table(pred_mtcars,test_mtcars$cyl)

tree_new<-C5.0(as.factor(cyl)~.,data=train_mtcars)
tree_new
plot(tree_new);text(tree_new)
pred_new<-predict.C5.0(tree_new,test_mtcars)
pred_new
table(pred_new,test_mtcars$cyl)

#iris dataset
nrow(iris)
150*0.80
train_iris<-iris[1:120,]
test_iris<-iris[121:150,]
nrow(train_iris) ; nrow(test_iris)
head(train_iris)
head(test_iris)
tree_iris<-tree(Species~.,data=train_iris)
tree_iris
plot(tree_iris);text(tree_iris)
pred_iris<-predict(tree_iris,test_iris)
pred_iris
table(pred_iris,test_iris$Species)
round(pred_iris)
#as.data.frame(table(unlist(pred_iris)))


tree_iris_new<-C5.0(Species~.,data=train_iris)
tree_iris_new
plot(tree_iris_new);text(tree_iris_new)
pred_iris_new<-predict.C5.0(tree_iris_new,test_iris)
pred_iris_new
table(pred_iris_new,test_iris$Species)

#train command (rmse)
library(caret)
tr<-train(cyl~.,data=train_mtcars,method="ctree")
tr
tr1<-train(cyl~.,data=train_mtcars,method="rpart")
tr1
tr2<-train(hp~.,data=train_mtcars,method="ctree")
tr2

#MASS mein cars/car mein tree, C5.0 & train code run n make confusion matrix

library(MASS)
head(cars)



