#' @export
#'
good_names <- function(sheet = sheet, meta = FALSE) {
  checker <- meta
  old_names <- colnames(sheet)%>%
    data.frame()

  working_names <- old_names$. %>%
    str_replace_all(" ", "-")%>%
    data.frame()
  working_names$. <- working_names$. %>%
    str_replace_all("\\(", "-") %>%
    str_replace_all("\\)", "-") %>%
    str_replace_all("-;", "-") %>%
    str_replace_all("\\&", "-") %>%
    str_replace_all("--", "-") %>%
    str_replace_all("--", "-") %>%
    str_replace_all("--", "-") %>%
    str_replace_all("\\..", ".")

  if(checker == FALSE){
    working_names$. <- working_names$. %>%
      str_split("-")%>%
      map( ~ .x %>% str_trunc(3, ellipsis = "") %>% .[. != ""] %>% str_c(collapse = "."))

    good_names <- c("Date", c(working_names[-c(1),]%>%unlist()))%>%
      as.vector()
  }

  if(checker == TRUE){
  working_names$. <- working_names$. %>%
    str_split("-")%>%
    map( ~ .x %>% str_trunc(10, ellipsis = "") %>% .[. != ""] %>% str_c(collapse = "."))

  good_names <- c("Variable", c(working_names[-c(1),]%>%unlist()))%>%
    as.vector()
  }


  colnames(sheet) <- good_names

  sheet

}
