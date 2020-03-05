require(testthat)
require(ggplot2)
require(forecast)

test_that("The plot has correct number of layers", {
  test_plt1 <- ts_plot("https://raw.github.ubc.ca/MDS-2019-20/DSCI_574_spat-temp-mod_students/master/labs/release/lab1/data/ts4_jjshares.csv?token=AAAAOMZQBS5IDU4Q6K3RBXS6NG7NM",
                      "earnings", 4)
  expect_equal(length(test_plt1$layers), 4)

  test_plt2 <- ts_plot("https://raw.github.ubc.ca/MDS-2019-20/DSCI_574_spat-temp-mod_students/master/labs/release/lab1/data/ts1_globaltemp.csv?token=AAAAOM4GFOSICJVSVP2YUP26NG7QE",
                       "temp", 1)
  expect_equal(length(test_plt2$layers), 1)

})
