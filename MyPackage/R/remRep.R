#' Remove the replicated data entries
#' @param inputId A dataset
#' @return duplicated rows
#' @example removeRep(dataset)
#' @export
removeRep <- function(inputData) {
  df1 = as.data.frame(inputData)
  df1 = subset(df1, select = c(subjectId, InternalTime, GlucoseValue))
  df1$InternalTime <- as.POSIXct(df1$InternalTime, format="%Y-%m-%d %H:%M:%S")
  df2 <- df1
  # for (i in 2:nrow(df1)) {
  #   if (strptime(df2[i,2], format="%Y-%m-%d %H:%M") == strptime(df2[i-1,2], format="%Y-%m-%d %H:%M")) {
  #     df2 <- df2[-i,]
  #   }
  # }
  for (i in 2:nrow(df1)) {
    if (df2[i,2] == df2[i-1,2]) {
      df2 <- df2[-i,]
    }
  }
  return(df2)
}
