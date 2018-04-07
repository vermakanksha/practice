telecom <- read.delim("/Users/admin/Documents/Documents/JLU/4th Sem/Advanced Analytics/telecom.txt",
                      sep = ",")
head(telecom)
View(telecom)
table(telecom$Churn)
colnames(telecom)

# creating decision tree model
library(tree)
treemodel <- tree(Churn. ~.-State-Phone, data = telecom)

summary(treemodel)
summary(treemodel1)

# plotting the tree model
plot(treemodel)
text(treemodel,pretty=0)

# prediction
pred <- predict(treemodel, data = telecom, type ="class")

# confusion matrix
cm <- print(table(pred, telecom$Churn., 
                  dnn=c("Predicted", "Actual")))

# creating a random forest model
library(randomForest)
rfmodel <- randomForest(Churn.~.-State-Phone, data = telecom)
pred_rf <- predict(rfmodel,data = telecom)
cm_rf <- print(table(pred_rf, telecom$Churn., 
                  dnn=c("Predicted", "Actual")))
