#' Rows counting
#' @param individualDataset An individual dataset
#' @return number of total rows
#' @example rows(aList(dataset)[[1]])
#' @export

id <- function(individualDataset) {
  uniqueId = unfactor(unique(individualDataset$subjectId))
  return(uniqueId)
}
