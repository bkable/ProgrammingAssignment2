## This package provides functions to handle caching of the inverse
## of a given matrix.  The inversion process is typically expensive,
## and caching of inverted matrix provide performance benefit when
## repeated matrix inversions are necessary.

## makeCacheMatrix:  Build a special Matrix object with a cached
## inverse matrix

makeCacheMatrix <- function(x = matrix()) {

}


## cacheSolve:  Compute the inverse of the special cacheable matrix
## build from makeCacheMatrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
