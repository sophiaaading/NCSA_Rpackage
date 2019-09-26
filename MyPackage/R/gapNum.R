#' Detect the time gap more than 5 min
#' @param individualSubset A subset of data for each individual
#' @return The gaps in time series
#' @example gapNum(aList(dataset)[[1]])
#' @export


#install.packages("lubridate")

gapNum <- function(individualSubset) {
  new.date.time <- as.POSIXct(individualSubset$DisplayTime, format="%Y-%m-%d %H:%M:%S")
  TotalGapNum = 0
  TotalGapSize = 0
  Row_gap = 0
  new_df = data.frame()

  for (i in 2:nrow(individualSubset)) {
    options(scipen=999)
    timeGap = difftime(new.date.time[i], new.date.time[i-1], units = "mins")
    timeGap_num = abs(as.numeric(timeGap, units = "mins"))
    if (round(timeGap_num) != 5) {
      gapSize = abs(floor(timeGap_num / 5)-1)

      TotalGapSize = TotalGapSize + gapSize
      totalGapSize <<- TotalGapSize

      TotalGapNum = TotalGapNum + timeGap_num
      totalGapNum <<- TotalGapNum

      Row_gap = Row_gap + 1
      row_gap <<- Row_gap

    } else {
      gapSize = 0
    }

    if (round(timeGap_num) != 5) {
      df = data.frame(individualSubset$subjectId[i], new.date.time[i-1], new.date.time[i], gapSize, timeGap_num)
      colnames(df) = c("ID","t1","t2","gap_size", "time_gap")
      TotalGapNum = TotalGapNum
      new_df = rbind(new_df,df)
    }
  }
  return(new_df)
}
