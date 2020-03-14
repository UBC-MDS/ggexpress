library(testthat)


# create data
t <- seq(0,1,1/1000)
y1 <- sin(2*pi*300*t)
y2 <- sin(2*pi*200*t)
my_df1 = data.frame('X1'= t, 'X2'= y1)
my_df2 = data.frame('X1'= t, 'X2'= y2)
time_col = 'X1'
data_col = 'X1'

test1 <- fourier_transform(data = my_df1,
                           time_col = time_col,
                           data_col = data_col)

test2 <- fourier_transform(data = my_df2,
                           time_col = time_col,
                           data_col = data_col)

# Test 1
test_that("Return type is not an ggplot object!", {
  expect_true(ggplot2::is.ggplot(test1))
})
test_that("Return type is not an ggplot object!", {
  expect_true(ggplot2::is.ggplot(test2))
})

# Test 2
test_that("The plot should be a line!", {
  expect_equal(length(test1$layers), 1)
  expect_true("GeomLine" %in% c(class(test1$layers[[1]]$geom)))
})
test_that("The plot should be a line!", {
  expect_equal(length(test2$layers), 1)
  expect_true("GeomLine" %in% c(class(test2$layers[[1]]$geom)))
})

# Test 3
test_that("Name of time column is not a string!.", {
  expect_equal(typeof(time_col), 'character')
})

# Test 4
test_that("Name of data column is not a string!.", {
  expect_equal(typeof(data_col), 'character')
})
