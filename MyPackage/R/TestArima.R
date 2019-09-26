# cleandata = clean(dataset)
# data = aList(cleandata)
# #
# Imputation by Arima Model
# impu_arima(data[[1]])

##Test: 5 measurement missing in a row

# impu <- naInsert(data[[1]])
# t <- impu[,1]
# x0 <- x <- zoo(unfactor(impu[,3]), t)
# y <- x
# # set 10 missing values
# x[c(60:71)] <- NA
# # fit model
# fit <- auto.arima(x)
# kr <- KalmanRun(x, fit$model)
# id.na <- which(is.na(x))
#
# for (i in id.na) {
#   y[i] <- fit$model$Z %*% kr$states[i,]
# }
# #plot
# par(mfrow = c(2, 1), mar = c(2.7,2.7,2,2))
# plot(x0, col = "grey", xlab = "DisplayTime", ylab = "GlucoseValue")
# lines(x)
# points(t[id.na], x0[id.na], col = "blue", pch = 19)
# points(t[id.na], y[id.na], col = "red", pch = 17)
# legend("topright", legend = c("true values", "imputed values"), col = c("blue", "red"), pch = c(19, 17))
#
# # t[60:71]
# plot(t[60:71], x0[60:71], type = "b", col = "blue", pch = 19, ylim = range(y[60:71]), xlab = "DisplayTime", ylab = "GlucoseValue")
# points(t[60:71], y[60:71], col = "red", pch = 17)
# lines(t[101:200], y[101:200], col = "red")
# legend("topright", legend = c("true values", "imputed values"), col = c("blue", "red"), pch = c(19, 17), lty = c(1, 1))


