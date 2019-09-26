#' Imputation with ARIMA Model
#' @param individualDataset individual dataset
#' @return The dataset after imputed by ARIMA Model
#' @example impu_arima(aList(clean(dataset))[[1]])
#' @export

# install.packages("forecast")
# library("forecast")

impu_arima <- function(individualDataset) {
  impu <- naInsert(individualDataset)
  t <- impu[,1]
  x0 <- x <- zoo(unfactor(impu[,3]), t)
  fit <- auto.arima(x)
  kr <- KalmanRun(x, fit$model)
  id.na <- which(is.na(x))
  for (i in id.na) {
    x[i] <- fit$model$Z %*% kr$states[i,]
  }


  plot(x0, xlab = "DisplayTime", ylab = "GlucoseValue")
  points(t[id.na], x[id.na], col = "red", pch = 20)

  # print(t[id.na])
  # print(x[id.na])


  return(x)
}
