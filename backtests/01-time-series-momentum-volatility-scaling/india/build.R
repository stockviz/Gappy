source("../common.R")

OUT_DIR <- "."
dir.create(OUT_DIR, recursive = TRUE, showWarnings = FALSE)

# Purpose: construct a contract-safe daily MCX return series without crossing expiries.
mcx_contract_safe_prices <- function(con, contracts) {
  sql <- sprintf(
    "select CONTRACT, TIME_STAMP, PX_CLOSE, EXPIRY, OTYPE from bhav_com_mcx where CONTRACT in (%s) and OTYPE in ('FUTCOM','XX') and PX_CLOSE > 0 order by CONTRACT, TIME_STAMP, EXPIRY",
    paste(sprintf("'%s'", contracts), collapse = ",")
  )
  d <- sql_dt(con, sql)
  names(d) <- toupper(names(d))
  d[, TIME_STAMP := as.Date(TIME_STAMP)]
  d[, EXPIRY := as.Date(EXPIRY)]
  d[, PX_CLOSE := as.numeric(PX_CLOSE)]
  d <- d[is.finite(PX_CLOSE) & PX_CLOSE > 0 & !is.na(TIME_STAMP) & !is.na(EXPIRY)]
  d <- unique(d, by = c("CONTRACT", "TIME_STAMP", "EXPIRY"))
  out <- list()
  for (sym in contracts) {
    z <- d[CONTRACT == sym]
    if (!nrow(z)) next
    dates <- sort(unique(z$TIME_STAMP))
    held <- data.table(date = dates, expiry = as.Date(NA), price = NA_real_)
    for (i in seq_len(nrow(held))) {
      dd <- held$date[i]
      cand <- z[TIME_STAMP == dd & EXPIRY >= dd + 5L][order(EXPIRY)]
      if (!nrow(cand)) cand <- z[TIME_STAMP == dd][order(EXPIRY)]
      if (nrow(cand)) {
        held$expiry[i] <- cand$EXPIRY[1L]
        held$price[i] <- cand$PX_CLOSE[1L]
      }
    }
    held <- held[is.finite(price)]
    if (nrow(held) < 500L) next
    held[, ret := NA_real_]
    for (i in 2:nrow(held)) {
      # At a roll, do not divide one contract by another. The first day of
      # the new contract is a zero-return roll boundary.
      if (held$expiry[i] == held$expiry[i - 1L]) held$ret[i] <- held$price[i] / held$price[i - 1L] - 1
      else held$ret[i] <- 0
    }
    held$ret[!is.finite(held$ret)] <- NA_real_
    held[, synthetic := cumprod(1 + fifelse(is.finite(ret), ret, 0))]
    out[[sym]] <- held[, .(date, synthetic)]
    fwrite(held, file.path(OUT_DIR, paste0("mcx_", sym, "_contract_audit.csv")))
  }
  if (!length(out)) stop("No MCX contract series passed the minimum history check")
  wide <- Reduce(function(a, b) merge(a, b, by = "date", all = TRUE), lapply(names(out), function(nm) {
    x <- out[[nm]]; setnames(x, "synthetic", nm); x
  }))
  wide
}

con <- open_sql("StockViz")
on.exit(try(suppressWarnings(odbcClose(con)), silent = TRUE), add = TRUE)

indices <- c("NIFTY 50 TR", "NIFTY MIDCAP 150 TR", "NIFTY MIDCAP SELECT TR", "NIFTY SMALLCAP 250 TR")
idx <- sql_dt(con, sprintf(
  "select INDEX_NAME, TIME_STAMP, PX_CLOSE from bhav_index where INDEX_NAME in (%s) and PX_CLOSE > 0 order by INDEX_NAME, TIME_STAMP",
  paste(sprintf("'%s'", indices), collapse = ",")
))
names(idx) <- toupper(names(idx))
idx[, TIME_STAMP := as.Date(TIME_STAMP)]
idx[, PX_CLOSE := as.numeric(PX_CLOSE)]
idx <- idx[is.finite(PX_CLOSE) & !is.na(TIME_STAMP)]
idx <- unique(idx, by = c("INDEX_NAME", "TIME_STAMP"))
idx_prices <- long_to_xts(idx, "TIME_STAMP", "PX_CLOSE", "INDEX_NAME")
colnames(idx_prices) <- make.names(colnames(idx_prices))

mcx <- mcx_contract_safe_prices(con, c("GOLD", "SILVER", "CRUDEOIL", "COPPER"))
mcx_prices <- xts(as.matrix(mcx[, -1]), order.by = mcx$date)
colnames(mcx_prices) <- setdiff(names(mcx), "date")

prices <- merge(idx_prices, mcx_prices, all = TRUE)
prices <- prices[order(index(prices))]
prices <- prices[, !duplicated(colnames(prices)), drop = FALSE]

result <- make_tsmom(prices, cost = 0.0025, asset_class = "India: NIFTY TR + MCX contract-safe roll-boundary returns")
metrics <- save_study(result, OUT_DIR)
cat(sprintf("India build complete: %d assets, %d dates, %d metric rows\n", NCOL(prices), NROW(prices), nrow(metrics)))
