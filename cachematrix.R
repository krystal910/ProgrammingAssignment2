## This function creates a special "matrix" object with the ability to cache its inverse.
## It contains four functions to do the following: 
     ## Set the value of the matrix
     ## Get the value of the matrix
     ## Set the inverse of the matrix
     ## Get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) 
  {
  inv <- NULL
  set <- function(y)
      {
        x <<- y
        inv <<- NULL
      }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set= set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  }

## This function computes the inverse of a matrix. In the case that the inverse has already 
## been calculated and no changes to the matrix have been made, the function will retrieve 
## the inverse from cache instead of calculating it again. 

cacheSolve <- function(x, ...) 
  {
  inv <- x$getinverse()
  if (!is.null(inv))
    {
      message("getting cached data")
      return(inv)
    }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
  }

