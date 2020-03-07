library(testthat)
#' Tests the time series plot function to make sure output is rendered correctly
#' or the function will fail with an error message and problem.
#'
#' @return None. the function will not throw an error
#' if the tests pass.
#'
#' @examples
#' test_ts_plot()

test_ts_plot <- function() {
  # import helper data
  data1 <- "https://raw.github.ubc.ca/MDS-2019-20/DSCI_574_spat-temp-mod_students/master/labs/release/lab1/data/ts4_jjshares.csv?token=AAAAOMZQBS5IDU4Q6K3RBXS6NG7NM"
  data2 <- "https://raw.github.ubc.ca/MDS-2019-20/DSCI_574_spat-temp-mod_students/master/labs/release/lab1/data/ts1_globaltemp.csv?token=AAAAOM4GFOSICJVSVP2YUP26NG7QE"
  data3 <- "https://raw.github.ubc.ca/MDS-2019-20/DSCI_574_spat-temp-mod_students/master/labs/release/lab1/data/ts6_shorelines.csv?token=AAAAOM2VTEDBLBFBZPV7UW26NHKOU"
  
  test_data_1 <- ts_plot(data1, "earnings", 4)
  test_data_2 <- ts_plot(data2, "temp", 1)
  
  # tests part
  test_that("The returned plot should be a ggplot object.", {
    expect_true(ggplot2::is.ggplot(test_data_1))
  })
  
  test_that("The plot for annual time series should contain only 1 line chart", {
    expect_equal(length(test_data_2$layers), 1)
    expect_true("GeomLine" %in% c(class(test_data_2$layers[[1]]$geom)))
  })
  
  test_that("The plot for quarterly time series should contain 4 subplots", {
    expect_equal(length(test_data_1$layers), 4)
    expect_true("GeomLine" %in% c(class(test_data_1$layers[[1]]$geom)))
    expect_true("GeomSegment" %in% c(class(test_data_1$layers[[2]]$geom)))
    expect_true("GeomHline" %in% c(class(test_data_1$layers[[3]]$geom)))
    expect_true("GeomRect" %in% c(class(test_data_1$layers[[4]]$geom)))
  })
  
  test_that("Corresponding error message should be expected if the data path argument doesn't link to a csv file.", {
    expect_error(ts_plot("https://github.ubc.ca/MDS-2019-20/DSCI_574_lab1_puddingz/blob/master/data/ts4_jjshares.csv",
                         "earnings", 4),
                 regexp = "The type of the input data must be a csv file")
  })
  
  test_that("Corresponding error message should be expected if the data path argument is not a string.", {
    expect_error(ts_plot(123, "earnings", 4),
                 regexp = "The path of the csv file should be a string")
  })
  
  test_that("Corresponding error message should be expected if the col argument is not a string", {
    expect_error(ts_plot(data1, 2, 4),
                 regexp = "The column name should be a string")
  })
  
  test_that("Corresponding error message should be expected if the frequency argument is not an integer", {
    expect_error(ts_plot(data1, "earnings", "4"),
                 regexp = "The frequency of time series should be an integer chosen from 1, 4, 12, 52")
  })
  
  test_that("Corresponding error message should be expected if the frequency argument is not proper", {
    expect_error(ts_plot(data1, "earnings", 5),
                 regexp = "The frequency of time series should be an integer chosen from 1, 4, 12, 52")
  })
  
  test_that("Corresponding error message should be expected if the col argument is not a column name", {
    expect_error(ts_plot(data1, "earning", 4),
                 regexp = "The column names were not found")
  })
  
  
  test_that("Corresponding error message should be expected if the time series is irregular.", {
    expect_error(ts_plot(data3, "shoreline", 12),
                 regexp = "The interval of the time series should be the same.")
  })
  
}
