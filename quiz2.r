library(datasets)
data(iris)
?iris


str(iris)

means by species
tapply(iris$Sepal.Length,iris$Species,mean)

colMeans(iris[,1:4])
apply(iris[, 1:4], 2, mean)

library(datasets)
data(mtcars)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
str(mtcars)

Continuing with the 'mtcars' dataset from Question 6, 
what is the absolute difference between the average 
horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?
mean.hp.by.cyl<-tapply(mtcars$hp,mtcars$cyl,mean)

mean.hp.by.cyl[2]



x <- 1:10
for( i in 1:length(x)) {if(x > 5) {
  x[i] <- 0
}
}

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}