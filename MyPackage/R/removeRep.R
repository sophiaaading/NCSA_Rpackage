#' #' Give the Glucose Value and Internal Time basing on ID
#' #' @param inputDataset A input dataset
#' #' @return A table removed repeated entries in time domain
#' #' @example removeRep(dataset)
#' #' @export
#'
#' removeRep <- function(inputDataset) {
#'
#'   #Remove the rows that contain the same data for all entries
#'   newList <- unique(inputDataset)
#'
#'   #If t1=t2, use t2 delete t1
#'   for (i in 1:nrow(myList)) {
#'     if (newList[i, InternalTime] == myList[i+1, InternalTime]){
#'       newList <- newList[-newList[i,]]
#'     }
#'   }
#'   return(newList)
#' }
