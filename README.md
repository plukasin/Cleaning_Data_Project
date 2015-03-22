# Cleaning_Data_Project
Getting and Cleaning Data - Coursera Project

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The R script will download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Next the script does the following: 
- 1. Merges the training and the test sets to create one data set.
By means of the cbind() function, two data frames are created, one containing all the data of the "train" group and the other containing the data of the "test" group.
- 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Both data sets are merged together using the rbind() instruction creating new data set with all the subjects and all the measurements. We are interested only in the variables that represent the mean and the standard deviation of each measurement. grep() function is used to keep only those variables containing the expressions "mean()" and "std()" in their names. The variables related to mean frequencies are also removed. After this step 68 variables are kept.
- 3. Uses descriptive activity names to name the activities in the data set
Descriptive activity names are assigned to the levels of the variable that represent the activity. Instead of being labeled by numbers, the activities are labeled with expressions.
- 4. Appropriately labels the data set with descriptive variable names. 
No further cleanup of labels was performed. 
- 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Finally, the tidy data set is created. It contains the average of each variable for each activity and each subject. Thus, it has 180 rows and 68 columns.

The script requires the following two libraries to work:
- library(dplyr)
- library(downloader) 

