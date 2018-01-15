######################
# K-means clustering #
######################

# load packages
library(ggplot2, quietly = TRUE)
library(ggalt, quietly = TRUE)
data("iris")

number_of_clusters <- 6
result <- kmeans(iris[, 1:4], number_of_clusters, nstart = 60)

# prepare data for plotting
iris$Cluster <- paste("Cluster", factor(result$cluster))
centroids <- data.frame(Cluster = factor(seq(1:length(unique(result$cluster)))), result$centers)

# setup plot
plot <- ggplot2::ggplot()
plot <- plot + ggplot2::ggtitle(label = "Iris Data (K-means clusters)")
plot <- plot + ggplot2::xlab("Length")
plot <- plot + ggplot2::ylab("Width")
plot <- plot + ggplot2::labs(colour = "Feature")
# plot iris data
plot <- plot + ggplot2::geom_point(data = iris, mapping = ggplot2::aes(x = Petal.Length, y = Petal.Width, colour = Species, shape = "petal"))
plot <- plot + ggplot2::geom_point(data = iris, mapping = ggplot2::aes(x = Sepal.Length, y = Sepal.Width, colour = Species, shape = "sepal"))
# enclose clusters
plot <- plot + ggalt::geom_encircle(data = iris, mapping = ggplot2::aes(x = Petal.Length, y = Petal.Width, colour = Cluster))
plot <- plot + ggalt::geom_encircle(data = iris, mapping = ggplot2::aes(x = Sepal.Length, y = Sepal.Width, colour = Cluster))
print(plot)
