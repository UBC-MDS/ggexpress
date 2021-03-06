#' Creates a Fourier transform plot of the data specified in the 'data_col' column using ggplot2
#'
#' @param data DataFrame containing all necessary information
#' @param time_col string containing the time data column corresponding to the data we
#'                 want to apply Fourier transform to
#' @param data_col string containing the name of the column we want to apply Fourier transform to
#'
#' @return a ggplot2 line plot of frequency vs amplitude of the data inputed
#' @export
#'
#' @examples
#' my_data = tibble::tibble(time_series =  c(0, 1, 2, 3), signal = c(2, 3, 4, 6))
#' fourier_transform(data = my_data,
#'                   time_col = "time_series",
#'                   data_col = "signal")
#'

fourier_transform <- function(data, time_col, data_col) {

  # Test that the inputs are valid
  testthat::test_that("Name of time column is not a string!.", {
    testthat::expect_equal(typeof(time_col), 'character')
  })

  testthat::test_that("Name of data column is not a string!.", {
    testthat::expect_equal(typeof(data_col), 'character')
  })

  my_signal <- as.numeric(unlist(dplyr::select(data, data_col)))
  my_time <- as.numeric(unlist(dplyr::select(data, time_col)))

  # Making sure that there are no `NaN` values
  testthat::test_that('`NaN` values found in signal column!', {
    testthat::expect_equal(my_signal, my_signal[!is.na(my_signal)])
  })
  testthat::test_that('`NaN` values found in time column!', {
    testthat::expect_equal(my_time, my_time[!is.na(my_time)])
  })
  
  # Testing that input data is of correct format
  sampling_freq <- my_time[2] - my_time[1]
  for (n in 1:(length(my_time) - 1)) {
    # Expect that each time step is uniform
    testthat::test_that('Sampling time is not uniformly distributed! Assure that time between samples is constant!', {
      testthat::expect_equal((my_time[n + 1] - my_time[n]), sampling_freq, tolerance = 1e-2)
    })
  }

  # Using fft function to calculate the amplitudes at different frequencies
  amplitudes <- abs(stats::fft(my_signal)[1:((length(my_time)/2)+1)])
  # Calculating the frequency values
  frequencies <- seq(from=0, to=1/(2*sampling_freq), length=((length(my_time)/2)))

  # Depending on whether or not the input data length is even/odd there may be difference of 1 in length
  if (length(amplitudes) > length(frequencies)) {
    amplitudes <- head(amplitudes, -1)
  }
  
  # Putting results in tibble
  my_df <- tibble::tibble(`Frequency` = frequencies, `Amplitude` = amplitudes)

  # Plotting
  my_plot <- ggplot2::ggplot(data = my_df) +
    ggplot2::geom_line(aes(x = Frequency, y = Amplitude)) +
    ggplot2::ggtitle('FFT on Input Signal Data')

  return(my_plot)
}
