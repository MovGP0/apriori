# plot the iris data
data("iris")
sepal <- as.matrix(iris[, 1:2]) # get column 1 and 2
petal <- as.matrix(iris[, 3:4]) # get column 3 and 4

plot(iris$Petal.Length, iris$Petal.Width, main = "iris data", col = "red", xlab = "Length", ylab = "Width", xlim=c(0, 8), ylim=c(0,5))
points(iris$Sepal.Length, iris$Sepal.Width, col = "green")

# apply k-means clustering
set.seed(20)
irisSepalKCluster <- kmeans(setal, 2, nstart = 20)
irisPetalKCluster <- kmeans(petal, 2, nstart = 20)
points(irisSepalKCluster$centers, col = "cyan", pch = "+") # plotting the center of the clusters
points(irisPetalKCluster$centers, col = "blue", pch = "*") 

library(cluster)
clusplot(iris[, 1:2], irisSepalKCluster$cluster, color = TRUE, shade = TRUE, lines = 0)
clusplot(iris[, 3:4], irisPetalKCluster$cluster, color = TRUE, shade = TRUE, lines = 0)

# Density Based Clustering of Applications with Noise (DBSCAN)
install.packages("dbscan", quiet = TRUE)
library("dbscan", quietly = TRUE)
data("iris")
irisSepalDbCluster <- dbscan(sepal, eps = .4, minPts = 4)
irisPetalDbCluster <- dbscan(petal, eps = .4, minPts = 4)
pairs(iris[, 3:4], col = irisPetalDbCluster$cluster)
pairs(iris[, 1:2], col = irisPetalDbCluster$cluster)
clusplot(iris[, 1:2], irisSepalDbCluster$cluster, color = TRUE, shade = TRUE, lines = 0)
clusplot(iris[, 3:4], irisPetalDbCluster$cluster, color = TRUE, shade = TRUE, lines = 0)

# Expectation-Maximization (EM) Clustering

install.packages("EMCluster", quiet = TRUE)
library("EMCluster", quietly = TRUE)
set.seed(1234)
data("iris")
irisSepalSvdCluster <- starts.via.svd(sepal, nclass = 10, method = "em")
plotem(irisSepalSvdCluster, sepal)

# normalized mutual information (NMI)
install.packages("NMI", quiet = TRUE)
library("NMI", quietly = TRUE)
