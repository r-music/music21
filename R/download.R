#' Get list of compositions
#'
#' Return all filenames in the corpus that match a composer's or a
#' collection's name.
#'
#' @param composer a character, composer or collection name, e.g. \code{bach}.
#' @param file_ext if provided, defines which extensions are returned.
#'   \code{file_ext=NULL} (default) returns all extensions.
#'
#' @export
#' @examples {
#' get_composer("schoenberg")
#' }
get_composer <- function(composer, file_ext = NULL) {
  sapply(music21$corpus$getComposer(composer, file_ext), as.character)
}

#' Load music from work name
#'
#' Loads music from music21 internal path
#'
#' @param path character internal path, e.g. \code{bach/bwv66.6}
#'
#' @export
load_music <- function(path) {
  music21$corpus$parse(path)
}
