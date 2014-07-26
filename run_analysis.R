# run_analysis.R
# Author: L Jays

library(plyr)

# Read and store required data files
activityLabels <- read.table("./activity_labels.txt", stringsAsFactors=FALSE)
features <- read.table("./features.txt", stringsAsFactors=FALSE)
subjectTest <- read.table("./test/subject_test.txt")
xTest <- read.table("./test/X_test.txt")
yTest <- read.table("./test/y_test.txt")
subjectTrain <- read.table("./train/subject_train.txt")
xTrain <- read.table("./train/X_train.txt")
yTrain <- read.table("./train/y_train.txt")

# Merge the test and training data into the same data frame
mergedData <- rbind(xTest, xTrain)
# Find those columns relating to mean or standard deviation and extract
requiredCols <- grep("-mean|-std", features$V2)
mergedData <- mergedData[, requiredCols]
# Label the columns with their associated measurement
colnames(mergedData) <- features$V2[requiredCols]

# Replace numeric indicators with descriptive activity names

# Create a tidy second data set
newData <- cbind(rbind(subjectTest, subjectTrain), rbind(yTest, yTrain))
colnames(newData) <- c("subject", "activity")
newData <- cbind(newData, mergedData)
# Sort data by subject number, then activity
newData <- arrange(newData, subject, activity)

# Use the aggregate function to produce a tidy dataset and write it to file
tidyData <- aggregate(newData, by=list(newData$activity, newData$subject), FUN=mean)[,3:81]
write.table(tidyData, file="./tidyData.txt", row.names=FALSE)