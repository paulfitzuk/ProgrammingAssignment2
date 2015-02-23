## Two functions, one to create a list of functions to set,get matrix and one to get the inverse of the matrix

## creates a list object that contains the functions to set and get the matrix
## and to set and get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {

    m <- NULL
    
    setmatrix <- function(){
        x <<- y
        m <<-NULL
    }
    
    getmatrix  <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list (setmatrix  = setmatrix,
          getmatrix  = getmatrix,
          setinverse = setinverse,
          getinverse = getinverse)
}


## Reurns the inverse of the matrix x. Uses a cached inverse if it exists, 
## otherwise it calculates the inverse using the solve function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
   m <- x$getinverse()
   if (!is.null(m)) {
       ## return using the cached inverse
       return (m)
   }
   
   ## cached inverse does not exist to calculated it here
   
   mdata <- x$getmatrix()
   m <- solve(mdata)
   x$setinverse(m)
   m
}
