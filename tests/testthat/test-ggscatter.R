test_that('Plot should use geom_point and correctly map variables to the correct axis.', {
  plot <- scatter_express(mtcars, drat, wt)
  expect_true("GeomPoint" %in% c(class(plot$layers[[1]]$geom)))
  expect_true("drat"  == rlang::get_expr(plot$mapping$x))
  expect_true("wt" == rlang::get_expr(plot$mapping$y))

  expect_true("drat" == plot$labels$x)
  expect_true("wt" == plot$labels$y)
})

standard_plot <- scatter_express(mtcars, mpg, qsec)
iris_plot <- scatter_express(iris, Sepal.Width, Sepal.Length)
log_transformed_mtcars <- scatter_express(mtcars, mpg, qsec, x_transform = TRUE, y_transform = TRUE)

#vdiffr::expect_doppelganger("mtcars scatterplot", standard_plot)
#vdiffr::expect_doppelganger("iris_scatterplot", iris_plot)
#vdiffr::expect_doppelganger("logmtcars_scatter", log_transformed_mtcars)
