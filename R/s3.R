plot.music21.base.Music21Object <- function(x, ...) {
  env <- reticulate::import("music21.environment")
  env$set('graphicsPath', Sys.which("lilypond")[1])
  img <- x$write("lily.png")
  print(magick::image_read(img))
  invisible(img)
}

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
  img <- magick::image_read(write_lily(x))
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
  img <- write_lily(x)
  utils::capture.output(print(magick::image_read(img)))
  invisible(img)
}


