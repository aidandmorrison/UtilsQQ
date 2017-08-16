sheet <- readxl::read_xls("/Users/aidanmorrison/Dropbox/TrendLock/data/immigration/310101.xls", sheet = 2)

sheet <- good_names(sheet = sheet)
meta <- stash_meta(sheet)
sheet <- cut_meta(sheet)
sheet <- good_date(sheet)




sheet %>%
  to_numeric() %>%
  str()
