#' Give the Glucose Value and Internal Time basing on ID
#' @param inputId A dataset
#' @return duplicated rows
#' @example ifRep("1636-69-001")
#' @export
ifRep <- function(inputId){
  patient = makeList(inputId)
  gv = patient[,3]
  internalTime = patient[,2]

  #if dup return FALSE -> no duplication
  #if dup return TRUE -> duplication
  dup = FALSE

  if (length(unique(internalTime)) != length(internalTime)) {
    print("There are replications")
    dup = TRUE
  } else {
    print("There is no replication")
    dup = FALSE
  }

  if (dup == TRUE) {
    index <- which(duplicated(internalTime))
  }
  index <- which(duplicated(internalTime))
  return(gv[index])

  #if (dup == FALSE) {
  #}
}
