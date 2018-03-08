install.packages('data.table')
library(data.table)
data()
help(iris)
class(iris)
dtIris <- data.table(iris)
class(dtIris)
str(dtIris)
print(dtIris)
View(dtIris)
dtIris[1]
dtIris[1:3]
dtIris[, Species]
dtIris[1:3, Species]
dtIris[1:3, 'Species', with = F]
dtIris[1:3, c(5, 1, 2), with = F]
dtIris[Sepal.Length > 7]
dtIris[, Sepal.Area := Sepal.Length * Sepal.Width]
dtIris[1:6]
dtIris[, mean(Sepal.Area)]
dtIris[, mean(Sepal.Area), by = 'Species']
dtIris[
  , list(areaMin = min(Sepal.Area), areaMax = max(Sepal.Area)),
  by = 'Species'
  ]

install.packages('plyr')
library(plyr)
funcDl <- function(dtChunk){
  result <- mean(dtIris$Sepal.Length)
  return(result)
}
listIris <- dlply(
  .data = iris,
  .variables = 'Species',
  .fun = funcDl
)
names(listIris)
listIris$setosa
