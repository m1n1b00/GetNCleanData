## Getting and Cleaning Data Course Project
## run_analysis.R
## Version 1.0
## Description: Preparing a tida set from data collected from the 
##     accelerometers from the Samsung Galaxy S smartphone

# library statements
library(reshape2)

# Set global variables
kDataDir <- "UCI HAR Dataset/"

###############################################################################
# 1. Merge the training and the test sets to create one data set.

# read in train and test datasets
train <- read.table(file = paste(kDataDir, "train/X_train.txt", sep = ""))
test <- read.table(file = paste(kDataDir, "test/X_test.txt", sep = ""))

# rowbind the two datasets together to create a single dataset
all <- rbind(train, test)

###############################################################################
# 2. Extract only the measurements on the mean and standard deviation for each
# measurement. 

# read in list of features
features.table <- read.table(paste(kDataDir, "features.txt", sep = ""))
# transform the feature names in the table to a vector 
features <- t(features.table[,2])

# create a logical vector where the column names match mean() or std() or 
# meanFreq()
find.mean.std <- sapply(features, 
                        function(x) grepl("mean\\(\\)|std\\(\\)|meanFreq\\(\\)",
                                          x, ignore.case = TRUE))
# subset the data to only contain measurements for mean and std
mean.std <- all[,find.mean.std]

###############################################################################
# 3. Use descriptive activity names to name the activities in the data set

# read in activities data
train.activities <- read.table(paste(kDataDir, "train/y_train.txt", sep = ""))
test.activities <- read.table(paste(kDataDir, "test/y_test.txt", sep = ""))
# rowbind the two datasets together to create a single dataset
all.activities <- rbind(train.activities, test.activities)
# name column in all.activities
colnames(all.activities) <- c("activity")

# read in activities labels and rename them
activities.labels <- read.table(paste(kDataDir, "activity_labels.txt", sep = ""))
activities.col.map <- data.frame()
for (i in seq(1:nrow(activities.labels))) {
  d <- cbind(activities.labels[i,1], tolower(gsub("_", ".", activities.labels[i,2])))
  activities.col.map <- rbind(activities.col.map, d)
}
# add column names to activity column map
colnames(activities.col.map) <- c("activity", "activity.name")

# map new activity label names to activities data set
all.activities <- merge(all.activities, activities.col.map)
all.activities <- subset(all.activities, select = -c(activity))

###############################################################################
# 4. Appropriately label the data set with descriptive variable names. 

# create a vector for feature column names
var.column.names <- c()
# loop through each feature that contains a measurement for mean and std,
# rename it, and add it to the column names vector
for (feature in features[,find.mean.std]) {
  s1 <- gsub("\\(\\)", "", feature)
  s2 <- gsub("-X", ".x", s1)
  s3 <- gsub("-Y", ".y", s2)
  s4 <- gsub("-Z", ".z", s3)
  s5 <- gsub("-", ".", s4)
  var.column.names <- c(var.column.names, s5)
}

# add the column names vector to the data containing the mean and std
# measurements data 
colnames(mean.std) <- var.column.names

# column bind the activies data with the std and mean measurements data
mean.std <- cbind(all.activities, mean.std)

###############################################################################
# 5. From the data set in step 4, create a second, independent tidy dataset 
# with the average of each variable for each activity and each subject.

# read in the train and test subject files
train.subjects <- read.table(file = paste(kDataDir, "train/subject_train.txt", sep = ""))
test.subjects <- read.table(file = paste(kDataDir, "test/subject_test.txt", sep = ""))
# row bind the two subject datasets together to create a single dataset
all.subjects <- rbind(train.subjects, test.subjects) 
# add column name
colnames(all.subjects) <- c("subject")
# column bind the subject data to the mean.std feature dataset
mean.std <- cbind(all.subjects, mean.std)

# melt the data so each row contains subject, activity, variable, value
mean.std.melt <- melt(mean.std, id.vars=c("subject", "activity.name"))
# restructure the data so each row represents a subject and the average for
# for each activity and feature
subject.data <- dcast(mean.std.melt, subject ~ variable, mean)

# output the final tidy dataset 
write.table(subject.data, "./tidyData.txt", sep = "\t", row.names = FALSE)
