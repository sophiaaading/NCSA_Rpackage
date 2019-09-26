#' Plot the Glucose Value on y-axis and Internal Time on x-axis basing on ID
#' @param inputId A string of he unique identifier
#' @return A GV plot
#' @example plotGV("1636-69-001", "2016-02-03 00:05:23", "2016-02-03 02:05:23")
#' @export

#library(ggplot2)
plotGV <- function(inputId, start_time, end_time) {
  newList_1 <- makeList(inputId)
  index_start = which(newList_1[,2] == start_time)
  index_end = which(newList_1[,2] == end_time)

  newList_2 = newList_1[index_start:index_end,]
  gg <- ggplot(newList_2,aes(x=InternalTime, y=GlucoseValue)) + geom_point() + labs(title="GlucoseValue") + theme(axis.text.x = element_text(angle = 90, hjust = 1))
  return(gg)



}
