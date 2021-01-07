## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

library(MASS)
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL                        # initializing inverse as NULL
        set <- function (y) {
                x <<- y
                inv <<- NULL        
        }
        get <- function() x               # function to get matrix x 
        setInverse <- function(inverse) inv <<- inverse
        getInverse <- function() {
                inver<-ginv(x)
                inver%*%        
        }
        list(set = set, get = get,
             setInverse = setInverse
             getInverse = getInverse)             
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setInverse(inv)
        inv
}
