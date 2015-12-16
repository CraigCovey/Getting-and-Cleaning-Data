Getting and Cleaning Data
=========================

Experimental Design and Background
----------------------------------
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. This experiment was aimed at understanding the mechanics of daily living. The data set was built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.

Raw Data
--------
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the experiment captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Processed Data
--------------
The original raw data set included six text files; three for the training group and three for the testing group. The three training data sets where combined and the three testing data sets where combined. These two data sets where joined to form one data set that consisted of 10,229 rows by 563 columns. The column names were changed based upon a seventh text file. A subset of the data was extracted pertaining to only measurements on the mean or the standard deviation. The daily activities in the original raw data consisted of an integer between one and six. The integers were replaced corresponding to activities based upon an eighth text file. The column names of the data set were changed to make them easier to read and understand by non-domain experts. Finally a data frame was created by obtaining the average of every measurement by activity and subject that was then created into an external tidy data text file.

Variables
---------
| Variable # | Variable Name                           | Variable Definition                                                                                                       |
|------------|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------|
| 1          | activity                                | The daily activity the subject was performing (walking, walking upstairs, walking downstairs, sitting, standing, laying). |
| 2          | subject                                 | The subject (1 – 30) performing the daily activity.                                                                       |
| 3 - 41     | timeBodyAcceleartionMean-X, …, etc.     | All variables that start with “”time are the time of triaxial acceleration or triaxial angular velocity.                  |
| 42 - 81    | frequencyBodyAccelerationMean-X,,…, etc | All variables that start with “frequency” are the frequency of triaxial acceleration or triaxial angular velocity.        |
