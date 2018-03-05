n1 <- 2 
n2 <- 3
n1
n1 + n2
n1 * n2
nSum <- n1 + n2
nProd <- n1 * n2
nSum
# we performed some basic operations on the numbers
sum(2, 3)
sum(2, 3, 4)
s1 <- sum(2, 3)
s2 <- sum(2, 3, 4)
print(s1)
funProd <- function(n1, n2)
{
  n <- n1 * n2
  return(n) }
funProdPrint <- function(n1, n2){
  n <- n1 * n2
  print(n1)
  print(n2)
  print(n)
  return(n) }
prod <- funProdPrint(n1 = 2, n2 = 3)
help(sum)
a1 <- c(1, 2, 3)
a1
a1[1]
a1[c(1, 2)]
sPaste <- paste(s1, s2, sep = '_') 
sPaste
a2 <- c(1, 2, 3)
a1 + a2
a3 <- 1:10
a3
a4 <- c(1, NA, 2)
a4
#basic operators &, &&, |, ||, !
#In the case of vectors, the shorter forms (& and |)
#+compare each element and the long forms (&& and ||)
#+evaluate only the first element of each vector
bool1 <- TRUE
bool2 <- FALSE
bool3 <- bool1 & bool2
bool4 <- bool1 | bool2
bool5 <- !bool1
bool3
bool4
bool5
#relational operators ==, !=, <=, >=, <, >
x1 <- 1
x2 <- 2
bool6 <- x1 == x2
bool7 <- x1 != x2
bool8 <- x1 <= x2
bool6
bool7
bool8
if(bool6){
  x <- 1
}else{ x <- 2
}
x
vectorI <- c(1, 2, 5)
x <- 0
for(i in vectorI)
{
  if(i > 1) {
    x <- x + i }
}
x
nIter <- 10
vectorIter <- 1:nIter
total <- 0
for(i in vectorIter){
  total <- total + 1
}
total
class(n1)
class(funProd)
class(bool5)
class(a1)
class(sPaste)
s1 <- 'string1'
s2 <- "string2"
sPaste <- paste(s1, s2, sep = '_')
sPaste
sSub <- substring(sPaste, 2, 5)
sSub
vectorStrings <- c(s1, s2, sPaste, sSub)
vectorStrings
class(vectorStrings)
vectorStringsNum <- c(s1, s2, 10, 1.3)
vectorStringsNum
class(vectorStringsNum)
vectorString <- c('a', 'a', 'b', 'c')
vectorFactor <- factor(vectorString)
class(vectorFactor)
levels(vectorFactor)
table(vectorFactor)
stringDate <- '2013-01-01'
formatDate <- '%Y-%m-%d'
date1 <- as.Date(stringDate, format = formatDate)
class(date1)
date1
date2 <- date1 + 10
date2
date1 > date2
l1 <- list(1, a1, sPaste)
l1
l2 <- list(elNumber = 1, elvector = a1, elString = sPaste)
l2
l1[[1]]
l2[[1]]
l2$elNumber
names(l2)
names(l1) <- c('el1', 'el2', 'el3')
names(l1)
l3 <- l2[1]
l3
l4 <- l2[c(1, 2)]
l4
vectorMatrix <- c(1, 2, 3, 11, 12, 13)
matrix1 <- matrix(vectorMatrix, ncol = 2)
matrix1
vectorMatrix1 <- c(1, 2, 3, 11, 12, 13, 22)
matrix1.0 <- matrix(vectorMatrix1, ncol = 3)
matrix1.0
matrix2 <- t(matrix1)
matrix2
vector3 <- c('a', 'b', 'c')
matrix3 <- cbind(matrix1, vector3)
matrix3
rownames(matrix3)
colnames(matrix3)
rownames(matrix3) <- c('row1', 'row2', 'row3')
colnames(matrix3) <- c('col1', 'col2', 'col3')
matrix3
#apply: Apply a function to each row, column, or element of a matrix 
#sapply: Apply a function to each element of a vector
#lapply: Apply a function to each element of a list
x1 <- 1:10
func1 <- function(el){
  result <- el ^ 2
  return(result)
}
sapply(X = x1, FUN = func1)
l1 <- list(a = 1, b = 2, c = 3)
lapply(X = l1, FUN = func1)
matrix4 <- matrix(1:9, nrow = 3)
matrix4
apply(X = matrix4, MARGIN = 1, FUN = sum)
#Defining MARGIN = 2, we perform the operation on each column:
apply(X = matrix4, MARGIN = 2, FUN = sum)
#We can apply the function to each element of the matrix using MARGIN = c(1, 2):
apply(X = matrix4, MARGIN = c(1, 2), FUN = func1)
