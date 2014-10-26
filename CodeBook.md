=======================================================================
Code Book
Describes each variable, including units and values in the tidy dataset
Version 1.0
=======================================================================

Instructions below assume you have followed the README instructions to download and unzip the data into a directory called .

# Input Files
* UCI HAR Dataset/train/X_train.txt: is the train set
* UCI HAR Dataset/test/X_test.txt: is the test set
* UCI HAR Dataset/features.txt: feature names corresponding to each column in the train and test set
* UCI HAR Dataset/train/y_train.txt: is the train activites set
* UCI HAR Dataset/test/y_test.txt: is the test activities set
* UCI HAR Dataset/activity_labels.txt: is the mapping file of activity id to activity label
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/train/subject_test.txt

# Informational Files
* UCI HAR Dataset/features_info.txt: contains information about the variable names
* [Google's R Style Guide](https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml)

# Output Files
* run_analysis.R: is the R script to generate the file tidyData.txt 
* tidyData.txt: is the output file generated from executing run_analysis.R

## tidyData.txt Variable Descriptions
Variable names from the original data specified in features.txt were transformed generally following the rules in [Google's R Style Guide](https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml).  

Each variable is a measure of an activity described in features_info.txt and it's original name was preserved (e.g. tBodyAcc).  The tidy data contains a subset of variables that matched the expressions: std, mean, meanFreq.  This is denoted in the second part of the variable name.  Lastly, if the variable was measured for one of three axial signals, it will be denoted by x, y, or z

A variable will have the form: `partialOrigName.[mean|std|meanFreq].[x|y|z]*`

A column for subject was added, where subject is a ID number as specified in subject_*.txt files

Columns for activity.name were added by mapping the activity ID in y_*.txt files to labels from activity_labels.txt file that were transformed to lowercase and replacing hyphens with periods.  

Following is a list of all variable names in the tidyData.txt data set:

subject
activity
activity.name
tBodyAcc.mean.x
tBodyAcc.mean.y
tBodyAcc.mean.z
tBodyAcc.std.x
tBodyAcc.std.y
tBodyAcc.std.z
tGravityAcc.mean.x
tGravityAcc.mean.y
tGravityAcc.mean.z
tGravityAcc.std.x
tGravityAcc.std.y
tGravityAcc.std.z
tBodyAccJerk.mean.x
tBodyAccJerk.mean.y
tBodyAccJerk.mean.z
tBodyAccJerk.std.x
tBodyAccJerk.std.y
tBodyAccJerk.std.z
tBodyGyro.mean.x
tBodyGyro.mean.y
tBodyGyro.mean.z
tBodyGyro.std.x
tBodyGyro.std.y
tBodyGyro.std.z
tBodyGyroJerk.mean.x
tBodyGyroJerk.mean.y
tBodyGyroJerk.mean.z
tBodyGyroJerk.std.x
tBodyGyroJerk.std.y
tBodyGyroJerk.std.z
tBodyAccMag.mean
tBodyAccMag.std
tGravityAccMag.mean
tGravityAccMag.std
tBodyAccJerkMag.mean
tBodyAccJerkMag.std
tBodyGyroMag.mean
tBodyGyroMag.std
tBodyGyroJerkMag.mean
tBodyGyroJerkMag.std
fBodyAcc.mean.x
fBodyAcc.mean.y
fBodyAcc.mean.z
fBodyAcc.std.x
fBodyAcc.std.y
fBodyAcc.std.z
fBodyAcc.meanFreq.x
fBodyAcc.meanFreq.y
fBodyAcc.meanFreq.z
fBodyAccJerk.mean.x
fBodyAccJerk.mean.y
fBodyAccJerk.mean.z
fBodyAccJerk.std.x
fBodyAccJerk.std.y
fBodyAccJerk.std.z
fBodyAccJerk.meanFreq.x
fBodyAccJerk.meanFreq.y
fBodyAccJerk.meanFreq.z
fBodyGyro.mean.x
fBodyGyro.mean.y
fBodyGyro.mean.z
fBodyGyro.std.x
fBodyGyro.std.y
fBodyGyro.std.z
fBodyGyro.meanFreq.x
fBodyGyro.meanFreq.y
fBodyGyro.meanFreq.z
fBodyAccMag.mean
fBodyAccMag.std
fBodyAccMag.meanFreq
fBodyBodyAccJerkMag.mean
fBodyBodyAccJerkMag.std
fBodyBodyAccJerkMag.meanFreq
fBodyBodyGyroMag.mean
fBodyBodyGyroMag.std
fBodyBodyGyroMag.meanFreq
fBodyBodyGyroJerkMag.mean
fBodyBodyGyroJerkMag.std
fBodyBodyGyroJerkMag.meanFreq