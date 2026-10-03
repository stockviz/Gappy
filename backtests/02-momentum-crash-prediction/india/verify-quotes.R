# Independent source-table audit for the India futures momentum book.
# Run after build.R from this directory: Rscript verify-quotes.R
suppressPackageStartupMessages({
  library(RODBC)
  library(data.table)
})
source("/mnt/hollandC/StockViz/R/config.r")

cp <- readRDS("checkpoint.rds")
stopifnot(length(cp$rollDates) == length(cp$rollExpiry),
          nrow(cp$eligibility) == length(cp$rollDates),
          nrow(cp$coverage) == length(cp$btDates))
con <- odbcDriverConnect(sprintf(
  "Driver={ODBC Driver 17 for SQL Server};Server=%s;Database=StockViz;Uid=%s;Pwd=%s;",
  ldbserver, ldbuser, ldbpassword), case = "nochange")
if (!is.numeric(con) || con < 1L) stop("could not open futures database")
quoted_dates <- paste(sprintf("'%s'", as.character(cp$rollDates)), collapse = ",")
q <- sprintf(paste(
  "SELECT SYMBOL,TIME_STAMP,EXPIRY_DT,PX_CLOSE FROM BHAV_EQ_FUT",
  "WHERE OPTION_TYP='XX' AND STRIKE_PR=0 AND PX_CLOSE>0",
  "AND TIME_STAMP IN (%s)"), quoted_dates)
quotes <- sqlQuery(con, q, stringsAsFactors = FALSE)
odbcClose(con)
if (!is.data.frame(quotes) || !nrow(quotes)) stop("no historical futures quotes returned")
quotes <- as.data.table(quotes)
quotes[, TIME_STAMP := as.Date(TIME_STAMP)]
quotes[, EXPIRY_DT := as.Date(EXPIRY_DT)]
setkey(quotes, TIME_STAMP, EXPIRY_DT)

selected <- 0L
for (j in seq_along(cp$rollDates)) {
  rd <- cp$rollDates[j]
  expiry <- cp$rollExpiry[j]
  syms <- c(cp$longByRoll[[as.character(rd)]],
            cp$shortByRoll[[as.character(rd)]])
  if (length(syms) != 2L * cp$params$top_n || anyDuplicated(syms)) {
    stop(sprintf("incomplete or overlapping book on %s", rd))
  }
  live <- quotes[.(rd, expiry), SYMBOL]
  missing <- setdiff(syms, live)
  if (length(missing)) stop(sprintf("unquoted contract on %s (%s): %s",
                                    rd, expiry, paste(missing, collapse = ",")))
  selected <- selected + length(syms)
}

coverage <- as.data.table(cp$coverage)[long_held > 0L & short_held > 0L]
if (!nrow(coverage) ||
    any(coverage$long_held - coverage$long_live > 2L) ||
    any(coverage$short_held - coverage$short_live > 2L) ||
    mean(coverage$long_live) / cp$params$top_n < 0.95 ||
    mean(coverage$short_live) / cp$params$top_n < 0.95) {
  stop("held-contract return coverage failed")
}
cat(sprintf("PASS: %d rolls, %d selected futures verified against same-day",
            length(cp$rollDates), selected),
    "next-contract database quotes.\n")
cat(sprintf("Daily held-return coverage: long %.3f/%d, short %.3f/%d;",
            mean(coverage$long_live), cp$params$top_n,
            mean(coverage$short_live), cp$params$top_n),
    sprintf("max missing long %d, short %d.\n",
            max(coverage$long_held - coverage$long_live),
            max(coverage$short_held - coverage$short_live)))
