install.packages("testthat")
library(testthat)

myvar1_test_cases <- list(
  list(matrix(1:10, nrow=5, ncol=2), matrix(c(1,6,2,7,3,8,4,9,5,10), nrow=2, ncol=5)),
  list(matrix(NA, nrow=0, ncol=0), matrix(NA, nrow=0, ncol=0)),
  list(matrix(c(1,2), nrow=1, ncol=2), matrix(c(1,2), nrow=2, ncol=1)),
  list(matrix(c(1,2), nrow=2, ncol=1), matrix(c(1,2), nrow=1, ncol=2))
)
