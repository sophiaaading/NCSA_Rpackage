#' Romove the data that not starting around 0:00 and ending around 23;59
#' @param data Imported daclastaset
#' @return A clean dataset
#' @example clean(dataset)
#' @export

#cleandata = clean(dataset)
#data = aList(cleandata)
#data[[1]]


clean <- function(data) {
  table = data.frame()
  L = aList(data)
  st_before = summaryTable(data)
  id = strsplit(unfactor(unique(data$subjectId))," ")

  st_temp = st_before[(nrow(st_before)-8):nrow(st_before),]
  U = unique(st_temp[,1])

  for (i in 1:nrow(st_temp)) {
    index1 = unfactor(st_temp[i,8])
    t <- as.POSIXct(L[[index1]][,2])

    index2 = which.max(gapNum(L[[index1]])[,4])
    t1 <- gapNum(L[[index1]])[index2,2]
    t2 <- gapNum(L[[index1]])[index2,3]

    index3 <- which(t==t1)
    index4 <- which(t==t2)

    df1 <- L[[index1]][1:index3,]
    df2 <- L[[index1]][index4:nrow(L[[index1]]),]
    if (nrow(df1) > nrow(df2)) {
      L[[index1]] <- L[[index1]][1:index3,]
      # table = rbind(table, L[[index1]])
    } else {
      L[[index1]] <- L[[index1]][index4:nrow(L[[index1]]),]
      # table = rbind(table, L[[index1]])
    }

  }

  for (j in 1:length(id)) {
    table = rbind(table, L[[j]])
  }
  return(table)
}
