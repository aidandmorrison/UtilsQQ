
library(UtilsQQ)

df_ls <- collect_data()

sheets <- wrangle(df_ls)


sheet_arr_dep <- bind_cols(sheets$sheet_340101, sheets$sheet_340102)
sheet_340101 <- sheets$sheet_310101

