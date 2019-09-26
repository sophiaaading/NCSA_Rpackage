#' Check if the time series is regular or irregular
#' @param individualDataset An individual dataset
#' @return A summary table of checking regularity
#' @example checkRegu(aList(cleandata)[[1]])
#' @export

checkRegu <- function(individualDataset) {
  new.date.time <- as.POSIXct(individualDataset$DisplayTime, format="%Y-%m-%d %H:%M:%S")
  timeDiff <- vector()
  for (i in 1:(nrow(individualDataset)-1)) {
    options(scipen=999)
    timeGap = difftime(new.date.time[i+1], new.date.time[i], units = "mins")
    timeGap_num = abs(as.numeric(timeGap, units = "mins"))
    timeDiff[i] = timeGap_num
  }
  print(hist(timeDiff, xlim =c(0,20), breaks = 500))
  df_timeDiff = as.data.frame(table(timeDiff))
  return(df_timeDiff)
}
