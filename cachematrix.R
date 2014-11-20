## Two functions that allow to cache the inverse of a matrix:
## makeCacheMatrix and cacheSolve
## Based on "Caching the Mean of a vector".

## Matrix object creation to cache the inverse 
makeCacheMatrix <- function(x = matrix())
{
	## Inverse initialization
	invMat <- NULL
	
	## Set matrix method
	set <- function(matrix)
	{
		m <<- matrix
		invMat <<- NULL
	}

	## Get matrix method
	get <- function()
	{
		## Return the matrix
		m
	}

	## Set matrix inverse method
	setInverse <- function(inverse)
	{
		invMat <<- inverse
	}

	## Get matrix inverse method
	getInverse <- function()
	{
		## Return the inverse of the matrix
		invMat
	}
	
	## Return the methods list
	list(set = set, get = get,
             setInverse = setInverse, getInverse = getInverse)
}


## Compute the inverse of a matrix the "smart way": if it is already calculated,
## the inverse is retrieved from cache. If not, then the inverse is calculated and retrieved.
cacheSolve <- function(x, ...)
{
        ## Return a matrix that is the inverse of 'x'
	m <- x$getInverse()
	## Return the inverse if it is already calculated.
	if (!is.null(m)
	{
		message("Getting cached data!")
		return(m)
	}

	## Get the matrix.
	data <- x$get()

	## Calculate inverse of the matrix
	m <- solve(data)

	## Set inverse matrix to cache
	x$setInverse(m)

	## Return the inverse of the matrix
	m
}
