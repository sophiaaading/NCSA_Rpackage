#' Make the summary table for ID, percentage of missing data, average gap size, number of days and equal spaces.
#' @param data An input dataset
#' @return A summary table containing summary data
#' @example summaryTable(dataset)
#' @export

#install.packages("Hmisc")
#library("Hmisc")
summaryTable <- function(data) {
  #vector
  #ID
  id = strsplit(unfactor(unique(data$subjectId))," ")
  uniqueId = c(unfactor(unique(data$subjectId)))

  #numeric vector
  #percentage of missing data
  #average gap size
  perc_missingData <- vector()
  ave_gapSize <- vector()
  num_days <- vector()
  frequent_timeGap <- vector()
  id_index <- vector()
  gap_index <- vector()
  biggestGap <- vector()
  num_nas <- vector()
  table = data.frame()
  L <- aList(data)

  for (j in 1:length(id)) {
    perc_missingData[j] = percMiss(L[[j]])
    ave_gapSize[j] = averageGapSize(L[[j]])
    num_days[j] = calDays(L[[j]])
    frequent_timeGap[j] = aveTimeGap(L[[j]])
    biggestGap[j] = largestGap(L[[j]])
    num_nas[j] = naNum(L[[j]])
  }
  table = data.frame(uniqueId, perc_missingData, ave_gapSize, num_days, frequent_timeGap, biggestGap, num_nas)

  #Add index to the summary table
  id_index = row.names(table)
  table = data.frame(table,id_index)

  # for (i in 1:nrow(table)) {
  #   index[i] = as.numeric(rownames(table$uniqueId[i]))
  # }

  # par(mfrow=c(2,2))
  # #histogram for percentage of missing data
  # his_md <<- hist(table$perc_missingData,col='skyblue3',breaks=50)
  # aa <<- table$perc_missingData
  # sorted_md <<- subset(table, as.numeric(perc_missingData)<100)
  # bb <<- sorted_md$perc_missingData
  # sorted_his <<- hist(sorted_md$perc_missingData, col='skyblue3',breaks=50)
  # # pdf("~/Desktop/test.pdf")
  # sub(aa, bb)
  # dev.off()
  # #
  # #histogram for average gap size
  # his_md <<- hist(table$ave_gapSize,col='skyblue3',breaks=50)
  # cc <<- table$ave_gapSize
  # sorted_md <<- subset(table, as.numeric(ave_gapSize)<30)
  # dd <<- sorted_md$ave_gapSize
  # sorted_his <<- hist(sorted_md$ave_gapSize, col='skyblue3',breaks=50)
  # # pdf("~/Desktop/test2.pdf")
  # sub(cc, dd)
  # dev.off()

  # aa <<- table$num_days
  # sorted_md <<- subset(table, as.numeric(num_days)<10)
  # bb <<- sorted_md$num_days
  # sorted_his <<- hist(sorted_md$num_days, col='skyblue3',breaks=50)
  # pdf("~/Desktop/test3.pdf")
  # sub(aa, bb)
  # dev.off()

  # aa <<- table$frequent_timeGap
  # pdf("~/Desktop/test4.pdf")
  # sub(aa)
  # dev.off()
  #

  # plot perc_missingData
  # pm <- ggplot(table, aes(x=uniqueId, y=perc_missingData)) +
  #   geom_bar(stat = "identity") +
  #   theme(axis.text.x = element_text(angle = 90, hjust = 1))
  # # plot ave_gapSize
  # ag <- ggplot(table, aes(x=uniqueId, y=ave_gapSize)) +
  #   geom_bar(stat = "identity") +
  #   theme(axis.text.x = element_text(angle = 90, hjust = 1))
  # # plot num_days
  # nd <- ggplot(table, aes(x=uniqueId, y=num_days)) +
  #   geom_bar(stat = "identity") +
  #   theme(axis.text.x = element_text(angle = 90, hjust = 1))
  # # plot frequent_timeGap
  # ft <- ggplot(table, aes(x=uniqueId, y=frequent_timeGap)) +
  #   geom_bar(stat = "identity") +
  #   theme(axis.text.x = element_text(angle = 90, hjust = 1))
  # returnsummaryTable(dataset)

  return (table[order(table$perc_missingData),])

}

