#' Load midi or musicxml music into a stream
#'
#' Load midi or musicxml music into a stream object
#'
#' @param file path of the file
#' @param ext extension of the file. If NULL (default) gets the extension from
#'   file name.
#'
#' @export
read_music <- function(file, ext = NULL) {
  if (is.null(ext)) ext <- tools::file_ext(file)
  switch (ext,
    midi = read_midi(file),
    xml = read_musicxml(file),
    mxl = read_musicxml(file)
  )
}

#' @rdname read_music
#' @export
read_midi <- function(file) {
  file <- normalizePath(file)
  m <- music21$midi$translate$midiFilePathToStream(file)
  m
}

#' @rdname read_music
#' @export
read_musicxml <- function(file) {
  file <- normalizePath(file)
  m <- music21$converter$parse(file)
  m
}
