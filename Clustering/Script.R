# plot the iris data
data("iris")
plot(iris$Petal.Length, iris$Petal.Width, main = "iris data")

# apply k-means clustering
data("iris")
set.seed(20) 
irisCluster <- kmeans(iris[, 3:4], 2, nstart = 20)
plot(iris, col = irisCluster$cluster)

# Density Based Clustering of Applications with Noise (DBSCAN)
install.packages("dbscan", quiet = TRUE)
library("dbscan", quietly = TRUE)
data("iris")
x <- as.matrix(iris[, 1:4])
db <- dbscan(x, eps = .4, minPts = 4)
db
pairs(x, col = db$cluster + 1L)

# Expectation-Maximization (EM) Clustering

install.packages("EMCluster", quiet = TRUE)
library("EMCluster", quietly = TRUE)
set.seed(1234)
data("iris")
x <- as.matrix(iris[, 1:4])
p <- ncol(x)
ret <- starts.via.svd(x, nclass = 10, method = "em")
summary(ret)
plotem(ret, x)

# normalized mutual information (NMI)
install.packages("NMI", quiet = TRUE)
library("NMI", quietly = TRUE)

