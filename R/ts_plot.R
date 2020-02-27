#' Time series decomposition and plot
#'
#' Convert csv file into a time series object, decompose it into in trend, seasonality/cyclicity
#' and noise/remainder/error and plot the raw data and the decomposed components.
#'
#' @param data str: the path of the csv file
#' @param type str: "regular" or "irregular"
#'            "regular": time series with regular time intervals
#'            "irregular": time series with irregular time intervals
#' @param col str: the column to be analyzed
#' @param frequency int: the desired time interval
#'
#' @return a figure with 4 subplots
#' @export
#' @examples
#' ts_plot("https://raw.githubusercontent.com/plotly/datasets/master/timeseries.csv", A, irregular, 3)
ts_plot <- function(data, col, type, frequency){
  print("hello")
}
