#' Time series decomposition and plot
#'
#' Convert csv file into a time series object, decompose it into in trend, seasonality/cyclicity
#' and noise/remainder/error and plot the raw data and the decomposed components.
#'
#' @param data str: the path of the csv file
#' @param col str: the column to be analyzed
#' @param frequency int: the desired time interval
#'
#' @return ggplot Object
#' @export
#' @examples
#' ts_plot("~/Desktop/ts4_jjshares.csv", "earnings", 4)
ts_plot <- function(data, col, frequency){

  # basic check of input
  if(length(readr::read_csv(data)) == 1){
    stop("The type of the input data must be a csv file")
  }

  if(typeof(data) != 'character'){
    stop("The path of the csv file should be a string")
  }

  if(typeof(col) != 'character') {
    stop("The column name should be a string")
  }

  if(typeof(frequency) != "double") {
    stop("The frequency of time series should be an integer")
  }

  if(frequency %in% c(1, 4, 12, 52) == FALSE) {
    stop("The frequency of time series should be annual/quarterly/monthly/weekly")
  }


  # read the data into a dataframe
  df <- readr::read_csv(data)

  # check the input further
  if (c(col) %in% colnames(df) == FALSE){
    stop("The column names were not found")
  }

  if (typeof(df[[col]]) != "double"){
    stop("The column selected is not suitable for time series analysis")
  }

  # convert csv file into a time series object
  ts <- ts(df[[col]], frequency = frequency)

  # check the time series object
  if (time(ts)[2] - time(ts)[1] != time(ts)[3] - time(ts)[2]){
    stop("This time series is irregular.")
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

ts_plot("https://raw.github.ubc.ca/MDS-2019-20/DSCI_574_lab1_puddingz/master/data/ts4_jjshares.csv?token=AAAAOM22MPFSPEHAUMEANOS6NGM5A", "earnings", 4)
