### Introduction

This is the work done for the 2nd programming assigment for the R programming course. 

### Code: Caching the solution of a Matrix

A similar code as provided in the course assigment was used in order to complete this assigment, in which the four operations for a Matrix object were created:

1.  set the value of the matrix
2.  get the value of the matrix
3.  set the value of the solution of the matrix (matrix inverse)
4.  get the value of the solution fo the matrix (matrix inverse)

<!-- -->


    makeCacheMatrix <- function(x = matrix()) {
      s <- NULL
      #Matrix space is initialized, value s, which will hold
      #the solution, will be given a null value
      set <- function(y) {
        x <<- y
        s <<- NULL
      }
      get <- function() x
      setsolve <- function(solve) s <<- solve 
      getsolve <- function() s
      list(set = set, get = get,
           setsolve = setsolve,
           getsolve = getsolve)
    }

The following function calculates the inverse of the special matrix created above. However, first checks if the solution has already done by checking the "null" condition of s and calling the getsolve function. This is done by making using the special environment created by using the <-- function

    cachemean <- function(x, ...) {
            m <- x$getmean()
            if(!is.null(m)) {
                    message("getting cached data")
                    return(m)
            }
            data <- x$get()
            m <- mean(data, ...)
            x$setmean(m)
            m
    }

