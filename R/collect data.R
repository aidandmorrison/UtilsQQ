
#' @export

collect_data <- function(url_ls = abs_urls) {

  url_ls %>%
    walk(
      ~ download.file(.x$url, glue("{getwd()}/{.x$file_name}.xls"))
    )

  url_ls %>%
    map(
      ~ read_xls(glue("{getwd()}/{.x$file_name}.xls"), sheet = 2)
    ) %>%
    set_names(glue(
      "sheet_{map_chr(abs_urls, 'file_name')}"
    ))

}

# ABS connections

abs_urls <- list(
  `3101.01` =list(
    file_name = "310101",
    url = "http://www.abs.gov.au/AUSSTATS/ABS@Archive.nsf/log?openagent&310101.xls&3101.0&Time%20Series%20Spreadsheet&21C9161183317232CA2581470023DBFD&0&Dec%202016&27.06.2017&Latest"
  ),
  `3401.01` =list(
    file_name = "340101",
    url = "http://www.abs.gov.au/ausstats/abs@archive.nsf/log?openagent&340101.xls&3401.0&Time%20Series%20Spreadsheet&41035B9DD8424994CA25817C00175219&0&Jun%202017&15.08.2017&Latest"
  ),
  `3401.02` =list(
    file_name = "340102",
    url = "http://www.abs.gov.au/ausstats/abs@archive.nsf/log?openagent&340102.xls&3401.0&Time%20Series%20Spreadsheet&B3DDF0CC880C5BA4CA25817C0017524B&0&Jun%202017&15.08.2017&Latest"
  )
)
