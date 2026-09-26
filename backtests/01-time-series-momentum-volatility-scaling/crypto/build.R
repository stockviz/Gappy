source("../common.R")

OUT_DIR <- "."
dir.create(OUT_DIR, recursive = TRUE, showWarnings = FALSE)

con <- dbConnect(RPostgres::Postgres(), host = ldbserver2, user = ldbuser2,
                 password = ldbpassword2, dbname = ldbname2, sslmode = "allow")
on.exit(try(dbDisconnect(con), silent = TRUE), add = TRUE)

symbols <- c("BTCUSDT", "ETHUSDT")
raw <- dbGetQuery(con, sprintf(
  "select symbol, open_time_ts, px_close from binance_crypto_historical_1h where symbol in (%s) order by symbol, open_time_ts",
  paste(shQuote(symbols), collapse = ",")
))
raw$open_time_ts <- as.POSIXct(raw$open_time_ts, tz = "UTC")
raw$px_close <- as.numeric(raw$px_close)
raw <- raw[is.finite(raw$px_close) & raw$px_close > 0 & !is.na(raw$open_time_ts), ]
raw$date <- as.Date(raw$open_time_ts + 3600, tz = "UTC")
raw <- raw[order(raw$symbol, raw$date, raw$open_time_ts), ]
# Dailyized UTC candles: retain only complete 24-hour groups.
daily <- as.data.table(raw)[, .(px_close = last(px_close), n_hours = .N), by = .(symbol, date)]
audit <- daily[, .(first_date = min(date), last_date = max(date), n_days = .N,
                   incomplete_days = sum(n_hours != 24L), max_hours = max(n_hours)), by = symbol]
fwrite(audit, file.path(OUT_DIR, "hourly_to_daily_audit.csv"))
daily <- daily[n_hours == 24L]
prices <- long_to_xts(daily, "date", "px_close", "symbol")
prices <- prices[, symbols[symbols %in% colnames(prices)], drop = FALSE]

result <- make_tsmom(prices, cost = 0.0005, asset_class = "Crypto: BTCUSDT + ETHUSDT UTC dailyized")
metrics <- save_study(result, OUT_DIR)
cat(sprintf("Crypto build complete: %d assets, %d dates, %d metric rows\n", NCOL(prices), NROW(prices), nrow(metrics)))
