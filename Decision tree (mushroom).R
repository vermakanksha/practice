# Decision Tree Practice on various datasets
# calling file
mushroom <- read.csv("/Users/admin/Documents/Documents/JLU/4th Sem/Datasets/mushrooms.csv")
head(mushroom,2)
nrow(mushroom)
head(mushroom$type)
str(mushroom$type)
class(mushroom$type)
#train test split
set.seed(101)
sample<-sample(8124,8124*0.80)
head(sample)
train_m <- mushroom[sample,]
test_m <- mushroom[-sample,]
nrow(train_m); nrow(test_m)
head(train_m); head(test_m)
class(train_m$type)
table(train_m$type)
# checking split
prop.table(table(mushroom$type))
prop.table(table(train_m$type))
prop.table(table(test_m$type))

# calling library
library(tree)
library(caret)
library(C50)
library(randomForest)

# creating tree model
tree_m <- tree(type~.,data = train_m)
tree_m
summary(tree_m)
plot(tree_m); text(tree_m)

# predicting test on train model
pred_m <- predict(tree_m,test_m)
pred_m

# creating C5.0 model
C50_m <- C5.0(type~habitat+population+odor,data = train_m)
C50_m
summary(C50_m)
plot(C50_m); text(C50_m)

# installing e1071
#install.packages("e1071")
library(e1071)

# creating train model
train_m_m <- train(type~habitat+population+odor,data = train_m,method="ctree")
train_m_m
summary(train_m_m)
plot(train_m_m); text(train_m_m)

# prediction
pred_train <- predict(train_m_m, test_m)
pred_train

# Confusion matrix
table(pred_train,test_m$type)
