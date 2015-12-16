#### run_analysis.R

## Directory Structure
dirStruct <- c("Coursera", "Getting Data", "Course Project")

## Determine based upon getwd() if R file is being run on a Windows machine or a Mac machine.
## Adjust file path accordingly.

if (getwd() == "P:/R") {
    # R file is being used on Windows machine
    ##windowsPath <- "P:\\R\\Coursera\\Getting Data\\Course Project"
    path <- paste0("P:\\R", "\\", paste(dirStruct, collapse = "\\"))
    seperator <- "\\"
} else if (getwd() == "/Users/Craig/Dropbox/R") {
    # R file is being used on Mac machine
    ##macPath <- "/Users/Craig/Dropbox/R/Getting Data/Course Project"
    path <- paste0("/Users/Craig/Dropbox/R", "/", paste(dirStruct, collapse = "/"))
    seperator <- "/"
} else {
    stop("Invalid working directory!")
}

## Create directory
if (!file.exists(path)) {
    dir.create(path)
}

#### 1. Merge the training and test sets to create one data set
library(plyr)

## Train data sets
subjectTrain <- read.table(paste(path, paste("train", "subject_train.txt", sep = seperator), sep = seperator))       ## Integer representing the 30 participants
xTrain <- read.table(paste(path, paste("train", "X_train.txt", sep = seperator), sep = seperator))                  
yTrain <- read.table(paste(path, paste("train", "y_train.txt", sep = seperator), sep = seperator))

## Combine the Train data set into one data frame
train <- xTrain
train[, 562] <- yTrain
train[, 563] <- subjectTrain

## Test data sets
subjestTest <- read.table(paste(path, paste("test", "subject_test.txt", sep = seperator), sep = seperator))          ## Integer representing the 30 participants
xTest <- read.table(paste(path, paste("test", "X_test.txt", sep = seperator), sep = seperator))
yTest <- read.table(paste(path, paste("test", "y_test.txt", sep = seperator), sep = seperator))

## Combine the Test data set into one data frame
test <- xTest
test[, 562] <- yTest
test[, 563] <- subjestTest

## Join the test and train data frames (essentially, adding test on the bottom of train)
merged <- join(train, test, type = "full", match = "all")

#### 2. Extract only the measurements on the mean and standard deviation for each measurement.

## Add lables from features.txt to merged data set
features <- read.table(paste(path, "features.txt", sep = seperator))                       ## Column labels for the first 561 columns
featuresLabels <- features[, 2]
names(merged) <- factor(c(as.character(featuresLabels), "Training Labels", "Subject"))

## Subset merged data to include columns that include "mean" or "std" plus the last two columns "Training Lables" and "Subject"
mMeanStd <- merged[, grepl("mean", names(merged)) | grepl("std", names(merged)) | grepl("Training Labels", names(merged)) | grepl("Subject", names(merged))]

#### 3. Uses descriptive activity names to name the activities in the data set

actLabels <- read.table(paste(path, "activity_labels.txt", sep = seperator))
## Change the column names of actLabels so it will work with join
names(actLabels) <- c("Training Labels", "activity")
mMeanStd <- join(mMeanStd, actLabels, by = "Training Labels", type = "left")
mMeanStd$`Training Labels` <- NULL
mMeanStd$activity <- tolower(sub("_", " ", mMeanStd$activity))

#### 4. Appropriately label the data set with descriptive variable names. 
# t = time
names(mMeanStd) <- sub("^t", "time", names(mMeanStd))
# f = frequency
names(mMeanStd) <- sub("^f", "frequency", names(mMeanStd))
# Acc = Acceleration
names(mMeanStd) <- sub("Acc", "Acceleration", names(mMeanStd))
# Gyro = Gyroscope
names(mMeanStd) <- sub("Gyro", "Gyroscope", names(mMeanStd))
# Mag = Magnitude
names(mMeanStd) <- sub("Mag", "Magnitude", names(mMeanStd))
# -mean() = Mean
names(mMeanStd) <- sub("-mean[(][)]", "Mean", names(mMeanStd))
# -std() = StdDev
names(mMeanStd) <- sub("-std[(][)]", "StdDev", names(mMeanStd))
# -mean()Freq = MeanFrequency
names(mMeanStd) <- sub("-meanFreq[(][)]", "MeanFrequency", names(mMeanStd))
names(mMeanStd) <- sub("Subject", "subject", names(mMeanStd))

#### 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject

## Average for each column for each activity and subject
finalTidyData <- ddply(mMeanStd, .(activity, subject), numcolwise(mean))

## Create text file of tidy data and write to hard drive. Path dependent on Windows or Mac machine
write.table(finalTidyData, file = paste(path, "tidyData.txt", sep = seperator), row.names = FALSE)

