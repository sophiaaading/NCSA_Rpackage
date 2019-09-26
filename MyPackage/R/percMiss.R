#' Calculate the percentage of missing data
#' @param individualDataset A individual dataset
#' @return The percentage of missing data
#' @example percMiss(aList(dataset)[[1]])
#' @export

percMiss <- function(individualDataset) {
  # nRow = rows(individualDataset)
  # gap_size = gapSize(individualDataset)
  # percent_missing = abs(gap_size/nRow)*100

  nRow = rows(individualDataset)
  gap_size = gapSize(individualDataset)
  percent_missing = abs(gap_size/nRow)*100

  return (percent_missing)
}
