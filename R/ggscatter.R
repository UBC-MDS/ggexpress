library(tidyverse)
library(ggplot2)

#' Create a scatterplot and calculate correlation values for two numerical variables
#'
#' Creates a ggplot scatterplot object containing two numerical variables. Arguements in the
#'  function will control whether correlational values and log transformations are calculated for the input data.
#'
#'
#' @return ggplot Object
#' @export
#'
#' @examples
#' scatter_express(heart_df, "chol","age", transform = FALSE, corr = "Pearson")
scatter_express <- function(df, xval = NA, yval = NA, x_transform = FALSE, y_transform = FALSE){

  corr_df <- dplyr::select(df, {{xval}}, {{yval}})
  corr_val <- round(cor(df[[1]], df[[2]]), 2)


  scatter <- ggplot2::ggplot(df, aes(x = {{xval}}, y = {{yval}})) + geom_point()

  scatter <- scatter + labs(title = paste(rlang::get_expr(scatter$mapping$x), " vs ", rlang::get_expr(scatter$mapping$y), "(Correlation: ",  corr_val, ")"))
  scatter
}


df <- iris

plot <- scatter_express(df, Sepal.Width, Petal.Length, TRUE)
