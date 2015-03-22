## Step 1

## assume all is placed in working directory
## load x and y for Test 
## load x and y for and Train
xTrain <- read.table("train/X_train.txt", sep="")
yTrain <- read.table("train/y_train.txt", sep="")
xTest <- read.table("test/X_test.txt", sep="")
yTest <- read.table("test/y_test.txt", sep="")

## load names
varNames = read.table("features.txt", sep="")
varNames = varNames[,2]
activityLabels = read.table("activity_labels.txt", sep="")

## re-label
names(xTrain) <- varNames
names(xTest) <- varNames
