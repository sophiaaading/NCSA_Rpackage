#' Detect the time gap more than 5 min
#' @param inputId A string of he unique identifier
#' @return The gaps in time series
#' @example gapSize("1636-69-026")
#' @export


#install.packages("lubridate")
#library("lubridate")

gapSize <- function(inputId) {
  patient = makeList(inputId)
  new.date.time <- as.POSIXct(patient$InternalTime, format="%Y-%m-%d %H:%M:%S")
  TotalGapNum = 0
  TotalGapSize = 0
  Row_gap = 0
  for (i in 2:nrow(patient)) {
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

    ID = c(inputId)
    if (round(timeGap_num) != 5) {
      df = data.frame(ID, new.date.time[i-1], new.date.time[i], gapSize, timeGap_num)
      colnames(df) = c("ID","t1","t2","gap size", "time gap")
      TotalGapNum = TotalGapNum

      # print(df)
    }

    if (format(as.Date(new.date.time[i]), "%Y") != format(as.Date(new.date.time[i-1]), "%Y")) {
      cat("There's a big gap between ", format(new.date.time[i], "%Y-%m-%d %H:%M:%S" ), " and ", format(new.date.time[i-1],"%Y-%m-%d %H:%M:%S"), "\n")
    }
  }

  # gap = data.frame(cat("Total Gap Size is: " , TotalGapSize), cat("\nTotal Gap Num: " , totalGapNum, "\n"), cat("Total row of gap is: " , row_gap, "\n"))
  return(TotalGapSize)
}
