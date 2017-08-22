#' @export
#'
stash_meta <- function(sheet) {
  meta_wide <- head(sheet, n = 9)
  colnames(meta_wide)[colnames(meta_wide)=="Date"] <- "Variable"
  Attribute <- meta_wide$Variable %>%
    str_replace_all(" ", "-")
  meta_long <- t(meta_wide)%>%
    unlist()%>%
    data.frame()
  meta_long <- meta_long[-c(1),]
  colnames(meta_long) <- Attribute
  meta_long <- rownames_to_column(meta_long)
  colnames(meta_long)[1] <- "Variable"
  meta_long


}
