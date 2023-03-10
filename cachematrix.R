## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix fuction creates a special matrix object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
         inv <- NULL
         set <- function(y) {
                 x <<- y
                 inv <<- NULL
         }
         get <- function() x
         setinverse <- function(inverse) inv <<-- inverse
         getinverse <- function() inv
         list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)           
}


## cacheSolve function computes the inverse of the special matrix object returned by makeCacheMatrix function. If the inverse  
## has already been calculated (and the matrix has not changed), then the cacheSolve function should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
       inv <- x$getinverse()
       if(!is.null(inv)) {
               message("getting cached data")
               return(inv)
       }
       data <- x$get()
       inv <- solve(data, ...) 
       x$setinverse(inv)
       inv
       
}
