library(datasets)

iris$Species
library(ggplot2)
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()

set.seed(20)
irisCluster <- kmeans(iris[, 3:4], 3, nstart = 20)
irisCluster$cluster

table(irisCluster$cluster, iris$Species)

irisCluster$cluster <- as.factor(irisCluster$cluster)
irisCluster$cluster

ggplot(iris, aes(Petal.Length, Petal.Width, color = irisCluster$cluster)) + geom_point()

c1<-cbind(irisCluster$cluster)
c1

clusters <- hclust(dist(iris[, 3:4]))
plot(clusters)

clusterCut <- cutree(clusters, 3)
table(clusterCut, iris$Species)

clusters <- hclust(dist(iris[, 3:4]), method = 'average')
plot(clusters)

clusterCut <- cutree(clusters, 3)
table(clusterCut, iris$Species)

ggplot(iris, aes(Petal.Length, Petal.Width, color = iris$Species)) + 
  geom_point(alpha = 0.4, size = 3.5) + geom_point(col = clusterCut) + 
  scale_color_manual(values = c('black', 'red', 'green'))

clusters <- hclust(dist(iris[, 3:4]), method = 'complete')
plot(clusters)

clusters <- hclust(dist(iris[, 3:4]), method = 'median')
plot(clusters)

clusters <- hclust(dist(iris[, 3:4]), method = 'centroid')
plot(clusters)

clusters <- hclust(dist(iris[, 3:4]), method = 'ward.D')
plot(clusters)

clusters <- hclust(dist(iris[, 3:4]), method = 'ward.D2')
plot(clusters)

rect.hclust(clusters,k=3,border = "green")
