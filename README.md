Getting and Cleaning Data (Human Activity Recognition Using Smartphones Dataset
Version 1.0)


Summary:

Repository contains R script for converting Human Activity Recognition Using Smartphones Dataset (Version 1.0) into tidy summary dataset (download here).

Important note: Output dataset is in wide shape. Raw sensor data (accelerometer and gyroscope) from smartphone, used to calculate (mean and std) each of 79 features, is taken at same time window and whole collection of measurements is considered as one observation (it is not taken each as separate experiment). Each obervation has also two fixed variables subject and activity at two first coloumns.


Files:

CodeBook.md: details about input data, transformations and output data

run_analysis.R: R script for generating tidy summary dataset

uci_har_dataset.sample.txt: example of output dataset
        


How to use it:

1. put "run_analayis.R" script in your working directory
1. download HAR USD dataset (data) and unzip in same folder (UCI HAR Dataset)
2. run source("run_analysis.R") to generate output in uci_har_dataset.sample.txt
