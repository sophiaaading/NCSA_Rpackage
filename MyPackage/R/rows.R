#' Rows counting
#' @param individualDataset An individual dataset
#' @return number of total rows
#' @example rows(aList(dataset)[[1]])
#' @export

rows <- function(individualDataset) {
  df1 <- individualDataset[order(individualDataset$DisplayTime),]
  from = as.POSIXct(df1[1,2])
  to = as.POSIXct(df1[nrow(df1),2])
  DisplayTime <- seq(from, to, by=(60*5))
  df2 <- data.frame(DisplayTime)
  row <- nrow(df2)
  return(row)
}
