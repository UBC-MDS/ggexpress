#' Creates a Fourier transform plot of the data specified in the 'data_col' column using ggplot2
#'
#' @param data DataFrame containing all necessary information
#' @param time_col string containing the time data column corresponding to the data we
#'                 want to apply Fourier transform to
#' @param data_col string containing the name of the column we want to apply Fourier transform to
#'
#' @return Produces a ggplot2 line plot of frequency vs amplitude of the data inputed
#' @export
#'
#' @examples
#' fourier_transform(data = my_data,
#'                   time_col = 'time_series',
#'                   data_col = 'signal')
#'

fourier_transform <- function(data, time_col, data_col) {
  print('compilation success!')
}
