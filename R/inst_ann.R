#' @export

inst_ann <- function(sheet, meta) {

  names <- sheet %>%
    select(-1) %>%
    colnames()

  # quarterly <- function(x){
  #   new <- x*4
  #   new
  # }

  quarter_mutate <- function(sheet, expr) {
    expr <- rlang::parse_quosure(expr)
    inst_ann_name <- paste0( quo_name(expr), ".Ins.Ann")

    mutate(sheet,
           !!inst_ann_name := 4*(!!expr)
    )
  }

  month_mutate <- function(sheet, expr) {
    expr <- rlang::parse_quosure(expr)
    inst_ann_name <- paste0( quo_name(expr), ".Ins.Ann")

    mutate(sheet,
           !!inst_ann_name := 12*(!!expr)
    )
  }

  for(n in names) {
    print(n)
    var <- meta %>% filter(Variable == n)
    print(var$Dat.Typ)

    if(as.character(var$Data.Type) == "FLOW" & as.character(var$Frequency) == "Quarter" &
       str_detect(as.character(var$Variable), "Cha.Ove.Pre.Yea") == FALSE){
      sheet <-sheet %>%
        quarter_mutate(n)
    }

    if(as.character(var$Data.Type) == "FLOW" & as.character(var$Frequency) == "Month" &
       str_detect(as.character(var$Variable), "Cha.Ove.Pre.Yea") == FALSE){
      sheet <-sheet %>%
        month_mutate(n)
    }


  }

  sheet

}
