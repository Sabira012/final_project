// Generate summary statistics for the filtered dataset
summarize

// Save summary statistics in a text file
ssc install estout
estpost summarize
esttab using "output/tables/summary_statistics.txt", replace

// Create a histogram of price
histogram price, width(5000) title("Histogram of Car Prices")

// Save the histogram as a PNG file
graph export "output/graphs/price_histogram.png", replace