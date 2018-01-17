############################################
# Expectation-Maximization (EM) Clustering #
############################################
library(ggplot2, quietly = TRUE)
library(ggalt, quietly = TRUE)
library("EMCluster", quietly = TRUE)
data("iris")

irisData <- iris[, 1:4]
number_of_clusters <- 6
config <- EMCluster::simple.init(irisData, nclass = number_of_clusters)
result <- EMCluster::emcluster(irisData, config, assign.class = TRUE)
projection <- project.on.2d(irisData, result)

plot <- ggplot2::ggplot()
plot <- plot + ggplot2::ggtitle(label = "Iris Data")
plot <- plot + ggplot2::xlab("Length")
plot <- plot + ggplot2::ylab("Width")
plot <- plot + ggplot2::labs(colour = "Feature")
plot <- plot + ggplot2::geom_point(data = iris, mapping = ggplot2::aes(x = Petal.Length, y = Petal.Width, colour = Species, shape = "petal"))
plot <- plot + ggplot2::geom_point(data = iris, mapping = ggplot2::aes(x = Sepal.Length, y = Sepal.Width, colour = Species, shape = "sepal"))
# TODO: print result
print(plot)