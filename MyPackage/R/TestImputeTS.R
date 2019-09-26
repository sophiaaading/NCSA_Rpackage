# # install.packages("imputeTS")
# # library("imputeTS")
# # install.packages("DescTools")
# # library("DescTools")
# cleandata = clean(dataset)
# data = aList(cleandata)


#imputation by imputeTS package
# impu <- naInsert(data[[1]])
# t <- impu[,1]
# x0 <- x <- zoo(unfactor(impu[,3]), t)[c(250:300)]
# t1 = index(x0)
# # set 5 missing values
# x[c(21:25)] <- NA
# par(mfrow = c(5, 1), mar = c(2.7,2.7,2,2))
#
# # fit model--------------------------------------------------------------------------------------------------
# #Perform imputation with na_interpolation stine model
# fit1 <- na_interpolation(x, option = "linear", maxgap = Inf)
# id.na <- which(is.na(x))
# #plot
# plot(x0, col = "grey", main = "na_interpolation linear", xlab = "DisplayTime", ylab = "GlucoseValue")
# lines(x)
# points(t1[id.na], x0[id.na], col = "blue", pch = 19)
# points(t1[id.na], fit1[id.na], col = "red", pch = 17)
# legend("topright", legend = c("true values", "imputed values"), col = c("blue", "red"), pch = c(19, 17))
#
# # fit model--------------------------------------------------------------------------------------------------
# #Perform imputation with na_interpolation stine model
# fit2 <- na_interpolation(x, option = "spline", maxgap = Inf)
# id.na <- which(is.na(x))
# #plot
# plot(x0, col = "grey", main = "na_interpolation spline", xlab = "DisplayTime", ylab = "GlucoseValue")
# lines(x)
# points(t1[id.na], x0[id.na], col = "blue", pch = 19)
# points(t1[id.na], fit2[id.na], col = "red", pch = 17)
# legend("topright", legend = c("true values", "imputed values"), col = c("blue", "red"), pch = c(19, 17))
#
# # fit model--------------------------------------------------------------------------------------------------
# #Perform imputation with na_interpolation stine model
# fit3 <- na_interpolation(x, option = "stine", maxgap = Inf)
# id.na <- which(is.na(x))
# #plot
# plot(x0, col = "grey", main = "na_interpolation stine", xlab = "DisplayTime", ylab = "GlucoseValue")
# lines(x)
# points(t1[id.na], x0[id.na], col = "blue", pch = 19)
# points(t1[id.na], fit3[id.na], col = "red", pch = 17)
# legend("topright", legend = c("true values", "imputed values"), col = c("blue", "red"), pch = c(19, 17))
#
# # fit model--------------------------------------------------------------------------------------------------
# #Perform imputation with KalmanSmooth and StructTS model
# fit4 <- na_kalman(x, model = "StructTS", smooth = TRUE)
# id.na <- which(is.na(x))
#
# #plot
# plot(x0, col = "grey", main = "na_kalman", xlab = "DisplayTime", ylab = "GlucoseValue")
# lines(x)
# points(t1[id.na], x0[id.na], col = "blue", pch = 19)
# points(t1[id.na], fit4[id.na], col = "red", pch = 17)
# legend("topright", legend = c("true values", "imputed values"), col = c("blue", "red"), pch = c(19, 17))
#
# # fit model---------------------------------------------------------------------------------------------------
# #Perform imputation with na_locf (Last Observation Car- ried Forward) Model
# fit5 <-  na_locf(x, option = "locf", na_remaining = "rev", maxgap = Inf)
# id.na <- which(is.na(x))
# #plot
# plot(x0, col = "grey", main = "na_locf", xlab = "DisplayTime", ylab = "GlucoseValue")
# lines(x)
# points(t1[id.na], x0[id.na], col = "blue", pch = 19)
# points(t1[id.na], fit5[id.na], col = "red", pch = 17)
# legend("topright", legend = c("true values", "imputed values"), col = c("blue", "red"), pch = c(19, 17))


