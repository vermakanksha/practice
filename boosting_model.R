library(MASS)
library(adabag)
head(mtcars)
#on cyl
install.packages("forcats")
library(forcats)
View(gss_cat)

dataset<-survey
#mean(dataset$Height,na.rm = TRUE)
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
model <- boosting(Smoke~.,data = train,
                         mfinal = 5,control = rpart.control(maxdepth = 4))

model
#View(survey)

pred <- predict(model,test)
pred
