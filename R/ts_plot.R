#' Time series decomposition and plot
#'
#' Convert a dataframe into a time series object, decompose it into trend, seasonality/cyclicity
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
#' time <- c("1950 Q1", "1950 Q2", "1950 Q3", "1950 Q4",
#'           "1951 Q1", "1951 Q2", "1951 Q3", "1951 Q4")
#' earnings <- c(0.71, 0.63, 0.82, 0.91, 0.71, 0.63, 0.82, 0.91)
#' ts_data <- tibble::tibble(time, earnings)
#' ts_plot(data=ts_data, col="earnings", frequency=4)
ts_plot <- function(data, col, frequency){

  # basic check of input
  if (!class(data)[1] %in% c("tbl_df", "tbl", "data.frame")) {
    stop("Data must be of type tibble or data.frame")
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

  # check the input further
  if (c(col) %in% colnames(data) == FALSE){
    stop("The column names were not found")
  }

  # convert csv file into a time series object
  ts <- stats::ts(data[[col]], frequency = frequency)

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

