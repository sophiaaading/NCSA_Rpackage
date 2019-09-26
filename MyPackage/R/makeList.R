#' Listing the data for individual patient
#' @param inputData An imported dataset
#' @return A table containing the Glucose Value and Internal Time for a specific individual
#' @example aList(dataset)
#' @export
aList <- function(inputData) {
  framedData <- as.data.frame(inputData)
  framedData <- subset(framedData, select = c(subjectId, DisplayTime, GlucoseValue))
  splitData <- split(framedData, framedData$subjectId)
  return(splitData)
}
