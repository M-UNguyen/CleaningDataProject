library(data.table)


# STEP 1.a: From the Human Activity Recognition (HAR) input data set,
# read into tables the 2 files that contain the 6 activity labels and
# the names of the 561 features (or measurements), respectively.
#
activityLabels <- read.table("activity_labels.txt")
features <- read.table("features.txt", stringsAsFactors = FALSE)


# STEP 1.b: Read into tables the 3 text files that make up the test
# set (subjects, activities, measurements).
# Of the table that contains the measurements, set the column names
# to the feature names read in Step 1.a.
# Merge the 3 files into a data set of 2947 rows (observations)
# and 563 columns (561 measurements plus the subject and activity
# columns).
#
subjects <- read.table("test/subject_test.txt", col.names = "subjectID")
activities <- read.table("test/y_test.txt", col.names = "activityID")
testSet <- read.table("test/X_test.txt")
colnames(testSet) <- features[,2]
testSet <- cbind(subjects, activities, testSet)


# STEP 1.c: Read into tables the 3 text files that make up the
# training set.
# Set the column names of the file containing the measurements
# to the feature names read in Step 1.a.
# Merge the 3 files into a data set of 7352 rows and 563 columns.
#
subjects <- read.table("train/subject_train.txt", col.names = "subjectID")
activities <- read.table("train/y_train.txt", col.names = "activityID")
trainingSet <- read.table("train/X_train.txt")
colnames(trainingSet) <- features[,2]
trainingSet <- cbind(subjects, activities, trainingSet)


# STEP 1.d:  Merge the training and test sets into one data set
# of 10299 rows and 563 columns.
#
ds <- rbind(trainingSet, testSet)


# STEP 2: Extract the mean and standard deviation variables
# except for meanFreq; also leave out angle variables.
# The data set now has 66 measurements plus the subject and
# activity columns
#
ds <- ds[, c(1, 2, grep("mean\\(|std\\(", colnames(trainingSet)))]


# STEP 3: Replace the activity IDs with their corresponding
# activity labels obtained in Step 1.a.
#
ds$activityID <- factor(ds$activityID, labels = activityLabels[,2])


# STEP 4: Clean up variable names by removing parentheses,
# replacing dashes with dots (to avoid problems in R), and removing
# double words.
colnames(ds) <- sub("\\()", "", colnames(ds))
colnames(ds) <- gsub("-", ".", colnames(ds))
colnames(ds) <- sub("BodyBody", "Body", colnames(ds))


# STEP 5: Create a new tidy data set by summarizing the data set
# from Step 4 by subject and activity and computing the average
# mean and standard deviation for each combination.
# The wide-form tidy data set now has 180 rows and 68 columns.
dt <- as.data.table(ds)
tidy_dt <- dt[, lapply(.SD, mean), by = list(subjectID, activityID)]


# Write the tidied data table to a text file.
write.table(tidy_dt, file = "UCIHARdata.txt", row.names = FALSE)


# Script to read the tidied output file back into R:
mydt <- read.table("UCIHARdata.txt", header = TRUE)



