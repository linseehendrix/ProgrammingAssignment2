## Take a matrix and look for a cached inverse matrix and if not found compute 

##makeCacheMatrix creates a list with functions to set a matrix, get the matrix, 
#set the inverse matrix, and get the inverse matrix
makeCacheMatrix <- function(cacheMatrix = matrix()) {
# Set the initial inverse matrix to null
  inverseCacheMatrix <- NULL
# Set the matrix to what is passed into function
# Reset inverse matrix to null
  set <- function(newCacheMatrix) {
    cacheMatrix <<- newCacheMatrix
    inverseCacheMatrix <<- NULL
  }
# Return the current matrix
  get <- function() cacheMatrix
# Set the inverse matrix to what is passed into function
  setInverse <- function(newInverseMatrix) {
    inverseCacheMatrix <<- newInverseMatrix
  }
# Return the current inverse matrix
  getInverse <- function() inverseCacheMatrix
# Return the functions
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)

}


##cacheSolve looks for a stored value for the inverse matrix and returns it or
#if not found computes the inverse matrix and stores it 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
# Store the current inverse matrix as i
  i <- x$getInverse()
# if a value for i exists return value
    if(!is.null(i)) {
    message("getting cached data")
    return(i)
    }
# Store the current matrix as data
  data <- x$get()
#  Find the inverse of current matrix
  i <- solve(data, ...)
# Set the inverse matrix to what was computed
  x$setInverse(i)
# Return inverse matrix
    i
}

