library(dplyr)
library(ggplot2)

#' Create a scatterplot and calculate correlation values for two numerical variables
#'
#' Creates a ggplot scatterplot object containing two numerical variables. Arguments in the
#'  function will control whether correlational values and log transformations are calculated for the input data.
#'
#' @param df Dataframe to plot
#' @param xval x-var Column name used as the x-axis variable
#' @param yval y-var Column name used as the y-axis variable
#' @param x_transform Determines whether the x-axis undergoes a natural log transformation
#' @param y_transform Determines whether the y-axis undergoes a natural log transformation
#'
#' @return ggplot Object
#' @export
#'
#' @examples
#' scatter_express(iris, Sepal.Width, Sepal.Length)
scatter_express <- function(df, xval = NA, yval = NA, x_transform = FALSE, y_transform = FALSE){

  corr_df <- dplyr::select(df, {{xval}}, {{yval}})

  if (is.numeric(corr_df[[1]]) == FALSE) stop("Your x-variable must be numeric")
  if (is.numeric(corr_df[[2]]) == FALSE) stop("Your y-variable must be numeric")

  corr_val <- round(stats::cor(corr_df[[1]], corr_df[[2]]), 2)


  scatter <- ggplot2::ggplot(corr_df, ggplot2::aes(x = {{xval}}, y = {{yval}})) +
    ggplot2::geom_point(color = "blue")

  if (x_transform == TRUE) {
    scatter <- scatter + ggplot2::scale_x_continuous(trans = "log2")

  }

  if (y_transform == TRUE) {
    scatter <- scatter + ggplot2::scale_y_continuous(trans = "log2")
  }

  scatter <- scatter + ggplot2::labs(title = paste(rlang::get_expr(scatter$mapping$x),

                                                   " vs ", rlang::get_expr(scatter$mapping$y),
                                                   "(Pearson Correlation: ",
                                                   corr_val,
                                                   ")"))
  scatter
}

#test <- scatter_express(iris, Sepal.Length, Sepal.Length, x_transform = FALSE, y_transform = TRUE)
