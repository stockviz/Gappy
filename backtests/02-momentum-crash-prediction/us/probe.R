# Probe StockVizUs2 schema for the momentum-crash US study.
# Purpose: confirm table columns, date coverage, SPY presence, and adjusted-close availability.
suppressPackageStartupMessages({library(RODBC); library(data.table)})
source("/mnt/hollandC/StockViz/R/config.r")
con <- odbcDriverConnect(sprintf(
  "Driver={ODBC Driver 17 for SQL Server};Server=%s;Database=StockVizUs2;Uid=%s;Pwd=%s;",
  ldbserver, ldbuser, ldbpassword), case = "nochange", believeNRows = TRUE)
on.exit(try(odbcClose(con), silent = TRUE), add = TRUE)
q <- function(sql) { x <- sqlQuery(con, sql, stringsAsFactors = FALSE); if (!is.data.frame(x)) stop(paste(x, collapse = " | ")); as.data.table(x) }

cat("== SP500_CONSTITUENTS columns ==\n")
cols <- q("select top 1 * from SP500_CONSTITUENTS where INDEX_NAME='SPX'")
print(names(cols))
cat("== SP500_CONSTITUENTS coverage ==\n")
cov <- q("select count(*) n, min(PERIOD) minp, max(PERIOD) maxp from SP500_CONSTITUENTS where INDEX_NAME='SPX'")
print(cov)
cat("== distinct snapshots / symbols ==\n")
print(q("select count(distinct PERIOD) n_periods, count(distinct SYMBOL) n_symbols from SP500_CONSTITUENTS where INDEX_NAME='SPX'"))

cat("== BHAV_EQ_TD columns ==\n")
bcols <- q("select top 1 * from BHAV_EQ_TD")
print(names(bcols))
cat("== BHAV_EQ_TD coverage ==\n")
print(q("select count(*) n, min(TIME_STAMP) minp, max(TIME_STAMP) maxp, count(distinct SYMBOL) n_symbols from BHAV_EQ_TD"))
cat("== SPY present? ==\n")
print(q("select count(*) n, min(TIME_STAMP) mn, max(TIME_STAMP) mx from BHAV_EQ_TD where SYMBOL='SPY' and C>0"))
cat("== sample SP500 symbols present in BHAV_EQ_TD ==\n")
print(q("select top 5 SYMBOL, count(*) n, min(TIME_STAMP) mn, max(TIME_STAMP) mx from BHAV_EQ_TD where SYMBOL in ('AAPL','MSFT','GE','XOM','SPY') and C>0 group by SYMBOL order by SYMBOL"))
cat("== does an adjusted-close column exist anywhere in BHAV_EQ_TD? ==\n")
adj <- q("select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='BHAV_EQ_TD'")
print(adj)
