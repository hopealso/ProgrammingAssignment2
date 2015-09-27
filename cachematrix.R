## The functions makeCacheMatrix and cacheSolve work together to calculate and cache the inverse of a matrix.
## If the inverse has already been calculated (& the matrix has not changed), cachesolve retrieves it from the cache.


## makeCacheMatrix produces a "special matrix" which is actually a list containing 4 functions.
## This "special matrix" holds the cache of any previously calculated inverses.

makeCacheMatrix <- function(x = matrix()) {
    ## Initialize cache as NULL. Later this value is passed to getinverse.
    cache <- NULL
    
    ## Create a set of 4 functions that this "special matrix" can run.
    
    ## 1. This function of the "special matrix" allows resetting the matrix to be acted upon
    ## When doing so, it also resets the value of cache, signaling the need to recalculate
    set <- function(newmatrix) {
        x <<- newmatrix
        cache <<- NULL
    }
    
    ## 2. This function simply returns the matrix to be acted upon.
    get <- function() x
    
    ## 3. This function sets the inverse in the "special matrix" but does not actually calculate it.
    ## It must be passed the inverse as an argument.
    setinverse <- function(inverse) cache <<- inverse
    
    ## 4. This function returns the current value of the cached inverse
    ## When getinverse is NULL, it's a sign that the inverse yet hasn't been calculated.
    getinverse <- function() cache

    ## Pass back the "special matrix" with its 4 nifty functions.
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## The purpose of cacheSolve is to return the inverse of a matrix, calculating it only if it has not been previously cached.
## To use cacheSolve, first initialize a variable with the results of makeCacheMatrix within the environment of cacheSolve.
## The variable will contain a "special matrix". Run cacheSolve, passing in the "special matrix".

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of the matrix contained in 'x'.
    ## 'x' is a "special matrix" which is actually a list containing 4 functions, created by makeCacheMatrix.

    ## Get the value of the current cached inverse using a function of the special matrix.
    result <- x$getinverse()
    
    ## If getinverse is not NULL, we don't need to recalculate, return the existing cached value.
    if(!is.null(result)) {
        message("getting cached data")
        return(result)
    }
    
    ## Run below only if getinverse is NULL, calling the functions of the special matrix.
    
    ## Get the matrix to be acted upon.
    data <- x$get()

    ## Calculate and return the inverse of the matrix.
    result <- solve(data, ...)
    x$setinverse(result)
    result
}
