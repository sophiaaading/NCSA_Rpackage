#' Make the summary table for ID, percentage of missing data, average gap size, number of days and equal spaces.
#' @param frequentTimeGap A set
#' @param timeGap a subset
#' @return A summary table containing summary data
#' @example summaryTable(dataset)
#' @export

# sub <- function(percentageOfMissingData, missingData) {
#   r <- hist(percentageOfMissingData, col='skyblue3',breaks=50, xlab = "percentage of missing data")
#   p <- subplot(hist(missingData,col='skyblue3'),3000,30)
#   return(p)
# }

# sub <- function(averageGapSize, aveGapSize) {
#   r <- hist(averageGapSize, col='skyblue3',breaks=50, xlab = "Average Gap Size")
#   p <- subplot(hist(aveGapSize,col='skyblue3'),9000,35)
#   return(p)

# sub <- function(numOfDays, days) {
#   r <- hist(numOfDays, col='skyblue3',breaks=50, xlab = "Number of days")
#   p <- subplot(hist(days,col='skyblue3'),200,35)
#   return(p)
# }

sub <- function(frequentTimeGap) {
  r <- hist(frequentTimeGap, col='skyblue3',breaks=100, xlab = "Most Frequent Time Gap (min)", xlim=c(0,10), ylim=c(0,60))
  return(r)
}

