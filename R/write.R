#' Write music to lily PNG file
#'
#' Write music21 to png file using lilypond
#'
#' @param x music21 object
#' @param path path to save PNG file. If NULL (default) returns a tempfile.
#'
#' @export
write_lily <- function(x, path = NULL) {
  music21$environment$set('graphicsPath', Sys.which("lilypond")[1])
  img <- x$write("lily.png")
  if (!is.null(path)) {
    file.copy(img, path, overwrite = TRUE)
    file.remove(img)
    path
  } else {
    img
  }
}
