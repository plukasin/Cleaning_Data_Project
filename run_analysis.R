# Load the required libraries
library(dplyr)
library(downloader) # use of file.path

## Constants ##
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
localFile <- "Dataset.zip"
dataDir <- "UCI HAR Dataset"

## Download and unzip 
# Check if zipfile already exist
if (!file.exists(localFile)) {
  download(fileUrl, localFile)
}
 
# Skip unzipping id data exist
if (!file.exists(dataDir)) {
  unzip(localFile)
}


## Task 1: Merges the training and the test sets to create one data set.

## load x and y for Test 
## load x and y for and Train
dfXTrain <- read.table(file.path(dataDir, "train", "X_train.txt"))
dfXTest <- read.table(file.path(dataDir, "test", "X_test.txt"))
dfYTrain <- read.table(file.path(dataDir, "train", "y_train.txt"))
dfYTest <- read.table(file.path(dataDir, "test", "y_test.txt"))

# Merge X train and test data in new data frame dfMeasurements
dfMeasurements <- rbind(dfXTrain, dfXTest)

# Read feature names and assign them to the variables (column names)
featureNames <- read.table(file.path(dataDir, "features.txt"))[,2]
names(dfMeasurements) <- featureNames

# Merge Y train and test data in a new data frame dfActivities
dfActivities <- rbind(yTrain, yTest)
# Assign name to the variable
names(dfActivities) <- c("activityNum")

# Read Subject train and test data 
dfSubTrain <- read.table(file.path(dataDir, "train", "subject_train.txt"))
dfSubTest <- read.table(file.path(dataDir, "test", "subject_test.txt"))

# Merge Subject train and test data 
dfSubjects <- rbind(dfSubTrain, dfSubTest)
names(dfSubjects) <- c("subjectNum")

# Remove data frames no longer used 
rm("xTrain") ; rm("xTest") ; rm("yTrain") ; rm("yTest") ; rm("dfSubTrain") ; rm("dfSubTest")

## Task 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
# Find the indices of the features with mean() or std() in the name
featureIndices <- grep(pattern = "mean\\(\\)|std\\(\\)", featureNames)
# Extract the found columns
dfMeasurements <- dfMeasurements[, featureIndices]

## Task 3: Uses descriptive activity names to name the activities in the data set
# Read activity names 
dfActivityNames <- read.table(file.path(dataDir, "activity_labels.txt"))
# Substitute activity number with name
dfActivities[,1] <- dfActivityNames[dfActivities[,1],2]
names(dfActivities) <- "activityName"

## Task 4: Appropriately labels the data set with descriptive variable names ##
# Done in task 1 

## Task 5: From the data set in step 4, creates a second, 
## independent tidy data set with the average of each variable for each activity and each subject.

# Combine data frames dfSubjects, dfActivities and dfMeasurements into tidy_means
tidy_means <- cbind(dfSubjects, dfActivities, dfMeasurements)
## Wrap data frame tidy_means as data frame tbl, 
## necessary for using group_by and summarise functions of dplyr package
tidy_means <- tbl_df(tidy_means)
# Convert tidy_means into a grouped tbl, first grouped on subject number and then on activity name
tidy_means <- group_by(tidy_means, subjectNum, activityName)
# Apply function mean to all variables except the grouping variables subjectNum and activityName
tidy_means <- summarise_each(tidy_means, funs(mean))
# Write the tidy data set to the working directory as text file "tidy_means.txt"
write.table(x = tidy_means, file = "tidy_means.txt", row.names = FALSE)