library(randomForest)
library(pROC)
library(caTools)
bankloan<- read.csv("/Users/admin/Documents/Documents/JLU/3rd Sem/bankloan.csv")
View(bankloan)
set.seed(88)
#Splitting the dataset train and validation
split = sample.split(bankloan, SplitRatio = 0.60)
train = subset(bankloan,split==TRUE)
validation = subset(bankloan,split==FALSE)
#From validation dataset we will create valid_data and test_data
split = sample.split(validation,SplitRatio = 0.5)
valid_data = subset(validation,split==TRUE)
test_data = subset(validation,split==FALSE)
head(train)
dim(train)
dim(test_data)
dim(valid_data)
library(ROCR)
library(caret)
#Random Forest model for default variable
model_randomForest<- randomForest(default~age+income+creddebt+othdebt,data = train)
model_randomForest
plot(model_randomForest)
print(model_randomForest)
#we should see the real forest
#code taken from github
options(repos="http://cran.rstudio.org")
have.packages<-installed.packages()
cran.packages<-c("devtools","plotrix","randomForest","tree")
to.install<-setdiff(cran.packages,have.packages[,1])
if(length(to.install)>0) install.packages(to.install)
library(devtools)
if(!("reprtree" %in% installed.packages())){
  install_github("araastat/reprtree")
}
for(p in c(cran.packages,"reprtree"))
  eval(substitute(library(pkg),list(pkg=p)))
library(reprtree)
model<- randomForest(default~age+income+creddebt+othdebt,data=test_data,
                     importance=TRUE,ntree=500,mtry=2,do.trace=100)
reprtree:::plot.getTree(model)
#Prediction of test on train
pred<- predict(model_randomForest, newdata = test_data, type = "class")
#rounding the decimal values in 'pred' variable to get 0 or 1
pred_round <- round(pred)
#Confusion Matrix
conf<- table(test_data$default, pred_round)
conf
table(test_data$default)
table(pred_round)
