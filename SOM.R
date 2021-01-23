#############################################################################################
# Project - Self Organizing Maps
# Modified by - Anand
# Modified Date - 04/22/2020
###########################################################################################

rm(list=ls())
graphics.off()

library("ISLR")
library("sparcl")

data("USArrests")
head(USArrests)
dim(USArrests)

USscaled<-scale(USArrests)

dim(USscaled)
head(USscaled)

distmat<-dist(USscaled,method="euclidean")
distmatx<-as.matrix(distmat)
dim(distmatx)

hc<-hclust(distmat,method="complete")

plot(hc)
abline(h=4.42,col="red")

hcut<-cutree(hc,h=4.42)
table(hcut)

kcut<-cutree(hc,k=3)
table(kcut)

ColorDendrogram(hc, y = kcut, labels = names(kcut), main = "3-Clusters Colored differently in Dendrogram")
############################################################################################
graphics.off()
library("kohonen")

dim(USscaled)
head(USscaled)


us.sgrid<-somgrid(xdim=4,ydim=4,topo=c("hexagonal"))
us.som<-som(USscaled,us.sgrid,rlen=100)

codes <- us.som$codes[[1]]

plot(us.som, main = "US States")
plot(us.som, type = "changes", main = "US States")
plot(us.som, type = "count")
plot(us.som, type = "mapping")

coolBlueHotRed <- function(n, alpha = 1){rainbow(n, end=4/6, alpha = alpha)[n:1]}

plot(us.som, type = "dist.neighbours", palette.name = coolBlueHotRed)

# component plane plots
for (i in 1:4){
  plot(us.som, type = "property", property=codes[,i], main = colnames(codes)[i])
  Sys.sleep(2)
}

d <- dist(codes)
hc <- hclust(d)

plot(hc)
abline(h=3.15,col="red")

som_cluster <- cutree(hc, h = 3.15)

# plot the SOM with the found clusters

my_pal <- c("palegreen", "lightsalmon", "lightskyblue","orange")
my_bhcol <- my_pal[som_cluster]

plot(us.som, type = "mapping", col = "black", bgcol = my_bhcol)
add.cluster.boundaries(us.som, som_cluster)
table(som_cluster)

cluster_details <- data.frame(id=rownames(USscaled), cluster=som_cluster[us.som$unit.classif])

as.table(as.matrix(cluster_details))
