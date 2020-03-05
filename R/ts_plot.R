library(ggplot2)
library(dplyr)
library(forecast)
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
#' ts_plot("https://raw.github.ubc.ca/MDS-2019-20/DSCI_574_lab1_puddingz/master/data/ts4_jjshares.csv?token=AAAAOM22MPFSPEHAUMEANOS6NGM5A", "earnings", 4)
ts_plot <- function(data, col, frequency){
  df <- readr::read_csv(data)
  ts <- ts(df[[col]], frequency = frequency)

  if (frequency == 1){
    plt <- forecast::autoplot(ts, main = "Time series data", xlab="Time", ylab = col)
  }
  else {
    plt <- ts %>%
      decompose() %>%
        forecast::autoplot(main = "Decomposed Time series data", xlab="Time", ylab = col)
  }
  return(plt)
}

ts_plot("https://raw.github.ubc.ca/MDS-2019-20/DSCI_574_lab1_puddingz/master/data/ts4_jjshares.csv?token=AAAAOM22MPFSPEHAUMEANOS6NGM5A", "earnings", 4)
