#' Calculate the most commonn time gap.
#' @param inputId A string of he unique identifier.
#' @return The most common time gap.
#' @example aveTimeGap(aList(dataset)[[1]])
#' @export

aveTimeGap <- function(individualDataset) {
  x = NULL
  new.date.time <- as.POSIXct(individualDataset$DisplayTime, format="%Y-%m-%d %H:%M:%S")
  n = nrow(individualDataset)-1
  for (i in 1:n) {
    timeGap = difftime(new.date.time[i+1], new.date.time[i], units = "mins")
    x[i] = timeGap
  }
  frame_x = data.frame(sort(table(x)))
  return(unfactor(frame_x[nrow(frame_x),1]))
}
