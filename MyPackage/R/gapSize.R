#' Detect the time gap more than 5 min
#' @param individualDataset An individual dataset
#' @return The gaps in time series
#' @example gapSize(aList(dataset)[[1]])
#' @export


#install.packages("lubridate")
gapSize <- function(individualDataset) {
  new.date.time <- as.POSIXct(individualDataset$DisplayTime, format="%Y-%m-%d %H:%M:%S")
  TotalGapNum = 0
  TotalGapSize = 0
  Row_gap = 0
  for (i in 2:nrow(individualDataset)) {
    timeGap = difftime(new.date.time[i], new.date.time[i-1], units = "mins")
    timeGap_num = as.numeric(timeGap, units = "mins")
    if (round(timeGap_num) != 5) {
      gapSize = floor(timeGap_num / 5)

      TotalGapSize = TotalGapSize + gapSize
      totalGapSize <<- TotalGapSize

      TotalGapNum = TotalGapNum + timeGap_num
      totalGapNum <<- TotalGapNum

      Row_gap = Row_gap + 1
      row_gap <<- Row_gap

    } else {
      gapSize = 0
    }

    # ID = c(inputId)
    if (round(timeGap_num) != 5) {
      df = data.frame(new.date.time[i-1], new.date.time[i], gapSize, timeGap_num)
      colnames(df) = c("t1","t2","gap size", "time gap")
      TotalGapNum = TotalGapNum
    }
  }
  return(abs(TotalGapSize))
}
