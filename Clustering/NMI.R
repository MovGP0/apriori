#######################################
# normalized mutual information (NMI) #
#######################################

library("NMI", quietly = TRUE)
data("iris")

# calculate the correlation of the values from two matrices

sepal <- iris[, 1:2]
petal <- iris[, 3:4]
nmi <- NMI(sepal, petal)
print(nmi)
