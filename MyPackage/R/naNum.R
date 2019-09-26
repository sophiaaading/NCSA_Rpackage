#' Report the number of NAs in the dataset for a certain individual
#' @param inputId inputId
#' @return The the number of NAs
#' @example naNum(aList(dataset)[[1]])
#' @export

naNum <- function(individualDataset) {
  numNa = 0
  for (i in 1:nrow(individualDataset)) {
    if (is.na(individualDataset[i,3]) == TRUE) {
      numNa = numNa + 1
    }
  }
  return(numNa)
}
