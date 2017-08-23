#' @export

inst_ann <- function(sheet, meta) {

  names <- sheet %>%
    select(-1) %>%
    colnames()

  quarterly <- function(x){
    new <- x*4
    new
  }

  for(n in names) {
    print(n)
    var <- meta %>% filter(Variable == n)
    print(var$Dat.Typ)

    if(as.character(var$Dat.Typ) == "FLOW" ){
      newsheet <-sheet %>%
        mutate_at(n, quarterly)
    }


  }

  newsheet

}
