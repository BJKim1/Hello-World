install.packages("testthat")
library(testthat)

myvar1_test_cases <- list(
  list(matrix(1:10, nrow=5, ncol=2), matrix(c(1,6,2,7,3,8,4,9,5,10), nrow=2, ncol=5)),
  list(matrix(NA, nrow=0, ncol=0), matrix(NA, nrow=0, ncol=0)),
  list(matrix(c(1,2), nrow=1, ncol=2), matrix(c(1,2), nrow=2, ncol=1)),
  list(matrix(c(1,2), nrow=2, ncol=1), matrix(c(1,2), nrow=1, ncol=2))
)

# Define the function to test
mytranspose <- function(x) {
  if (is.vector(x)) {   # for vectors
    y <- matrix(x, nrow = 1, ncol = length(x))
  } else if (is.data.frame(x)) {   # for data frames
    y <- as.matrix(x)
  } else {   # for matrices
    y <- matrix(1, nrow = ncol(x), ncol = nrow(x))
    for (i in 1:nrow(x)) {
      for (j in 1:ncol(x)) {
        y[j,i] <- x[i,j]
      }
    }
  }
  return(y)
}

# Test the function with each test case
for (i in seq_along(myvar1_test_cases)) {
  result <- mytranspose(myvar1_test_cases[[i]][[1]])
  expected <- myvar1_test_cases[[i]][[2]]
  if (!identical(result, expected)) {
    cat("Test case", i, "failed\n")
  } else {
    cat("Test case", i, "passed\n")
  }
}
