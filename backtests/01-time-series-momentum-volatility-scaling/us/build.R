source("../common.R")

OUT_DIR <- "."
dir.create(OUT_DIR, recursive = TRUE, showWarnings = FALSE)

con <- open_sql("stockvizus2")
on.exit(try(suppressWarnings(odbcClose(con)), silent = TRUE), add = TRUE)

# These are liquid US ETF proxies for the paper's multi-asset futures idea.
# They are an adaptation, not a literal replication of the original futures panel.
symbols <- c("SPY", "QQQ", "IWM", "TLT", "GLD", "DBC")
px <- sql_dt(con, sprintf(
  "select SYMBOL, TIME_STAMP, C from BHAV_EQ_TD where SYMBOL in (%s) and C > 0 order by SYMBOL, TIME_STAMP",
  paste(sprintf("'%s'", symbols), collapse = ",")
))
names(px) <- toupper(names(px))
px[, TIME_STAMP := as.Date(TIME_STAMP)]
px[, C := as.numeric(C)]
px <- px[is.finite(C) & C > 0 & !is.na(TIME_STAMP)]
px <- unique(px, by = c("SYMBOL", "TIME_STAMP"))
prices <- long_to_xts(px, "TIME_STAMP", "C", "SYMBOL")
prices <- prices[, symbols[symbols %in% colnames(prices)], drop = FALSE]

result <- make_tsmom(prices, cost = 0.0010, asset_class = "US: ETF proxies for multi-asset futures")
metrics <- save_study(result, OUT_DIR)
cat(sprintf("US build complete: %d assets, %d dates, %d metric rows\n", NCOL(prices), NROW(prices), nrow(metrics)))
