library(readxl)
Iris2 <- read_excel("Desktop/Clustering/Iris2.xlsx")

Iris.features=Iris2
Iris.features$class<- NULL

results<-kmeans(Iris.features,3) #n=3 is the number of cluster you want to define
results #gives the summary of each cluster

results$cluster
results$size
results$betweenss
Iris2$class

table(Iris2$class,results$cluster) #check the actual clusters with k-means, observe the overlaps

plot(Iris2[c("petal.length","petal.width")],col=results$cluster)

plot(Iris2[c("petal.length","petal.width")],col=Iris2$class)

plot(Iris2[c("sepal.length","sepal.width")],col=results$cluster)

plot(Iris2[c("sepal.length","sepal.width")],col=Iris2$class)

library(cluster)
clusplot(Iris2,results$cluster,main = "2D represantation of Cluster", shade = TRUE,labels = 2,lines = 0)
