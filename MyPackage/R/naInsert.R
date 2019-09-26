#' insert NAs
#' @param individualDataset An individual dataset
#' @return dataset after insertin NAa
#' @example naInsert(aList(clean(dataset))[[1]])
#' @export

naInsert <- function(individualDataset) {
  df1 <- individualDataset[order(individualDataset$DisplayTime),]
  df1$DisplayTime <- as.POSIXct(unfactor(df1$DisplayTime),format="%Y-%m-%d %H:%M")
  from = as.POSIXct(df1[1,2], format="%Y-%m-%d %H:%M")
  to = as.POSIXct(df1[nrow(df1),2], format="%Y-%m-%d %H:%M")
  DisplayTime <- seq(from, to, by=(60*5))
  df2 <- data.frame(DisplayTime)
  df3 = unfactor(merge(df1, df2, all = TRUE))
  indexToRemove = vector()

  for (i in 2:nrow(df3)) {
    if (difftime(df3[i,1], df3[i-1,1], units = "mins") <= 1) {
      # if (is.na(df3[i-1,3])) {
      #   indexToRemove[i-1] = as.numeric(rownames(impuGV[i-1,]))
      # }
      if (is.na(df3[i,3])) {
        indexToRemove = append(indexToRemove, as.numeric(rownames(df3[i,])))
      }
    }
  }
  updated_df3 = df3[ !(rownames(df3) %in% indexToRemove), ]
  return(updated_df3)
}
