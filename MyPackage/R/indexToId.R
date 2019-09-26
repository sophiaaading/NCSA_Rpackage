#' Rows counting
#' @param individualDataset An individual dataset
#' @return number of total rows
#' @example indexToId(aList(dataset)[[1]])
#' @export

indexToId <- function(individualDataset) {
  uniqueId = unfactor(unique(individualDataset$subjectId))
  return(uniqueId)
}
