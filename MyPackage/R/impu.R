#' imputation
#' @param method Method to do imputation
#' @param numGap Number of missing value inserted
#' @return imputation
#' @example impu("imputeTS",5)
#' @export

imputing <- function(method, numGap) {
  if (method == "imputeTS") {
    imputeTS(numGap)
  }

}
