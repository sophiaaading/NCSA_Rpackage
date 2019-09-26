#' imputation
#' @param inputId An input dataset
#' @return total rows of the dataset including NAs
#' @example totalRow("1636-69-026")
#' @export

#install.packages("zoo")
#install.packages("xts")
#library(zoo)
#library(xts)
#library("chron")
#mark indipendencies

totalRow <- function(inputId) {
  new_df = imputation(inputId)
  nRow = nrow(new_df)
  return(nRow)
}
