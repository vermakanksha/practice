install.packages("gbm")
library(gbm)
#splines package read about it, a good package
bankloan <- read.csv("/Users/admin/Documents/Documents/JLU/4th Sem/Datasets/bankloan.csv")
dataset <- bankloan

sample<-sample(nrow(dataset),(nrow(dataset)*0.8))
head(sample)
train <- dataset[sample,]
test <- dataset[-sample,]
head(train)
head(test)
nrow(dataset)
nrow(train)
nrow(test)

#model formulation
model <- gbm(default~.,data = train, distribution = "bernoulli",
             n.trees = 2500, shrinkage = .01,
             n.minobsinnode = 20)

gbm.perf(model)

#prediction
pred <- predict.gbm(model,test,n.trees = 366,type = "response")
pred

#confusion matrix
table(round(pred),test$default)




