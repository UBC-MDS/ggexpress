library(ggplot2)

data1 <- "https://raw.github.ubc.ca/MDS-2019-20/DSCI_574_spat-temp-mod_students/master/labs/release/lab1/data/ts4_jjshares.csv?token=AAAAOMZQBS5IDU4Q6K3RBXS6NG7NM"
data2 <- "https://raw.github.ubc.ca/MDS-2019-20/DSCI_574_spat-temp-mod_students/master/labs/release/lab1/data/ts1_globaltemp.csv?token=AAAAOM4GFOSICJVSVP2YUP26NG7QE"

test_data_1 <- ts_plot(data1, "earnings", 4)

test_data_2 <- ts_plot(data2, "temp", 1)

test_ts_plot <- function() {

  test_that("The returned plot should be a ggplot object.", {
    expect_true(is.ggplot(test_data_1))
  })

  test_that("The plot for annual time series should contain only 1 line chart", {
    expect_equal(length(test_data_2$layers), 1)
    expect_true("GeomLine" %in% c(class(test_data_2$layers[[1]]$geom)))
  })

  test_that("The plot for quarterly time series should contain 4 subplots", {
    expect_equal(length(test_data_1$layers), 4)
    expect_true("GeomLine" %in% c(class(test_data_2$layers[[1]]$geom)))
    expect_true("GeomSegment" %in% c(class(test_data_2$layers[[2]]$geom)))
    expect_true("GeomHline" %in% c(class(test_data_2$layers[[3]]$geom)))
    expect_true("GeomRect" %in% c(class(test_data_2$layers[[4]]$geom)))
  })

  test_that("Corresponding error message should be expected if the data path argument doesn't link to a csv file.", {
    expect_error(ts_plot("https://github.ubc.ca/MDS-2019-20/DSCI_574_lab1_puddingz/blob/master/data/ts4_jjshares.csv",
                         "earnings", 4),
    regexp = "The type of the input data must be a csv file")
  })

  test_that("Corresponding error message should be expected if the col argument is not a string", {
    expect_error(ts_plot("https://raw.github.ubc.ca/MDS-2019-20/DSCI_574_spat-temp-mod_students/master/labs/release/lab1/data/ts4_jjshares.csv?token=AAAAOMZQBS5IDU4Q6K3RBXS6NG7NM",
                         2, 4),
                 regexp = "The column name should be a string")
  })

  test_that("Corresponding error message should be expected if the frequency argument is not proper", {
    expect_error(ts_plot("https://raw.github.ubc.ca/MDS-2019-20/DSCI_574_spat-temp-mod_students/master/labs/release/lab1/data/ts4_jjshares.csv?token=AAAAOMZQBS5IDU4Q6K3RBXS6NG7NM",
                         "earnings", 5),
                 regexp = "The time series should be annual/quarterly/monthly/weekly")
  })

  test_that("Corresponding error message should be expected if the col argument is not a column name", {
    expect_error(ts_plot("https://raw.github.ubc.ca/MDS-2019-20/DSCI_574_spat-temp-mod_students/master/labs/release/lab1/data/ts4_jjshares.csv?token=AAAAOMZQBS5IDU4Q6K3RBXS6NG7NM",
                         "earning", 4),
                 regexp = "The column names were not found")
  })

  helper_data1 <- readr::read_csv(data1)
  helper_data1[[1,2]] <- "a"
  tmp1 <- tempfile()
  write_csv(helper_data1, tmp1)

  test_that("Corresponding error message should be expected if the selected columns contains categorical variables.", {
    expect_error(ts_plot(tmp, "earnings", 4),
                 regexp = "The column selected is not suitable for time series analysis")
  })

  test_that("Corresponding error message should be expected if the time series is irregular.", {
    expect_error(ts_plot("https://raw.github.ubc.ca/MDS-2019-20/DSCI_574_spat-temp-mod_students/master/labs/release/lab1/data/ts6_shorelines.csv?token=AAAAOM2VTEDBLBFBZPV7UW26NHKOU",
                         "shoreline", 12),
                 regexp = "This time series is irregular.")
  })

}
