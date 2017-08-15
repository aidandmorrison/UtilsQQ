#'Convert certain variables to numeric values
#'
#' Converts (by default) 2 to last variables to numeric values. Or use the \code{...} argument to determine which cols to convert.
#'
#' @name to_numeric
#' @param df Any data frame you want to edit
#' @param ... Unquoted variable names (either comma seperated or colon separated for a range of variables)
#' @return A data frame
#' @export

to_numeric <- function(df, ...) {
  var_ls <- quos(...)

  if (length(var_ls) == 0) {
    df %>%
      mutate_at(2:length(.), as.numeric)
  } else {
    df %>%
      mutate_at(var_ls, as.numeric)
  }
}
