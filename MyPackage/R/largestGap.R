#' Report the largest gap in the dataset for a certain individual
#' @param inputId inputId
#' @return The largest gap
#' @example largestGap(aList(dataset)[[1]])
#' @export
largestGap <- function(individualDataset) {
  # inputId = indexToId(individualDataset)
  # U = unique(dataset[,3])
  # index = which(U==inputId)
  index = rownames(st[i,])
  original = gapNum(aList(cleandata)[[index]])
  sorted_original = original[order(original$gap_size),]
  biggestGap = sorted_original[nrow(sorted_original),]
  return(biggestGap$gap_size)
}

for (i in nrow(st)) {
  index = rownames(st[i,])
  st[i,6] = largestGap(data[[index]])
}
