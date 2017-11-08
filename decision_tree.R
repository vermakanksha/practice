#install.packages("tree")
library(caret)
library(caTools)
library(tree)
student<-read.csv("/Users/admin/Documents/Documents/JLU/3rd Sem/Student.csv")
#to set decimal value for avoiding heavy calculations in decimal
set.seed(1)
#spliting test and train dataset
split<- sample.split(student$Grade, SplitRatio = 0.70)
studentTrain<- subset(student, split == TRUE)
studentTest<- subset(student, split == FALSE)
table(student$Grade)
table(studentTrain$Grade)
table(studentTest$Grade)
prop.table(table(studentTest$Grade))
prop.table(table(studentTrain$Grade))
#test train split randomly
select_rows<- sample(1:nrow(student), round(0.2*nrow(student)), replace = F)
stuTest<- student[select_rows,]
stuTrain<- student[-(select_rows),]
#Decision tree classification
modelClassTree<- tree(Grade ~ Motivation + Age + Gender, data=studentTrain)
#Plotting decision tree
plot(modelClassTree)
text(modelClassTree, pretty = 0, cex = 0.75)
#Prediction of test on train
pred<- predict(modelClassTree, newdata = studentTest, type = "class")
#Confusion Matrix
conf<- table(studentTest$Grade, pred)
conf
table(studentTest$Grade)
table(pred)
#calculating accuracy of our prediction
OAA<- (conf[1,1]+conf[2,2]+conf[3,3]+conf[4,4]+conf[5,5]+conf[6,6])/sum(conf)
OAA
View(student)
#prediction of new values on train model
pred1<- predict(modelClassTree, data.frame(Motivation=70, Age=23, Gender="Female"), type="class")
pred1
