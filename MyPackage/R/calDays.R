#' Calculate the number of days
#' @param inputId A string of he unique identifier.
#' @return The number of days.
#' @example calDays(aList(dataset)[[1]])
#' @export

calDays <- function(individualDataset) {
  new.date.time <- as.POSIXct(individualDataset$DisplayTime, format="%Y-%m-%d %H:%M:%S")
  days = abs(difftime(new.date.time[nrow(individualDataset)], new.date.time[1], units = "days"))
  return (days)
}
