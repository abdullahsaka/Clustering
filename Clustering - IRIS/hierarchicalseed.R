library(readxl)
library(ggplot2)
seedATA <- read_excel("C:/Users/Administrator/Desktop/seeds.xlsx")
seeds=seedATA
seeds$ID <- NULL
seeds$seedType<- NULL

clusters <- hclust(dist(seeds))
plot(clusters)

clusterCut <- cutree(clusters, 3)
table(clusterCut, seedATA$seedType)

clusters <- hclust(dist(seeds), method = 'average')
plot(clusters)

clusterCut <- cutree(clusters, 3)
table(clusterCut, seedATA$seedType)

ggplot(seeds, aes(perimeter,asymmetryCoefficient, color = as.factor(seedATA$seedType))) + 
  geom_point(alpha = 0.4, size = 3.5) + geom_point(col = clusterCut) + 
  scale_color_manual(values = c('black', 'red', 'green'))

#extension
clusters <- hclust(dist(seeds), method = 'median')
plot(clusters)

clusters <- hclust(dist(seeds), method = 'centroid')
plot(clusters)

clusters <- hclust(dist(seeds), method = 'ward.D')
plot(clusters)

clusters <- hclust(dist(seeds), method = 'ward.D2')
plot(clusters)

rect.hclust(clusters,k=3,border = "green")
