# ggexpress

R package that creates basic EDA graphics in ggplot2 with ease.

### Installation:

```
install.packages('ggexpress')
```

### Summary Overview
- This package aims to simplify the process of conducting EDA on new datasets. We have designed some functions that allows you to do basic data manipulation and plotting, all by writing only one line of code. Plotting will be done using the ggplot2 package. As Jenny Bryan once said: “Someone has to write for-loops, but it doesn’t have to be you!”. We are essentially implementing this mentality into EDA analysis.You will be able to spend more time on analyzing your dataset and less time configuring settings. 

### Features
- **Fast Fourier transforms:** We feel that this function is missing from many summary functions and can be really useful for some cases. You will be able to input time series data and the function will automatically implement frequency analysis and provide a frequency vs amplitude plot.

- **Scatter plot:** Here you will take your own spin on 2-d scatter plots. It is often the case that we don’t know the distribution of the given points. This is why this function will group the points by each of the x and y axes and provide two histograms alongside the scatter plot. This way, you will have greater intuition on the properties of the data.

- **Histogram:** We will create a function that takes in a dataframe and column name and creates a histogram of it using ggplot2. However, we will also provide summary statistics overlayed on the as plot (e.g. mean and median vertical lines) and the sample standard deviation.


- **Time series analysis:** This is a function that takes in the path of time series data, decompose the data and finally visualize the raw data and the decomposition results. Except annual time series, the function will return a graph with 4 subplots, which contains raw data, estimated trend component, estimated seasonal/cyclic component and residual component. This way, you can have greater intuition of the time series.


### Dependencies

[ggplot2 (v3.2.1 or higher)](https://ggplot2.tidyverse.org)
<br>
[stats (v3.6.1 or higher)](https://www.rdocumentation.org/packages/stats/versions/3.6.2)
<br>
[tidyr (v1.0.0)](https://tidyr.tidyverse.org)

### Usage

- Although what our package does is by no means ‘new’ from a technical perspective (we are relying on already built packages to do everything), it does provide convenience to the user. There are many more universal summary packages out there, such as [pandas.DataFrame.describe()](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.describe.html) for python and [summary](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/summary) for R), our package is able to combine both analysis and visual representation of the data for specific (FFT) and general (histogram) tasks.



