# ada boosting
library(ada)
library(adabag)
library(caTools)
library(MASS)
head(iris)

# dataset iris
data_adaboost<-iris
nrow(data_adaboost)

#checking structure of dataset
str(data_adaboost)

split<-sample.split(data_adaboost,SplitRatio = 0.8)
train_iris <- subset(data_adaboost,split==TRUE)
test_iris <- subset(data_adaboost,split==FALSE)
nrow(train_iris)
nrow(test_iris)
prop.table(table(data_adaboost$Species))
prop.table(table(train_iris$Species))
prop.table(table(test_iris$Species))

head(train_iris)
head(test_iris)

#applying adaptive boosting on train (5 models)
model_fit <- boosting(Species~.,data = train_iris,
                      v=10,mfinal = 5,
                      control = rpart.control(maxdepth = 4))
class(iris$Species)
summary(model_fit)

model_fit
model_fit$importance

#pridicting test on model created
pred_iris <- predict(model_fit,test_iris)
pred_iris

#applying adaptive boosting on train (20 models)
model_fit_20 <- boosting(Species~.,data = train_iris,
                      v=10,mfinal = 20,
                      control = rpart.control(maxdepth = 1))
class(iris$Species)
summary(model_fit_1)

model_fit_20

#pridicting test on model created
pred_iris_20 <- predict(model_fit_20,test_iris)
pred_iris_20

#applying adaptive boosting on train (1 model)
model_fit_1 <- boosting(Species~.,data = train_iris,
                      v=10,mfinal = 1,
                      control = rpart.control(maxdepth = 1))
class(iris$Species)
summary(model_fit_1)

model_fit_1

#pridicting test on model created
pred_iris_1 <- predict(model_fit_1,test_iris)
pred_iris_1

#applying adaptive boosting on train (50 models)
model_fit_50 <- boosting(Species~.,data = train_iris,
                      v=10,mfinal = 50,
                      control = rpart.control(maxdepth = 1))
class(iris$Species)
summary(model_fit_50)

model_fit_50

#pridicting test on model created
pred_iris_50 <- predict(model_fit_50,test_iris)
pred_iris_50

#Errors
pred_iris$error
pred_iris_20$error
pred_iris_50$error
pred_iris_1$error

#Confusion matrix
pred_iris$confusion
pred_iris_20$confusion
pred_iris_50$confusion
pred_iris_1$confusion

#applying adaptive boosting on train (5 models)
model_fit <- boosting(Species~.,data = train_iris,
                      v=5,mfinal = 5,
                      control = rpart.control(maxdepth = 4))
class(iris$Species)
summary(model_fit)

model_fit
model_fit$importance

#pridicting test on model created
pred_iris <- predict(model_fit,test_iris)
pred_iris

model_fit$prob
model_fit$votes

#Decision tree model C5.0
library(C50)
dt_fit<-C5.0(Species~.,data = train_iris)
dt_fit

#Predicting decision tree model on test
pred_dt <- predict(dt_fit,test_iris)
pred_dt

#confusion matrix
table(pred_dt,test_iris$Species)
