#' @export

prev_12_month <- function(sheet, meta) {

  names <- sheet %>%
    select(-1) %>%
    colnames()

  names <- names[!str_detect(names, "Ins.Ann")]

  # quarterly <- function(x){
  #   new <- x*4
  #   new
  # }

  quarter_mutate <- function(sheet, expr) {
    expr <- rlang::parse_quosure(expr)
    pre_12_name <- paste0( quo_name(expr), ".Pre.12m")

    mutate(sheet,
           static.var = !!expr,
           !!pre_12_name := (static.var + lag(static.var, n = 1) + lag(static.var, n = 2) + lag(static.var, n = 3))
    )
  }

  month_mutate <- function(sheet, expr) {
    expr <- rlang::parse_quosure(expr)
    pre_12_name <- paste0( quo_name(expr), ".Pre.12m")

    mutate(sheet,
           static.var = !!expr,
           !!pre_12_name := (static.var + lag(static.var, n = 1) + lag(static.var, n = 2) + lag(static.var, n = 3) +
                               lag(static.var, n = 4) + lag(static.var, n = 5) + lag(static.var, n = 6) +
                               lag(static.var, n = 7) + lag(static.var, n = 8) + lag(static.var, n = 9) +
                               lag(static.var, n = 10) + lag(static.var, n = 11) )
    )
  }

  for(n in names) {
    print(n)
    var <- meta %>% filter(Variable == n)
    print(var$Dat.Typ)

    if(as.character(var$Data.Type) == "FLOW" & as.character(var$Frequency) == "Quarter" &
       str_detect(as.character(var$Variable), "Cha.Ove.Pre.Yea") == FALSE ){
      sheet <-sheet %>%
        quarter_mutate(n)
    }

    if(as.character(var$Data.Type) == "FLOW" & as.character(var$Frequency) == "Month" &
       str_detect(as.character(var$Variable), "Cha.Ove.Pre.Yea") == FALSE ){
      sheet <-sheet %>%
        month_mutate(n)
    }


  }

  sheet

}
