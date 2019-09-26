#' Slice the time series into shorter time period
#' @param inputId A string of he unique identifier
#' @param sliceSize The size for slicing
#' @return A table containing the Glucose Value and Internal Time for that ID
#' @example sliceTime("1636-69-001","2016-02-03")
#' @export

#install.packages("lubridate")
#library("lubridate")

sliceTime <- function(inputId, specific_date, startTime, endTime) {
  patient = makeList(inputId)
  time = as.POSIXlt(patient[,2])
  days = slice_into_days(inputId, 0, 24)
  oneDay = subset(patient,as.Date(format(time,"%Y-%m-%d")) == specific_date)
  # gg <- ggplot(oneDay,aes(x=InternalTime, y=GlucoseValue)) +
  #   geom_point() +
  #   labs(title="GlucoseValue")

  # print(gg)
  thePlot = plot(x=oneDay$InternalTime, y = oneDay$GlucoseValue)
  oo = plot(dataset$InternalTime[1:100], dataset$GlucoseValue[1:100])


  return(oo)
}


