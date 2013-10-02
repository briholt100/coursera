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