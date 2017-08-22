#' @export
#'
good_date <- function(sheet, Date = "Date") {

  sheet <- sheet %>%
    mutate(Date = as.POSIXct(as.numeric(Date) * (60*60*24), origin="1899-12-30", tz="GMT"))

  sheet

}
