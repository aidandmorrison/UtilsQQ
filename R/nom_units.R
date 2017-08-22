#' @export
#'

nom_units <- function(sheet, meta) {

  names <- sheet %>%
    select(-1) %>%
    colnames()

  thousand <- function(x){
    new <- x*1000
    new
  }

  percent <- function(x){
    new <- x/100
    new
  }

  for(n in names) {
    print(n)
    var <- meta %>% filter(Variable == n)
    print(var$Unit)

    if(var$Unit == "000"){
      sheet <-sheet %>%
        mutate_at(n, thousand)
    }

    if(var$Unit == "Percent"){
      sheet <- sheet %>%
        mutate_at(n, percent)

    }

  }
sheet

}
