#' Time series decomposition and plot
#'
#' Convert csv file into a time series object, decompose it into trend, seasonality/cyclicity
#' and noise/remainder/error and plot the raw data and the decomposed components.
#' If the time series can't be decomposed, the function will just return the line chart of the raw data. 
#'
#' @param data str: the path of the csv file
#' @param col str: the column to be analyzed
#' @param frequency int: should choose from {1, 4, 12, 52}
#'
#' @return ggplot Object
#' @export
#' @examples
#' ts_plot("~/Desktop/ts4_jjshares.csv", "earnings", 4)
ts_plot <- function(data, col, frequency){
  
  # basic check of input
  if(typeof(data) != 'character'){
    stop("The path of the csv file should be a string")
  }
  
  if(length(readr::read_csv(data)) == 1){
    stop("The type of the input data must be a csv file")
  }
  
  
  if(typeof(col) != 'character') {
    stop("The column name should be a string")
  }
  
  if(typeof(frequency) != "double") {
    stop("The frequency of time series should be an integer chosen from 1, 4, 12, 52")
  }
  
  if(frequency %in% c(1, 4, 12, 52) == FALSE) {
    stop("The frequency of time series should be an integer chosen from 1, 4, 12, 52")
  }
  
  # read the data into a dataframe
  df <- readr::read_csv(data)
  
  # check the input further
  if (c(col) %in% colnames(df) == FALSE){
    stop("The column names were not found")
  }
  
  # convert csv file into a time series object
  ts <- ts(df[[col]], frequency = frequency)
  
  # check the time series object
  if (time(ts)[2] - time(ts)[1] != time(ts)[3] - time(ts)[2]){
    stop("The interval of the time series should be the same.")
  }
  
  # plot the raw data and the decomposed components
  if (frequency == 1){
    plt <- forecast::autoplot(ts, main = "Time series data", xlab="Time", ylab = col)
  }
  else {
    decomposed <- stats::decompose(ts)
    plt <- forecast::autoplot(decomposed, main = "Decomposed Time-Series Data", xlab="Time", ylab = col)
  }
  return(plt)
}

