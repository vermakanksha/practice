# ada boosting
library(ada)
library(adabag)
library(caTools)
library(MASS)
student <- read.csv("/Users/admin/Documents/Documents/JLU/4th Sem/Datasets/student.csv")
head(student)

# dataset student
data_adaboost<-student
nrow(data_adaboost)

#checking structure of dataset
str(data_adaboost)

split<-sample.split(data_adaboost,SplitRatio = 0.8)
train_stu <- subset(data_adaboost,split==TRUE)
test_stu <- subset(data_adaboost,split==FALSE)
nrow(train_stu)
nrow(test_stu)
prop.table(table(data_adaboost$Grade))
prop.table(table(train_stu$Grade))
prop.table(table(test_stu$Grade))

head(train_stu)
head(test_stu)

#applying adaptive boosting on train (5 models)
model_fit <- boosting(Grade~.,data = train_stu,
                      v=10,mfinal = 5,
                      control = rpart.control(maxdepth = 4))
class(student$Grade)
summary(model_fit)

model_fit
model_fit$importance

#pridicting test on model created
pred_stu <- predict(model_fit,test_stu)
pred_stu

