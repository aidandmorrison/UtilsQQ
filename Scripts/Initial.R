sheet <- readxl::read_xls("/Users/aidanmorrison/Dropbox (Personal)/TrendLock/data/immigration/310101.xls", sheet = 2)

sheet <- good_names(sheet = sheet)
meta <- stash_meta(sheet)
meta <- good_names(meta)
names(meta)[1] <- "Variable"
sheet <- cut_meta(sheet)
sheet <- good_date(sheet)
sheet <- to_numeric(sheet)
sheet <- nom_units(sheet, meta)

sheet2 <- inst_ann(sheet, meta)
