#' @title Triangular Distribution
#' @description Density, distribution function, quantile function and random generation
#' for the triangular distribution with parameters min, max and mode.
#' @param x,q vector of quantiles.
#' @param p vector of probabilities.
#' @param n number of observations.
#' @param min lower limit.
#' @param max upper limit.
#' @param mode mode of the distribution.
#' @name triangular
NULL

#' @rdname triangular
#' @export
dtriang <- function(x, min, max, mode) {
  if (min > max) stop("min must be <= max")
  if (mode < min || mode > max) stop("mode must be in [min, max]")

  res <- numeric(length(x))
  idx1 <- x >= min & x < mode
  idx2 <- x >= mode & x <= max

  if (mode > min) res[idx1] <- (2 * (x[idx1] - min)) / ((max - min) * (mode - min))
  if (max > mode) res[idx2] <- (2 * (max - x[idx2])) / ((max - min) * (max - mode))
  res[x == mode & mode == min & mode == max] <- Inf # Caso degenerado

  return(res)
}

#' @rdname triangular
#' @export
ptriang <- function(q, min, max, mode) {
  if (min > max) stop("min must be <= max")
  if (mode < min || mode > max) stop("mode must be in [min, max]")

  res <- numeric(length(q))
  res[q >= max] <- 1
  idx1 <- q >= min & q < mode
  idx2 <- q >= mode & q < max

  if (mode > min) res[idx1] <- (q[idx1] - min)^2 / ((max - min) * (mode - min))
  if (max > mode) res[idx2] <- 1 - (max - q[idx2])^2 / ((max - min) * (max - mode))

  return(res)
}

#' @rdname triangular
#' @export
qtriang <- function(p, min, max, mode) {
  if (any(p < 0 | p > 1)) stop("p must be in [0, 1]")

  res <- numeric(length(p))
  fc <- (mode - min) / (max - min)

  idx1 <- p < fc
  idx2 <- p >= fc

  res[idx1] <- min + sqrt(p[idx1] * (max - min) * (mode - min))
  res[idx2] <- max - sqrt((1 - p[idx2]) * (max - min) * (max - mode))

  return(res)
}

#' @rdname triangular
#' @export
rtriang <- function(n, min, max, mode) {
  return(qtriang(runif(n), min, max, mode))
}




