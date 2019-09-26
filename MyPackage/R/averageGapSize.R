#' Calculate the average gap size
#' @param inputId A string of he unique identifier
#' @return The average gap size
#' @example averageGapSize(aList(dataset)[[1]])
#' @export

averageGapSize <- function(individualDataset) {
  gap_size = gapSize(individualDataset)
  gap_row = gapRow(individualDataset)
  average_gapSize = gap_size/gap_row
  return(average_gapSize)
}
