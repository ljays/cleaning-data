cleaning-data
=============

Getting and Cleaning Data Course Project

###Contents
This project contains:
- run_analysis.R
- Codebook.md
- tidyData.txt

###Dataset
The dataset for this project, *Human Activity Recognition Using Smartphones Data Set*, is briefly described here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data files can be obtained here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###run_analysis.R
The `plyr` package is called to make use of the `arrange()` function when organising the data.
The script begins by reading and loading required `.txt` files from the dataset. We merge the test and training sets into a single data frame before implementing a `grep()` call to extract those columns pertaining to either *mean* or *standard deviation* measurements. This results in a data frame consisting exclusively of mean and standard deviation data for each measurement.

The `features` object is used to label these columns. Similarly, `activityLabels` is used to give the six activity numerical markers descriptive names.

The final section of the script creates a data frame of subjects (total of thirty test/training subjects) and activities and then merges with the previously created data frame of measurements. We obtain the desired tidy data output by applying the `aggregate()` function to this data frame, and conclude by writing the data to a text file using the `write.table()` function.




