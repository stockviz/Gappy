source("/mnt/hollandC/StockViz/R/config.r")
suppressPackageStartupMessages({library(RODBC); library(DBI); library(RPostgres)})

mssql <- odbcDriverConnect(sprintf("Driver={ODBC Driver 17 for SQL Server};Server=%s;Database=StockViz;Uid=%s;Pwd=%s;", ldbserver, ldbuser, ldbpassword), case="nochange", believeNRows=TRUE)
q <- function(sql) { x <- sqlQuery(mssql, sql, stringsAsFactors=FALSE); if (!is.data.frame(x)) stop(paste(x, collapse=" | ")); x }
cat("India index counts\n")
print(q("select index_name, min(time_stamp) first_date, max(time_stamp) last_date, count(*) n from bhav_index where index_name in ('NIFTY 50 TR','NIFTY MIDCAP 150 TR','NIFTY MIDCAP SELECT TR','NIFTY SMALLCAP 250 TR') group by index_name"))
cat("MCX counts\n")
print(q("select CONTRACT, min(time_stamp) first_date, max(time_stamp) last_date, count(*) n, count(distinct expiry) expiries from bhav_com_mcx where CONTRACT in ('GOLD','GOLDM','SILVER','SILVERM','CRUDEOIL','COPPER') and OTYPE in ('FUTCOM','XX') group by CONTRACT"))
try(odbcClose(mssql), silent=TRUE)

us <- odbcDriverConnect(sprintf("Driver={ODBC Driver 17 for SQL Server};Server=%s;Database=stockvizus2;Uid=%s;Pwd=%s;", ldbserver, ldbuser, ldbpassword), case="nochange", believeNRows=TRUE)
q2 <- function(sql) { x <- sqlQuery(us, sql, stringsAsFactors=FALSE); if (!is.data.frame(x)) stop(paste(x, collapse=" | ")); x }
cat("US ETF counts\n")
print(q2("select SYMBOL, min(TIME_STAMP) first_date, max(TIME_STAMP) last_date, count(*) n from BHAV_EQ_TD where SYMBOL in ('SPY','TLT','GLD','DBC','QQQ','IWM') group by SYMBOL"))
try(odbcClose(us), silent=TRUE)

pg <- dbConnect(RPostgres::Postgres(), host=ldbserver2, user=ldbuser2, password=ldbpassword2, dbname=ldbname2, sslmode="allow")
cat("Crypto counts\n")
print(dbGetQuery(pg, "select symbol, min(open_time_ts) first_date, max(open_time_ts) last_date, count(*) n from binance_crypto_historical_1h where symbol in ('BTCUSDT','ETHUSDT') group by symbol"))
dbDisconnect(pg)
