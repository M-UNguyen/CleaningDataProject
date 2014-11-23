# *Getting and Cleaning Data Course Project*:  Script to Process UCI Human Activity Recognition Data

## Input
The input data set for this project was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

This data set came from the Human Activity Recognition (HAR) database,
built from experiments with 30 subjects performing activities while wearing Samsung smartphones with embedded sensors.

A description of the experiment and resultant data set can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

When unzipped, the HAR input data set contains the following sub-directories and data files:

 - **activity_labels** = mapping of activity identifiers (1 through 6) to activity names (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

 - **features.txt** = list of all the features (measurements) recorded in the test and training data sets.

 - **test** = sub-directory containing the test set:
	 - **subject_test.txt** = subject identifiers, in the [1-30] range, identifying the subject who performed the activity in the corresponding feature-vector row in X_test.txt.
	 - **X_test.txt** = feature vectors, normalized and bounded to the [-1, 1] range.
	 - **y_test.txt** = activity identifiers (values of 1-6), identifying the activity measured in the corresponding feature-vector row in X_test.txt
 - **training** = sub-directory containing the training set:
	 - **subject_train.txt** = subject identifiers, in the [1-30] range, identifying the subject who performed the activity in the corresponding feature-vector row in X_train.txt.
	 - **X_train.txt** = feature vectors, normalized and bounded to the [-1, 1] range.
	 - **y_train.txt** = activity identifiers (values of 1-6), identifying the activity measured in the corresponding feature-vector row in X_train.txt.
 
## Processing Script
The R script to process the HAR data set is stored in the **run_analysis.R** file, which must be placed in the same directory as the HAR data files and sub-directories listed above.  The data processing consists of the following steps:
 
 - Step 1 - Merge the training and test sets into one data set.
 - Step 2 - From the feature vectors, extract the columns representing the mean and standard deviation for each measurement.
 - Step 3 - Replace the activity identifiers in the merged data set with the more descriptive
   activity names.  
 - Step 4 - Fix the variable (column) names to make them more readable.
 - Step 5 - From the merged data set, create a second tidy data set that, for each subject and activity, contains the average of each variable.  Write the tidy data set to a text file.

## Output ##
The tidy data set created by the run_analysis.R script is saved to the output file **UCIHARdata.txt**.  This text file can be read back into R with the read.table command, header = TRUE.