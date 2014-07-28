# Getting and Cleaning Data Course Project
===================

The R script `run_analysis.R` download original data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (for more information see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and process it to prepare tidy data 'average_dataset.txt' that can be used for later analysis.

## Files:

- `CodeBook.md` : code book that describes the variables, the data, and any transformations or work that was performed to clean up the data

- `README.md` : this file

- `average_dataset.txt` : output of `run_analysis.R` script, tidy data set with the average of each variable for each activity and each subject of original data set

- `run_analysis.R` : R script for performing the analysis (NOTE: this script depends on `plyr` library and will install it if necessary)
