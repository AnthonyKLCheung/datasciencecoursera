---
title: "Getting and Cleaning Data Assignment"
output: html_document
Author: Anthony Cheung
---

The purpose of this project is to demonstrate ones ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis documents. 

**Original Data**   
The initial data set is available at <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

The zip file contains 2 sets of data, the training set and the test set, each in their own folder. Each set has 3 data files with the names subject_????.txt, X_????.txt, and y_????.txt (???? is either "train" or "test").  The 3 files should have the exact same number of rows. The subject_????.txt specify the subject for each of the observations. The X_????.txt contains the measurement of each of the features for each of the observations. The y_????.txt contains the activity relates to each of the observations.  At the root of the zip contents, there are two files giving more information on the activity and features. The activity_labels.txt file contains the mapping of activity id to activity and the features.txt file contains the name of each of the measurements done for each observation.

**Analysis Script**   
The file run_analysis.R contains the script doing the following (the script assume a data directory at the working directory containing the unzip contents from the original data zip file)    
*read the activity_labels.txt file    
*read the features.txt file    
*find the indexes for all measurements with either the "mean" or the "std()" keywords    
*loop for all the datasets    
  + read the measurement file  (X_????.txt)    
  + set the column names using data read from features.txt    
  + only select columns relating to mean or standard deviation   
  + read the activity file (y_????.txt)    
  + join the activity file with the activity label such that the activity description is there for each observation    
  + read in the subject (subject_????.txt)    
  + column bind the subject, activity, and the measurement subset    
  + if this is the first dataset, set the result of the column bind to allRows else merge into allRows   
  
*calculate the mean of each measurement group by subject and activity    
*set the column name for the subject and activity columns    

**Description of the columns in the output**

Subject   1..30   
Activity  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING   

The rest of the columns are the mean of the following measurements

tBodyAcc-mean()-X   
tBodyAcc-mean()-Y   
tBodyAcc-mean()-Z   
tBodyAcc-std()-X   
tBodyAcc-std()-Y   
tBodyAcc-std()-Z   
tGravityAcc-mean()-X   
tGravityAcc-mean()-Y   
tGravityAcc-mean()-Z   
tGravityAcc-std()-X   
tGravityAcc-std()-Y   
tGravityAcc-std()-Z   
tBodyAccJerk-mean()-X   
tBodyAccJerk-mean()-Y   
tBodyAccJerk-mean()-Z   
tBodyAccJerk-std()-X   
tBodyAccJerk-std()-Y   
tBodyAccJerk-std()-Z   
tBodyGyro-mean()-X   
tBodyGyro-mean()-Y   
tBodyGyro-mean()-Z   
tBodyGyro-std()-X   
tBodyGyro-std()-Y   
tBodyGyro-std()-Z   
tBodyGyroJerk-mean()-X   
tBodyGyroJerk-mean()-Y   
tBodyGyroJerk-mean()-Z   
tBodyGyroJerk-std()-X   
tBodyGyroJerk-std()-Y   
tBodyGyroJerk-std()-Z   
tBodyAccMag-mean()   
tBodyAccMag-std()   
tGravityAccMag-mean()   
tGravityAccMag-std()   
tBodyAccJerkMag-mean()   
tBodyAccJerkMag-std()   
tBodyGyroMag-mean()   
tBodyGyroMag-std()   
tBodyGyroJerkMag-mean()    
tBodyGyroJerkMag-std()   
fBodyAcc-mean()-X   
fBodyAcc-mean()-Y   
fBodyAcc-mean()-Z   
fBodyAcc-std()-X   
fBodyAcc-std()-Y   
fBodyAcc-std()-Z   
fBodyAcc-meanFreq()-X   
fBodyAcc-meanFreq()-Y   
fBodyAcc-meanFreq()-Z   
fBodyAccJerk-mean()-X   
fBodyAccJerk-mean()-Y   
fBodyAccJerk-mean()-Z   
fBodyAccJerk-std()-X   
fBodyAccJerk-std()-Y   
fBodyAccJerk-std()-Z   
fBodyAccJerk-meanFreq()-X   
fBodyAccJerk-meanFreq()-Y   
fBodyAccJerk-meanFreq()-Z   
fBodyGyro-mean()-X   
fBodyGyro-mean()-Y   
fBodyGyro-mean()-Z   
fBodyGyro-std()-X   
fBodyGyro-std()-Y   
fBodyGyro-std()-Z   
fBodyGyro-meanFreq()-X   
fBodyGyro-meanFreq()-Y   
fBodyGyro-meanFreq()-Z   
fBodyAccMag-mean()   
fBodyAccMag-std()   
fBodyBodyAccJerkMag-mean()   
fBodyBodyAccJerkMag-std()   
fBodyBodyGyroMag-mean()   
fBodyBodyGyroMag-std()   
fBodyBodyGyroJerkMag-mean()   
fBodyBodyGyroJerkMag-std()   
fBodyBodyGyroJerkMag-meanFreq()   
