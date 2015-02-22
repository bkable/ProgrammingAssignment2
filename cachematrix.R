## This package provides functions to handle caching of the inverse
## of a given matrix.  The inversion process is typically expensive,
## and caching of inverted matrix provide performance benefit when
## repeated matrix inversions are necessary.

## Usage is as follows:
##
## 1. Set up cachable matrix: cachedMatrix <- makeCacheMatrix()
## 2. Cache the matrix object: cachedMatrix$set(<matrix object>)
##              i.e. cachedMatrix$set(matrix(1:4, nrow=2, ncol=2))
## 3. Solve for the inverse matrix, hereby caching it: cacheSolve(cachedMatrix)
##
## NOTE: It is assumed that the matrix object that will be cached is not singular
## and may be inverted.  Solving for the cache does not handle error
## where matrix inversion fails


## makeCacheMatrix:  Build a special Matrix object with a cached
## inverse matrix

makeCacheMatrix <- function(m = matrix()) {
        im <- NULL
        
        # Setter for cached matrix
        set <- function(y) {
                m <<- y
                im <<- NULL
        }
        
        # Getter for cached matrix
        get <- function() m
        
        # Getter for cached inverse matrix
        getInvMatrix <- function() im
        
        # Setter for caching inverse matrix
        setInvMatrix <- function(solvedim) im <<- solvedim
        
        # Publish getters and setters for Cache Matrix
        list(set = set, 
             get = get,
             getInvMatrix = getInvMatrix,
             setInvMatrix = setInvMatrix)
}


## cacheSolve:  Compute the inverse of the special cacheable matrix
## build from makeCacheMatrix.

cacheSolve <- function(m, ...) {
        im <- m$getInvMatrix()
        print(im)
        
        if(is.null(im)) {
                # Cache inverse matrix for first access
                im <- solve(m$get())
                m$setInvMatrix(im)
                return(im)
        } else {
                # Return already cached inverse matrix
                return(im)       
        }
}
