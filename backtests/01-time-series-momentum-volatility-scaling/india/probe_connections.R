source("/mnt/hollandC/StockViz/R/config.r")
suppressPackageStartupMessages(library(RODBC))
try_one <- function(label, conn) {
  ch <- tryCatch(odbcDriverConnect(conn, case="nochange", believeNRows=TRUE), error=function(e) e)
  if (inherits(ch,"error") || !is.numeric(ch)) { cat(label, "FAILED\n"); return(invisible(NULL)) }
  x <- sqlQuery(ch, "select top 1 index_name,time_stamp,px_close from bhav_index order by time_stamp", stringsAsFactors=FALSE)
  cat(label, if (is.data.frame(x)) "OK\n" else paste("QUERY_FAILED", paste(x, collapse=" | "), "\n"))
  try(odbcClose(ch),silent=TRUE)
}
try_one("local-norway", sprintf("Driver={ODBC Driver 17 for SQL Server};Server=%s;Database=StockViz;Uid=%s;Pwd=%s;",ldbserver,ldbuser,ldbpassword))
try_one("azure", sprintf("Driver={ODBC Driver 17 for SQL Server};Server=%s;Database=%s;Uid=%s;Pwd=%s;",dbserver,dbname,dbuser,dbpassword))
try_one("local-norway-dbname-lower", sprintf("Driver={ODBC Driver 17 for SQL Server};Server=%s;Database=%s;Uid=%s;Pwd=%s;",ldbserver,ldbname,ldbuser,ldbpassword))
