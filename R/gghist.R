#' Make a ggplot histogram
#'
#' Creates a ggplot histogram that indicates the position of the mean and median and displays the standard deviation.
#'
#' @param data A tibble or dataframe.
#' @param variable The column name inside data that will be made into a histogram.
#'
#' @return Produces a ggplot histogram with mean, median and standard deviation indicated on the plot.
#'
#' @export
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_histogram
#' @importFrom ggplot2 geom_vline
#' @importFrom ggplot2 annotate
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 ggplot_build
#'
#' @examples
#' gghist(iris, Sepal.Length)
gghist <- function(data, variable) {
  #todo: raise an exception about the data type of input variable. must be continuous 1D vector
  #todo: process the variable column in some way to find a good way to set the binwidth in geom_hist???
  #todo:allow the user to specify the number of bins; need a bins argument with a default

  # check that data is correct datatype
  if (!class({{data}})[1] %in% c("tbl_df", "tbl", "data.frame")) {
    stop("Data must be of type tibble or data.frame")
  }

  # extract the variable
  v <- dplyr::select({{data}}, {{variable}}) %>% dplyr::pull()


  # get the variable statistics
  variable_mean <- mean(v)
  variable_median <- median(v)
  variable_sd <- sd(v)

  # set the x-axis position for annotations
  annotation_x <- max(v)*0.9


  # make based ggplot histogram
  p1 <- {{data}} %>%
    ggplot(aes(x = {{variable}})) +
    geom_histogram() +
    geom_vline(xintercept = variable_mean, color = "red") +
    geom_vline(xintercept = variable_median, color = "blue")

  # build the plot to get access to plot components
  build <- ggplot_build(p1)

  # get the max frequency in the plot
  y_max <- build$layout$panel_scales_y[[1]]$range$range[2]

  # add the annotations to the plot
  p1 +
    annotate(geom = "text",
             x = annotation_x,
             y = y_max*0.9,
             label = paste("Mean is:", round(variable_mean, 2)),
             color = "red") +
    annotate(geom = "text",
             x = annotation_x,
             y = (y_max*0.8),
             label = paste("Median is:", round(variable_median, 2)),
             color = "blue") +
    annotate(geom = "text",
             x = annotation_x,
             y = (y_max*0.7),
             label = paste("Standard Deviation is:", round(variable_sd, 2)),
             color = "black")

}












