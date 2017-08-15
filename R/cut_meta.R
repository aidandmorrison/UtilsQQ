#' @export
#'
cut_meta <- function(sheet) {

  print("I hope you've already stashed the metadata!")
  datasheet <- sheet[-c(1:9),]
  datasheet

}
