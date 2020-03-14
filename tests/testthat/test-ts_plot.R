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
  time1 <- c("1950 Q1", "1950 Q2", "1950 Q3", "1950 Q4",
             "1951 Q1", "1951 Q2", "1951 Q3", "1951 Q4",
             "1952 Q1", "1952 Q2", "1952 Q3", "1952 Q4")
  earnings1 <- c(0.71, 0.63, 0.82, 0.91,
                 0.71, 0.63, 0.82, 0.91,
                 0.71, 0.63, 0.82, 0.91)
  ts_data1 <- tibble::tibble(time1, earnings1)
  test_plot1 <- ts_plot(ts_data1, "earnings1", 4)

  time2 <- c("1950", "1951", "1952", "1953",
             "1954", "1955", "1956", "1957")
  earnings2 <- c(0.71, 0.63, 0.82, 0.91,
                 0.51, 1.31, 1.82, 2.01)
  ts_data2 <- tibble::tibble(time2, earnings2)
  test_plot2 <- ts_plot(ts_data2, "earnings2", 1)

  # tests part
  test_that("The returned plot should be a ggplot object.", {
    expect_true(ggplot2::is.ggplot(test_plot1))
    expect_true(ggplot2::is.ggplot(test_plot2))
  })

  test_that("The plot for annual time series should contain only 1 line chart", {
    expect_equal(length(test_plot2$layers), 1)
    expect_true("GeomLine" %in% c(class(test_plot2$layers[[1]]$geom)))
  })

  test_that("The plot for quarterly time series should contain 4 subplots", {
    expect_equal(length(test_plot1$layers), 4)
    expect_true("GeomLine" %in% c(class(test_plot1$layers[[1]]$geom)))
    expect_true("GeomSegment" %in% c(class(test_plot1$layers[[2]]$geom)))
    expect_true("GeomHline" %in% c(class(test_plot1$layers[[3]]$geom)))
    expect_true("GeomRect" %in% c(class(test_plot1$layers[[4]]$geom)))
  })

  test_that("Corresponding error message should be expected if the data argument doesn't link to a dataframe/tibble.", {
    expect_error(ts_plot(time1, "earnings1", 4),
                 regexp = "Data must be of type tibble or data.frame")
  })

  test_that("Corresponding error message should be expected if the col argument is not a string", {
    expect_error(ts_plot(ts_data1, 2, 4),
                 regexp = "The column name should be a string")
  })

  test_that("Corresponding error message should be expected if the frequency argument is not an integer", {
    expect_error(ts_plot(ts_data1, "earnings1", "4"),
                 regexp = "The frequency of time series should be an integer chosen from 1, 4, 12, 52")
  })

  test_that("Corresponding error message should be expected if the frequency argument is not proper", {
    expect_error(ts_plot(data1, "earnings1", 5),
                 regexp = "The frequency of time series should be an integer chosen from 1, 4, 12, 52")
  })

  test_that("Corresponding error message should be expected if the col argument is not a column name", {
    expect_error(ts_plot(ts_data1, "earning", 4),
                 regexp = "The column names were not found")
  })

}
