#' ID to index
#' @param inputId A unique ID
#' @return The index of the ID
#' @example idToIndex("1636-69-026")
#' @export

idToIndex <- function(inputId) {
  id = strsplit(unfactor(unique(dataset$subjectId))," ")
  index = which(inputId==id)
  return(index)
}
