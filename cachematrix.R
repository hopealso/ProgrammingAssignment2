## The functions makeCacheMatrix and cacheSolve work together to calculate and cache the inverse of a matrix.
## If the inverse has already been calculated (and the matrix has not changed), cachesolve retrieves the inverse from the cache.
## A variable with the results makeCacheMatrix must be initialized in cacheSolve's environment before running cacheSolve.

## makeCacheMatrix produces a "special matrix" which is actually a list containing 4 functions.

makeCacheMatrix <- function(x = matrix()) {
    ## 
    
    ## Initialize m as NULL
    m <- NULL
    
    ###### 
    ## Create a set of 4 functions that this "special matrix" can run
    
    ## This function of the resultant "special matrix" list of functions allows resetting the matrix
    ## When doing so, it also resets the value of m in the special matrix, signaling the need to recalculate
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    ## This function simply returns the matrix to be inverted
    get <- function() x
    
    ## This function sets the inverse in the "special matrix" but does not actually calculate it
    ## It must be passed the inverse by the function that calls it
    setinverse <- function(inverse) m <<- inverse
    
    ## This function returns the inverse currently set 
    getinverse <- function() m
    
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
