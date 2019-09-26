#' Plot the Glucose Value on y-axis and Internal Time on x-axis basing on ID
#' @param inputId A string of he unique identifier
#' @return Number of days recorded for Glucose Value
#' @example countDays("1636-69-001")
#' @export

countDays <- function(inputId){
  patient = makeList(inputId)
  new.date.time <- as.POSIXct(patient$InternalTime, format="%Y-%m-%d %H:%M:%S")
  start_time = new.date.time[1]
  print(start_time)
  end_time = new.date.time[length(new.date.time)]
  print(end_time)
  dayCount = difftime(end_time, start_time, unit="days")
  return(dayCount)
}
