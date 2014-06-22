## Put comments here that give an overall description of what your
## functions do

## Initializes the Matrix object with a cache space
## And subfunctions to set, get and solve the matrix

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  #Matrix space is initialized, value s, which will hold
  #the solution, will be given a null value
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  #The equivalent to the setmean and getmean functions are added.
  setsolve <- function(solve) s <<- solve 
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

##  The following function calculates the inverse of the special matrix created above. However, first checks if the solution has already done by checking the "null" condition of s and calling the getsolve function. This is done by making using the special environment created by using the <-- function

cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
