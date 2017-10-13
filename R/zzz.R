#' music21 for R
#'
#' \href{http://web.mit.edu/music21/doc/index.html}{music21} is an open source software library
#' for structured music data IO and manipulation.
#'
#' The music21 package provides access to the
#' complete music21 API from within R.
#'
#' @import reticulate
#'
#' @docType package
#' @name music21
NULL

#' python music21 module
#'
#' python music21 complete module. Treat it like an RC object
#'
#' @export
music21 <- NULL

.onLoad <- function(libname, pkgname) {
  music21 <<- reticulate::import("music21", delay_load = TRUE)
}
