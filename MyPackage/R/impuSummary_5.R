# install.packages("hydroGOF")
# library("hydroGOF")
# install.packages("FSMUMI")
# library("FSMUMI")
#library("MLmetrics")
# # cleandata = clean(dataset)
# # data = aList(cleandata)
#
# impuGV <- naInsert(data[[1]])
# t <- impuGV[,1]
# x0 <- x <- y <- zoo(unfactor(impuGV[,3]), t)[c(250:500)]
# t1 = index(x0)
#
# #For 5 missing values
#
# #imputeTS
#
# #linear"
# trueValue <- x[c(21:25)]
# x[c(21:25)] <- NA
# y[c(21:25)] <- NA
# fit1 <- na_interpolation(x, option = "linear", maxgap = Inf)
# imputedValue1 <- fit1[21:25]
# tv <- vector()
# iv1 <- vector()
# sum1 = 0
# for (i in 1:5) {
#   tv[i] = as.numeric(trueValue[i])
#   iv1[i] = as.numeric(imputedValue1[i])
#   sum1 = sum1 + abs(iv1[i]-tv[i])
# }
# mad1 = sum1/5
# rmse1 = rmse(tv,iv1)
# mape1 = MAPE(iv1,tv)*100
# ioa1 = d(iv1,tv)
# # Fractional Bias: This value lies in the range −2 to +2 and desiredv alue is 0.
# fb1 = compute.fb(iv1,tv,verbose = F)
#
# #spline
#
# fit2 <- na_interpolation(x, option = "spline", maxgap = Inf)
# imputedValue2 <- fit2[21:25]
# iv2 <- vector()
# sum2 = 0
# for (i in 1:5) {
#   tv[i] = as.numeric(trueValue[i])
#   iv2[i] = as.numeric(imputedValue2[i])
#   sum2 = sum2 + abs(iv2[i]-tv[i])
# }
# mad2 = sum2/5
# rmse2 = rmse(tv,iv2)
# mape2 = MAPE(iv2,tv)*100
# ioa2 = d(iv2,tv)
# fb2 = compute.fb(iv2,tv,verbose = F)
#
# #stine
#
# fit3 <- na_interpolation(x, option = "stine", maxgap = Inf)
# imputedValue3 <- fit3[21:25]
# iv3 <- vector()
# sum3 = 0
# for (i in 1:5) {
#   tv[i] = as.numeric(trueValue[i])
#   iv3[i] = as.numeric(imputedValue3[i])
#   sum3 = sum3 + abs(iv3[i]-tv[i])
# }
# mad3 = sum3/5
# rmse3 = rmse(tv,iv3)
# mape3 = MAPE(iv3,tv)*100
# ioa3 = d(iv3,tv)
# fb3 = compute.fb(iv3,tv,verbose = F)
#
# #na_kalman
#
# fit4 <- na_kalman(x, model = "StructTS", smooth = TRUE)
# imputedValue4 <- fit4[21:25]
# iv4 <- vector()
# sum4 = 0
# for (i in 1:5) {
#   tv[i] = as.numeric(trueValue[i])
#   iv4[i] = as.numeric(imputedValue4[i])
#   sum4 = sum4 + abs(iv4[i]-tv[i])
# }
# mad4 = sum4/5
# rmse4 = rmse(tv,iv4)
# mape4 = MAPE(iv4,tv)*100
# ioa4 = d(iv4,tv)
# fb4 = compute.fb(iv4,tv,verbose = F)
#
# #na_locf
#
# fit5 <-  na_locf(x, option = "locf", na_remaining = "rev", maxgap = Inf)
# imputedValue5 <- fit5[21:25]
# iv5 <- vector()
# sum5 = 0
# for (i in 1:5) {
#   tv[i] = as.numeric(trueValue[i])
#   iv5[i] = as.numeric(imputedValue5[i])
#   sum5 = sum5 + abs(iv5[i]-tv[i])
# }
# mad5 = sum5/5
# rmse5 = rmse(tv,iv5)
# mape5 = MAPE(iv5,tv)*100
# ioa5 = d(iv5,tv)
# fb5 = compute.fb(iv5,tv,verbose = F)
#
#
# fit6 <- auto.arima(y)
# kr <- KalmanRun(y, fit6$model)
# id.na <- which(is.na(y))
# for (i in id.na) {
#   y[i] <- fit6$model$Z %*% kr$states[i,]
# }
# imputedValue6 <- y[21:25]
# iv6 <- vector()
# sum6 = 0
# for (i in 1:5) {
#   tv[i] = as.numeric(trueValue[i])
#   iv6[i] = as.numeric(imputedValue6[i])
#   sum6 = sum6 + abs(iv6[i]-tv[i])
# }
# mad6 = sum6/5
# rmse6 = rmse(tv,iv5)
# mape6 = MAPE(iv6,tv)*100
# ioa6 = d(iv6,tv)
# fb6 = compute.fb(iv6,tv,verbose = F)
#
# MethodName = c("na_interpolation linear", "na_interpolation spline", "na_interpolation stine", "na_kalman", "na_locf", "ARIMA")
# MAD = c(mad1, mad2, mad3, mad4, mad5, mad6)
# RMSE = c(rmse1, rmse2, rmse3, rmse4, rmse5, rmse6)
# MAPE = c(mape1, mape2, mape3, mape4, mape5, mape6)
# IOA = c(ioa1, ioa2, ioa3, ioa4, ioa5, ioa6)
# FB = c(fb1, fb2, fb3, fb3, fb4, fb5, fb6)
# st = data.frame(rbind(MethodName, MAD, RMSE, MAPE, IOA, FB))[1:6]
