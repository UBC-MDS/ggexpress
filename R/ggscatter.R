library(dplyr)
library(ggplot2)

#' Create a scatterplot and calculate correlation values for two numerical variables
#'
#' Creates a ggplot scatterplot object containing two numerical variables. Arguements in the
#'  function will control whether correlational values and log transformations are calculated for the input data.
#'
#' @param df Dataframe to plot
#' @param xval x-var Column name used as the x-axis variable
#' @param yval y-var Column name used as the y-axis variable
#'
#' @return ggplot Object
#' @export
#'
#' @examples
#' scatter_express(hiris, "Sepal.Width, Petal.Length)
scatter_express <- function(df, xval = NA, yval = NA){

  corr_df <- dplyr::select(df, {{xval}}, {{yval}})
  corr_val <- round(stats::cor(df[[1]], df[[2]]), 2)


  scatter <- ggplot2::ggplot(df, ggplot2::aes(x = {{xval}}, y = {{yval}})) + ggplot2::geom_point()

  scatter <- scatter + ggplot2::labs(title = paste(rlang::get_expr(scatter$mapping$x), " vs ", rlang::get_expr(scatter$mapping$y), "(Correlation: ",  corr_val, ")"))
  scatter
}


df <- iris

plot <- scatter_express(df, Sepal.Width, Petal.Length)
