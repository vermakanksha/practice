# Decision Tree Practice on bankloan dataset
# calling dataset
bank <- read.csv("/Users/admin/Documents/Documents/JLU/4th Sem/Datasets/bankloan.csv")
head(bank)
# test train split
nrow(bank)
700*0.80
sample<-sample(700,560)
train_bank <- bank[sample,]
test_bank <- bank[-sample,]
#checking if split is random
prop.table(table(bank$default))
prop.table(table(train_bank$default))
prop.table(table(test_bank$default))

#creating decision tree model
tree_bank<-tree(default~age+ed+income,data=train_bank)
tree_bank
plot(tree_bank); text(tree_bank)
#predicting test on train
pred_bank<-predict(tree_bank,test_bank)
round(pred_bank)
#confusion matrix
cm <- table(round(pred_bank),test_bank$default)
cm

#creating random forest model
rf_bank<-randomForest(default~age+ed+income,data=train_bank)
rf_bank
plot(rf_bank); text(rf_bank)
#predicting test on train
pred_rf_bank <- predict(rf_bank,test_bank)
round(pred_rf_bank)
#confusion matrix
cm_rf <- table(round(pred_rf_bank),test_bank$default)
cm_rf

cm

#confusion matrix of tree model is better than random forest model

