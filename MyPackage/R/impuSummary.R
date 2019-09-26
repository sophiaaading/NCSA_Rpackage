# # cleandata = clean(dataset)
# # data = aList(cleandata)
#
# impu <- naInsert(data[[1]])
# t <- impu[,1]
# x0 <- x <- zoo(unfactor(impu[,3]), t)[c(250:300)]
# t1 = index(x0)
#
# #Imputation by: "linear" - for linear interpolation using approx
# # set 5 missing values
# trueValue <- x[c(21:25)]
# x[c(21:25)] <- NA
# fit1 <- na_interpolation(x, option = "linear", maxgap = Inf)
# imputedValue <- fit1[21:25]
# tv <- vector()
# iv <- vector()
# sum1 = 0
# for (i in 1:5) {
#   tv[i] = as.numeric(trueValue[i])
#   iv[i] = as.numeric(imputedValue[i])
#   sum1 = sum1 + abs(iv[i]-tv[i])
# }
# mad = sum1/5

