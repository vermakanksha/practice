#Clustering
install.packages("rattle")
library(rattle)
wine <- read.csv("/Users/admin/Documents/Documents/JLU/3rd Sem/wine.csv", header=TRUE)
View(wine)
#Scale command for reducing the values so that max & min values have less difference
wine.stand<-scale(wine[-1])
wine.stand
#calculating distance by euclidean method
d<-dist(wine.stand,method ="euclidean")
d
head(d)
#Plot dendrogram
H.fit<-hclust(d,method = "ward.D2")
plot(H.fit)
#K-means clustering
set.seed(1)
winecluster<-kmeans(wine[2],3)
winecluster
winecluster1<-kmeans(wine[3],3)
winecluster1
wine[3]
table(winecluster$cluster,wine[,2])
wine["Alcohol1"]<-round(wine$Alcohol)
head(wine)
table(winecluster1$cluster,wine$Alcohol1)
install.packages("ggplot2")
library(ggplot2)
ggplot(wine,aes(X,Type,Alcohol,color=Malic))+geom_point()
iris
ggplot(iris, aes(Petal.Length, Petal.Width, color=Species))+geom_point()
