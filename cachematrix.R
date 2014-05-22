## Put comments here that give an overall description of what your
## functions do
## put in cache a special matrix and its inverse for not to calculate it all over again every time i need to
## Write a short comment describing this functionm
## create a list of functions that actually set a matrix and it inverse for using them afterwards.

makeCacheMatrix <- function(x = matrix()) {
                m <- NULL
                set <- function(y) {
                        x <<- y
                        m <<- NULL
                }
                get <- function() x
                setinverse <- function(inverse) m <<- inverse
                getinverse <- function() m
                list(set = set, get = get,
                     setinverse = setinverse,
                     getinverse = getinverse)
}


## Write a short comment describing this function
## return de cached inversed matrix if it exist

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
                m <- x$getinverse()
                if(!is.null(m)) {
                        message("getting cached data")
                        return(m)
                        }
                data <- x$get()
                m <- solve(data, ...)
                x$setinverse(m)
                m
}

