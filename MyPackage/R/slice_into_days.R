#' Slice the time series data into days before cleaning
#' @param inputId A string of he unique identifier
#' @param startTime A integer indicates the starting time for plotting
#' @param endTime A integer indicates the ending time for plotting
#' @return A table removed repeated entries in time domain
#' @example slice_into_days("1636-69-026", 6, 22)
#' @export

#install.packages("dplyr")
#install.packages("chron")
#install.packages("varhandle")
#library(dplyr)
#library(chron)
#library(varhandle)

slice_into_days <- function(inputId, startTime, endTime) {

  patient = makeList(inputId)
  time = as.POSIXlt(patient[,2], tz="UTC")
  start_end = subset(patient,as.numeric(format(time,"%H")) >= startTime & as.numeric(format(time,"%H") <= endTime))
  time_chopped = as.POSIXlt(start_end[,2])
  time_hour = format(time_chopped,"%H:%M:%S")

  gg <- ggplot(start_end,aes(x=time_hour, y=unfactor(GlucoseValue))) +
    geom_point() +
    labs(title="GlucoseValue") +
    facet_wrap(~ as.Date(time_chopped), ncol=2)


  print(gg)

  return(gg)
}
