library(testthat)
library(ggexpress)

# Test Data
iris <- tibble::as_tibble(iris)

variable <- iris$Sepal.Length
mean_legnth <- mean(variable)
median_length <- median(variable)
sd_length <- sd(variable)

sepal_freq <- tibble::as_tibble(as.data.frame(table(iris$Sepal.Length)))

annotation_x <- max(variable)*0.9
y_max <- max(variable)

iris_plot <- iris %>%
  ggplot(aes(x = Sepal.Length)) +
  geom_histogram() +
  geom_vline(xintercept = mean_legnth, color = "red") +
  geom_vline(xintercept = median_length, color = "blue") +
  annotate(geom = "text",
           x = annotation_x,
           y = y_max*0.9,
           label = paste("Mean is:", round(mean_legnth, 2)),
           color = "red") +
  annotate(geom = "text",
           x = annotation_x,
           y = (y_max*0.9 - 1),
           label = paste("Median is:", round(median_length, 2)),
           color = "blue") +
  annotate(geom = "text",
           x = annotation_x,
           y = (y_max*0.9 - 2),
           label = paste("Standard Deviation is:", round(sd_length, 2)),
           color = "black")


testthat::test_that("Output is of correct datatype.", {

  testthat::expect_identical(class(gghist(iris, Sepal.Length)), class(iris_plot))

})

testthat::test_that("Check that exception is raised when data is of incorrect type.", {
  testthat::expect_error(gghist(iris$Sepal.Length, Sepal.Length))

})

testthat::test_that("Check that exception is raised when variable is not continuous.", {
  testthat::expect_error(gghist(iris, species))

})



