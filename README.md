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

An example of its use is presented next. First, a random 3x3 matrix is done and injected into a "special" matrix called v. The values of such matrix are presented by the call v$get() and then the solution is calculated. The second time that the function is called, R prints the legend "getting cached data" which comes from the calling of the cached solution path in the code.


    > source("cachematrix.R")
    > v <-makeCacheMatrix()
    > bb=replicate(3, rnorm(3))
    > v$set(bb)
    > v$get()
               [,1]       [,2]       [,3]
    [1,]  0.1311495 -0.5799433  0.4534748
    [2,] -0.2186122 -1.4223861 -0.4688775
    [3,]  1.8082266  0.4619648  0.3372725
    
    > cacheSolve(v)
               [,1]       [,2]        [,3]
    [1,] -0.1714219  0.2639069  0.59736715
    [2,] -0.5043138 -0.5053869 -0.02452304
    [3,]  1.6098105 -0.7226576 -0.20412689
    
    > cacheSolve(v)
    getting cached data
               [,1]       [,2]        [,3]
    [1,] -0.1714219  0.2639069  0.59736715
    [2,] -0.5043138 -0.5053869 -0.02452304
    [3,]  1.6098105 -0.7226576 -0.20412689
