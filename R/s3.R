#' Prints music21 generic object
#'
#' Uses show method from music21
#'
#' @param x music21 python object
#' @param ... other options (currently ignored)
#'
#' @export
print.music21.base.Music21Object <- function(x, ...) {
  res <- reticulate::py_capture_output(x$show("text"))
  cat(res)
}

#' Shows music in the viewer pane
#'
#' This function uses \href{http://lilypond.org/}{lilypond} to save the music21
#' object to a png file, then uses \code{\link{magick}} package to load the
#' image.
#'
#' @param x music21 python object
#' @param ... other options (currently ignored)
#'
#' @export
plot.music21.base.Music21Object <- function(x, ...) {
  p <- as.character(write_lily(x))
  img <- png::readPNG(p)
  op <- graphics::par(mar = rep(0, 4))
  graphics::plot(grDevices::as.raster(img))
  graphics::par(op)
}

view <- function(x, ...) {
  UseMethod("view")
}

#' @rdname plot.music21.base.Music21Object
#' @export
view.music21.base.Music21Object <- function(x, ...) {
  if (!requireNamespace("magick", quietly = TRUE))
    stop("Please install `magick` package.")
  img <- as.character(write_lily(x))
  utils::capture.output(print(magick::image_read(img)))
  invisible(img)
}


