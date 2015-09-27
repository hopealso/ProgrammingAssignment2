## The functions makeCacheMatrix and cacheSolve work together to calculate and cache the inverse of a matrix.
## If the inverse has already been calculated (& the matrix has not changed), cachesolve retrieves it from the cache.
## A variable with the results makeCacheMatrix must be initialized in cacheSolve's environment before running cacheSolve.

## makeCacheMatrix produces a "special matrix" which is actually a list containing 4 functions.
## This "special matrix" holds the cache of any previously calculated inverses.

makeCacheMatrix <- function(x = matrix()) {
    ## Initialize cache as NULL
    ## When cache is NULL, it's a sign that the inverse hasn't been calculated.
    cache <- NULL
    
    ###### 
    ## Create a set of 4 functions that this "special matrix" can run
    
    ## This function of the "special matrix" allows resetting the matrix to be acted upon
    ## When doing so, it also resets the value of cache, signaling the need to recalculate
    set <- function(newmatrix) {
        x <<- newmatrix
        cache <<- NULL
    }
    
    ## This function simply returns the matrix to be acted upon
    get <- function() x
    
    ## This function sets the inverse in the "special matrix" but does not actually calculate it
    ## It must be passed the inverse as an argument
    setinverse <- function(inverse) cache <<- inverse
    
    ## This function returns the inverse currently set 
    getinverse <- function() cache
    
    ######
    
    ## Pass back the "special matrix" with its 4 nifty functions
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
    
}


## The purpose of cacheSolve is to return the inverse of a matrix, calculating it only if it has not been previously cached.
## To use cacheSolve, first initialize a variable with the results of makeCacheMatrix within the environment of cacheSolve.
## The variable will contain a "special matrix". Run cacheSolve, passing in the "special matrix"
## The 1st time cacheSolve is run against the "special matrix", it calculates the inverse into a function of the "special matrix" and returns it.
## The 2nd time cacheSolve is run--as long as the special matrix has not be reset--the cached matrix is returned w/o additional calculation.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    ## 'x' is a "special matrix" which is actually a list containing 4 functions, created by makeCacheMatrix
    ## cacheSolve takes advantage of the 4 functions of 'x' to logically determing whether to run the Solve() function
    

    
}
