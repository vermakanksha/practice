#Support Vector Machine
#read letters dataset
letters <- read.csv("/Users/admin/Documents/Documents/JLU/4th Sem/Datasets/letterdata.csv")
str(letters)

#divide into training and test data
sample1 <- sample(nrow(letters),0.8*nrow(letters))
letters_train <- letters[sample1,]
letters_test <- letters[-sample1,]

#Training a simple linear svm
library(kernlab)
letter_classifier <- ksvm(letter~.,data=letters_train,kernel="vanilladot")

letter_classifier

#prediction on test dataset
letter_pred <- predict(letter_classifier,letters_test)
head(letter_pred)

#confusion matrix
letter_cm <- table(letter_pred,letters_test$letter)
letter_cm

agreement <- letter_pred == letters_test$letter
table(agreement)
prop.table(table(agreement))
