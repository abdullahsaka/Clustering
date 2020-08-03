library(readxl)
library(cluster)
seedATA <- read_excel("C:/Users/Administrator/Desktop/seeds.xlsx")
seed.features=seedATA
seed.features$ID <- NULL
seed.features$seedType<- NULL

seed(6)
results<-kmeans(seed.features,3) 
results 
results$cluster
results$size
results$betweenss

table(results$cluster,seedATA$seedType)

#PLOTTING

plot(seedATA[c("perimeter","asymmetryCoefficient")],col=results$cluster)

plot(seedATA[c("perimeter","asymmetryCoefficient")],col=seedATA$seedType)

ggplot(seedATA, aes(lengthOfKernelGroove,perimeter, color = results$cluster)) + geom_point()

clusplot(seedATA,results$cluster,main = "Cluster Distribution", shade = TRUE,labels = 2,lines = 0)