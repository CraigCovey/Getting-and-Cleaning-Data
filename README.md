Course Project - Getting and Cleaning Data
==========================================

Introduction
------------
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. This experiment was aimed at understanding the mechanics of daily living. The data set was built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.

Data
----
A full description of the data set is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
All of the data can be downloaded and extracted [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

How run_analysis.R works
------------------------
The purpose of run_analysis.R is to create a tidy data set from the downloaded original raw data. The raw data includes many folders and text files. After manually downloading and extracting the zip file the run_analysis.R:
* Loads the training data sets and combines them into one data frame
* Loads the testing data sets and combines them into one data frame
* Joins the training and testing data frames into one data frame
* Adds column names from features.txt
* Replaces the integer in the activity column with the corresponding activity name in activity_labels.txt
* Column names were changed to make them easier to read and understand by non-domain experts
* A new data frame was created consisting of the averages of each measurement by activity and subject
* A external tidy data text file was created
