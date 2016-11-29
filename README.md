##Getting and Cleaning Data (Human Activity Recognition Using Smartphones Dataset Version 1.0)


###Summary:

Repository contains R script for converting Human Activity Recognition Using Smartphones Dataset (Version 1.0) into tidy summary dataset (download [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)).

Important note: Output dataset is in wide shape. Raw sensor data (accelerometer and gyroscope) from smartphone, used to calculate (mean and std) each of 79 features, is taken at same time window and whole collection of measurements is considered as one observation (it is not taken each as separate experiment). Each obervation has also two fixed variables subject and activity at two first coloumns.


###Files:

[CodeBook.md](https://github.com/kranjeto/uci_har_tidy/blob/master/CodeBook.md): details about input data, transformations and output data

[run_analysis.R](https://github.com/kranjeto/uci_har_tidy/blob/master/run_analysis.R): R script for generating tidy summary dataset

[uci_har_dataset.sample.txt](https://github.com/kranjeto/uci_har_tidy/blob/master/uci_har_dataset.txt): example of output dataset
        


How to use it:

1. put [run_analysis.R](https://github.com/kranjeto/uci_har_tidy/blob/master/run_analysis.R) script in your working directory
2. download [HAR USD dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip in same folder (UCI HAR Dataset)
3. to generate output in uci_har_dataset.sample.txt run

```{r}
source("run_analysis.R")
``` 
