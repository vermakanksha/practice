install.packages("neuralnet")
library(neuralnet)
creditset <- read.csv("/Users/admin/Documents/Documents/JLU/4th Sem/Datasets/creditset.csv")
View(creditset)
trainset <- creditset[1:800,]
testset <- creditset[801:2000,]
creditnet <- neuralnet(default10yr~LTI + age,
                       trainset, hidden = 4, rep = 2,
                       lifesign = "minimal", linear.output = FALSE,
                       threshold = 0.1)
#hidden layer 1 more than the no. of independent veriables can be taken
plot(creditnet, rep = "best")
temp_test <- subset(testset, select = c("LTI","age"))
creditnet.results <- compute(creditnet, temp_test)
results <- data.frame(actual = testset$default10yr, prediction=round(creditnet.results$net.result))
results[100:115,]
cm <- table(results$actual,results$prediction)
cm
