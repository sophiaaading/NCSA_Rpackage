#' Give the Glucose Value and Internal Time basing on ID
#' @param inputId A string of he unique identifier
#' @param data The imported dataset
#' @return A table containing the Glucose Value and Internal Time for that ID
#' @example makeList("1636-69-026")
#' @export
makeList <- function(inputId) {
  framedData <- as.data.frame(dataset)
  result <- subset(framedData, framedData$subjectId == inputId, select = c(subjectId, DisplayTime, GlucoseValue))
  result$DisplayTime <- as.POSIXct(result$DisplayTime, format="%Y-%m-%d %H:%M:%S")
  return(result)
}


