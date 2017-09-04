#' @export

wrangle <- function(input) {

  meta_ls <- df_ls %>%
    map( ~ stash_meta(.x) %>%
           good_names(meta = T))

  meta <<- bind_rows(meta_ls)

  df_ls %>%
    map2(meta_ls,
         ~ good_names(.x) %>%
           cut_meta() %>%
           good_date() %>%
           to_numeric() %>%
           nom_units(.y) %>%
           inst_ann(.y) %>%
           prev_12_month(.y))
}
