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
                inver%*%                  # function to obtain inverse of the matrix.   
        }
        list(set = set, get = get,
             setInverse = setInverse
             getInverse = getInverse)             
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getInverse()                   # checking if inverse is NULL or already calculated
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)                     # returns inverse value
        }
        data <- x$get()
        inv <- solve(data, ...)                 # calculates inverse value
        x$setInverse(inv)          
        inv
}
