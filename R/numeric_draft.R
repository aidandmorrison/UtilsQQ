#' @export
#'
good_date <- function(sheet){
  var_names <- colnames(sheet)
  var_names <- var_names[2:14]
  enquo_var_names <- enquo(var_names)

  for(n in length(var_names)) {
    sheet$enquo_var_names[n] <- as.numeric(sheet$enquo_var_names[n])

  }

}
