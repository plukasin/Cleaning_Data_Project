# Codebook #
The following steps are required to convert rawd data into tidy data

The script will download the source file and unzip it into the directory "UCI HAR Dataset".

Variables in the data

- X_test.txt and X_train.txt contains the measurements.
- features.txt contains the names of the 561 features.
- y_test.txt and y_train.txt contains the activity number for each measurement.
- activity_labels.txt contains six activity numbers and their corresponding activity name.
- subject_test.txt and subject_train.txt contains the subject number for each measurement.

Variables in the R code

- FileUrl : URL of the zipfile with all data
- localFile : Local file name of the zip file
- dataDir : Folder name for data
- dfActivities : Data frame with the Activities
- dfActivityNames : data frame with activity numbers (1:6) and the activity name
- dfMeasurements : Data frame with Measurements
- dfSubjects : Data frame with the subject numbers
- dfSubTest : Temporary data frame for the test subjects
- dfSubTrain : Temporary data frame for the train subjects
- dfXTest : Temporary data frame for X test data
- dfXTrain : Temporary dataframe for X_train data
- dfYTest : Temporary data frame for Y_test data
- dfYTrain : Temporary data frame for Y_train data
- featureIndices : integer vector with indices of features in feaureNames with mean() or std() in their name
- featureNames : Names of the features
- featureNames : factor with feature names from file features.txt
- tidy_means : tidy data set with the average of each variable for each activity and each subject
- Processing and transformations

# Steps # 
- Download the file 
- Read the data from X_train.txt and X_test.txt, merge it in data frame dfMeasurements and assign the feature names to the columns.
- Read the data from y_train.txt and y_test.txt, merge it in data frame dfActivities and give the column the name "activityNum".
- Read the data from subject_train.txt and subject_test.txt, merge it in data frame dfSubjects and give the column the name "subjectNum".
- Find the indices of the features with mean() or std() in the name 
- Replace the activity numbers in dfActivities with their activity names.
- Combine data frames dfSubjects, dfActivities and dfMeasurements in new data frame tidy_means.
- Convert tidy_means into a grouped tbl, first grouped on subject number and then on activity name.
- Apply function mean to all variables except the grouping variables subjectNum and activityName.
- Write the tidy data set to the working directory as text file "tidy_means.txt".
