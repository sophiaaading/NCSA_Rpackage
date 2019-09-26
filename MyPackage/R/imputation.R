#' imputation
#' @param inputId An input dataset
#' @return imputation
#' @example imputation("1636-69-026") #1636-69-069
#' @export

#install.packages("zoo")
#install.packages("xts")
#library(zoo)
#library(xts)
#library("chron")
#mark indipendencies

imputation <- function(inputId) {
  patient = makeList(inputId)
  df1 <- patient[order(patient$DisplayTime),]
  InternalTime <- seq(df1[1,2], df1[nrow(df1),2], by=(60*5))
  df2 <- data.frame(InternalTime)
  df3 = merge(df1,df2, all=TRUE)
  df4 <- df3

  for (i in 2:nrow(df2)) {
    if (strptime(df4[i,1], format="%Y-%m-%d %H:%M") == strptime(df4[i-1,1], format="%Y-%m-%d %H:%M") ||
        difftime(strptime(df4[i,1], format="%Y-%m-%d %H:%M"), strptime(df4[i-1,1], format="%Y-%m-%d %H:%M"), units = "mins") <= 1) {
      df4 <- df4[-i,]
    }
  }
  nRow <- nrow(df4)
  t <- as.POSIXlt(df4[,1], tz="UTC")
  z <- zoo(as.numeric(df4[,3]), t)
  z.inter1 <- na.approx(z)
  z.inter2 <- na.spline(z)
  par(mfrow=c(1,1))
  plot(z)
  # plot(z.inter1)
  # plot(z.inter2)

  return(df4)
}
