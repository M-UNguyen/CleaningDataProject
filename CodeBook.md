#Codebook for *Getting and Cleaning Data Course Project*:  Create Tidy Data Set from UCI Human Activity Recognition Data
This codebook describes how a wide-form tidy data set was derived from the UCI Human Activity Data (HAR) data available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  An overview of the HAR input data and the R processing script (**run_analysis.R**) can be found in a companion **README.md** to this codebook.
##Background on UCI HAR Input Data
To help explain the variables in the Data Dictionary at the end of this codebook, the following overview of the HAR experiment was excerpted from the *README.txt* in the input data set referenced above (source:  Jorge L. Reyes-Ortiz, Davide Anguita, Alesandro Ghio, Luca Oneto, Smartlab - Non Linear Complex Systems Laboratory, DITEN - Universita degli Studi di Genova, Genoa I-16145, Italy).

> The experiments have been carried out with a group of 30 volunteers
> within an age bracket of 19-48 years. Each person performed six
> activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
> STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
> waist. Using its embedded accelerometer and gyroscope, we captured
> 3-axial linear acceleration and 3-axial angular velocity at a constant
> rate of 50Hz. The experiments have been video-recorded to label the
> data manually. The obtained dataset has been randomly partitioned into
> two sets, where 70% of the volunteers was selected for generating the
> training data and 30% the test data. 

Additional information on the variables was provided in the *features_info.txt* included in the same HAR input data set.

> The features selected for this database come from the accelerometer
> and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time
> domain signals (prefix 't' to denote time) were captured at a constant
> rate of 50 Hz. Then they were filtered using a median filter and a 3rd
> order low pass Butterworth filter with a corner frequency of 20 Hz to
> remove noise. Similarly, the acceleration signal was then separated
> into body and gravity acceleration signals (tBodyAcc-XYZ and
> tGravityAcc-XYZ) using another low pass Butterworth filter with a
> corner frequency of 0.3 Hz. 
> 
> Subsequently, the body linear acceleration and angular velocity were
> derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
> tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional
> signals were calculated using the Euclidean norm (tBodyAccMag,
> tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
> 
> Finally a Fast Fourier Transform (FFT) was applied to some of these
> signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
> fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to
> indicate frequency domain signals). 
> 
> These signals were used to estimate variables of the feature vector
> for each pattern:   '-XYZ' is used to denote 3-axial signals in the X,
> Y and Z directions.

##Tidy Data Set
The wide-form tidy data set **UCIHARdata.txt** was derived from the HAR input data set by performing the following steps:

 1. The training and test sets were merged into one data set.
 2. Variables were extracted that represent the mean and standard deviation for each measurement.  Only variables containing the substring *mean()* and *std()* were extracted; the *meanFreq()* variables and the additional *angle* variables were discarded.
 3. The activity identifiers in the merged data set were replaced with their corresponding activity names.
 4. Variable names were fixed by removing parentheses, replacing dashes with dots (to avoid problems with languages like R), removing the word "Body" repeated in some of the variables. In order to retain the original naming convention and its readability, no other changes were made (for instance, contrary to general guidelines for readable variable names, converting all characters to lower case and expanding substrings such as "Acc" to "accelerator" would have made the variables less readable).
 5. From the merged data set, a wide-form tidy data set was created that, for each subject and activity, contains the average of each mean and standard deviation variable.
 
## Data Dictionary

    1. subjectID
    	integer
    	Idenfies the subject performing the activity measured
	    	in the observation
    	Value is 1 through 30
    2. activityID
    	factor with 6 levels
    	Identifies the activity performed by the subject
    		and measured in the observation
    	"LAYING","SITTING", "WALKING", "WALKING_UPSTAIRS",
    		"WALKING_DOWNSTAIRS", "STANDING"
    3. tBodyAcc.mean.X
    	numeric
    	Average mean of time domain signals for body linear
    		acceleration in the X direction
    	Normalized and bounded within [-1,1]
    4. tBodyAcc.mean.Y
    	numeric
    	Average mean of time domain signals for body linear
    		acceleration in the Y direction
    	Normalized and bounded within [-1,1]
    5. tBodyAcc.mean.Z
    	numeric
    	Average mean of time domain signals for body linear
    		acceleration in the Z direction
    	Normalized and bounded within [-1,1]
    6. tBodyAcc.std.X
    	numeric
    	Average standard deviation of time domain signals for
    		body linear acceleration in the X direction
    	Normalized and bounded within [-1,1]
    7. tBodyAcc.std.Y
    	numeric
    	Average standard deviation of time domain signals for
    		body linear acceleration in the Y direction
    	Normalized and bounded within [-1,1]
    8. tBodyAcc.std.Z
    	numeric
    	Average standard deviation of time domain signals for
    		body linear acceleration in the Z direction
    	Normalized and bounded within [-1,1]
    9. tGravityAcc.mean.X
    	numeric
    	Average mean of time domain signals for gravity
    		acceleration in the X direction
    	Normalized and bounded within [-1,1]
    10. tGravityAcc.mean.Y
    	numeric
    	Average mean of time domain signals for gravity
    		acceleration in the Y direction
    	Normalized and bounded within [-1,1]
    11. tGravityAcc.mean.Z
    	numeric
    	Average mean of time domain signals for gravity
    		acceleration in the Z direction
    	Normalized and bounded within [-1,1]
    12. tGravityAcc.std.X
    	numeric
    	Average standard deviation of time domain signals for
    		gravity acceleration in the X direction
    	Normalized and bounded within [-1,1]
    13. tGravityAcc.std.Y
    	numeric
    	Average standard deviation of time domain signals for
    		gravity acceleration in the Y direction
    	Normalized and bounded within [-1,1]
    14. tGravityAcc.std.Z
    	numeric
    	Average standard deviation of time domain signals for
    		gravity acceleration in the Z direction
    	Normalized and bounded within [-1,1] 
    15. tBodyAccJerk.mean.X
    	numeric
    	Average mean of time domain signals for body linear
    		acceleration jerk in the X direction
    	Normalized and bounded within [-1,1]
    16. tBodyAccJerk.mean.Y
    	numeric
    	Average mean of time domain signals for body linear
    		acceleration jerk in the Y direction
    	Normalized and bounded within [-1,1]
    17. tBodyAccJerk.mean.Z
    	numeric
    	Average mean of time domain signals for body linear
    		acceleration jerk in the Z direction
    	Normalized and bounded within [-1,1]
    18. tBodyAccJerk.std.X
    	numeric
    	Average standard deviation of time domain signals for
    		body linear acceleration jerk in the X direction
    	Normalized and bounded within [-1,1]
    19. tBodyAccJerk.std.Y
    	numeric
    	Average standard deviation of time domain signals for
    		body linear acceleration jerk in the Y direction
    	Normalized and bounded within [-1,1]
    20. tBodyAccJerk.std.Z
    	numeric
    	Average standard deviation of time domain signals for
    		body linear acceleration jerk in the Z direction
    	Normalized and bounded within [-1,1]
    21. tBodyGyro.mean.X
    	numeric
    	Average mean of time domain signals for angular
    		velocity in the X direction
    	Normalized and bounded within [-1,1]
    22. tBodyGyro.mean.Y
    	numeric
    	Average mean of time domain signals for angular
    		velocity in the Y direction
    	Normalized and bounded within [-1,1]
    23. tBodyGyro.mean.Z
    	numeric
    	Average mean of time domain signals for angular
    		velocity in the Z direction
    	Normalized and bounded within [-1,1]
    24. tBodyGyro.std.X
    	numeric
    	Average standard deviation of time domain signals for
    		angular velocity in the X direction
    	Normalized and bounded within [-1,1] 
    25. tBodyGyro.std.Y
    	numeric
    	Average standard deviation of time domain signals for
    		angular velocity in the Y direction
    	Normalized and bounded within [-1,1]
    26. tBodyGyro.std.Z
    	numeric
    	Average standard deviation of time domain signals for
    		angular velocity in the Z direction
    	Normalized and bounded within [-1,1] 
    27. tBodyGyroJerk.mean.X
    	numeric
    	Average mean of time domain signals for angular
    		velocity jerk in the X direction
    	Normalized and bounded within [-1,1]
    28. tBodyGyroJerk.mean.Y
    	numeric
    	Average mean of time domain signals for angular
    		velocity jerk in the Y direction
    	Normalized and bounded within [-1,1]
    29. tBodyGyroJerk.mean.Z
    	numeric
    	Average mean of time domain signals for angular
    		velocity jerk in the Z direction
    	Normalized and bounded within [-1,1]
    30. tBodyGyroJerk.std.X
    	numeric
    	Average standard deviation of time domain signals for
    		angular velocity jerk in the X direction
    	Normalized and bounded within [-1,1] 
    31. tBodyGyroJerk.std.Y
    	numeric
    	Average standard deviation of time domain signals for
    		angular velocity jerk in the Y direction
    	Normalized and bounded within [-1,1]
    32. tBodyGyroJerk.std.Z
    	numeric
    	Average standard deviation of time domain signals for
    		angular velocity jerk in the Z direction
    	Normalized and bounded within [-1,1] 
    33. tBodyAccMag.mean
    	numeric
    	Average mean of magnitude of time domain signals for
    		body linear acceleration
    	Normalized and bounded within [-1,1]
    34. tBodyAccMag.std
    	numeric
    	Average standard deviation of magnitude of time domain signals
	    	for body linear acceleration
    	Normalized and bounded within [-1,1]
    35. tGravityAccMag.mean
    	numeric
    	Average mean of magnitude of time domain signals for
    		gravity acceleration
    	Normalized and bounded within [-1,1]
    36. tGravityAccMag.std
    	numeric
    	Average standard deviation of magnitude of time domain signals
	    	for gravity acceleration
    	Normalized and bounded within [-1,1]
    37. tBodyAccJerkMag.mean
    	numeric
    	Average mean of magnitude of time domain signals for
    		body linear acceleration jerk
    	Normalized and bounded within [-1,1]
    38. tBodyAccJerkMag.std
    	numeric
    	Average standard deviation of magnitude of time domain signals
	    	for body linear acceleration jerk
    	Normalized and bounded within [-1,1]
    39. tBodyGyroMag.mean
    	numeric
    	Average mean of magnitude of time domain signals for
    		angular velocity
    	Normalized and bounded within [-1,1]
    40. tBodyGyroMag.std
    	numeric
    	Average standard deviation of magnitude of time domain signals
	    	for angular velocity
    	Normalized and bounded within [-1,1] 
    41. tBodyGyroJerkMag.mean
    	numeric
    	Average mean of magnitude of time domain signals for
    		angular velocity jerk
    	Normalized and bounded within [-1,1]
    42. tBodyGyroJerkMag.std
    	numeric
    	Average standard deviation of magnitude of time domain
	    	signals for angular velocity jerk
    	Normalized and bounded within [-1,1] 
    	

    43. fBodyAcc.mean.X
    	numeric
    	Average mean of frequency domain signals for body linear
    		acceleration in the X direction
    	Normalized and bounded within [-1,1]
    44. fBodyAcc.mean.Y
    	numeric
    	Average mean of frequency domain signals for body linear
    		acceleration in the Y direction
    	Normalized and bounded within [-1,1]
    45. fBodyAcc.mean.Z
    	numeric
    	Average mean of frequency domain signals for body linear
    		acceleration in the Z direction
    	Normalized and bounded within [-1,1]
    46. fBodyAcc.std.X
    	numeric
    	Average standard deviation of frequency domain signals
	    	for body linear acceleration in the X direction
    	Normalized and bounded within [-1,1]
    47. fBodyAcc.std.Y
    	numeric
    	Average standard deviation of frequency domain signals
	    	for body linear acceleration in the Y direction
    	Normalized and bounded within [-1,1]
    48. fBodyAcc.std.Z
    	numeric
    	Average standard deviation of frequency domain signals
	    	for body linear acceleration in the Z direction
    	Normalized and bounded within [-1,1]
    49. fBodyAccJerk.mean.X
    	numeric
    	Average mean of frequency domain signals for body linear
    		acceleration jerk in the X direction
    	Normalized and bounded within [-1,1]
    50. fBodyAccJerk.mean.Y
    	numeric
    	Average mean of frequency domain signals for body linear
    		acceleration jerk in the Y direction
    	Normalized and bounded within [-1,1]
    51. fBodyAccJerk.mean.Z
    	numeric
    	Average mean of frequency domain signals for body linear
    		acceleration jerk in the Z direction
    	Normalized and bounded within [-1,1]
    52. fBodyAccJerk.std.X
    	numeric
    	Average standard deviation of frequency domain signals
	    	for body linear acceleration jerk in the X direction
    	Normalized and bounded within [-1,1]
    53. fBodyAccJerk.std.Y
    	numeric
    	Average standard deviation of frequency domain signals
	    	for body linear acceleration jerk in the Y direction
    	Normalized and bounded within [-1,1]
    54. fBodyAccJerk.std.Z
    	Average standard deviation of frequency domain signals
	    	for body linear acceleration jerk in the Z direction
    	Normalized and bounded within [-1,1]
    55. fBodyGyro.mean.X
    	numeric
    	Average mean of frequency domain signals for angular
    		velocity in the X direction
    	Normalized and bounded within [-1,1]
    56. fBodyGyro.mean.Y
    	numeric
    	Average mean of frequency domain signals for angular
    		velocity in the Y direction
    	Normalized and bounded within [-1,1]
    57. fBodyGyro.mean.Z
    	numeric
    	Average mean of frequency domain signals for angular
    		velocity in the Z direction
    	Normalized and bounded within [-1,1]
    58. fBodyGyro.std.X
    	numeric
    	Average standard deviation of frequency domain signals
	    	for angular velocity in the X direction
    	Normalized and bounded within [-1,1] 
    59. fBodyGyro.std.Y
    	numeric
    	Average standard deviation of frequency domain signals
	    	for angular velocity in the Y direction
    	Normalized and bounded within [-1,1]
    60. fBodyGyro.std.Z
    	numeric
    	Average standard deviation of frequency domain signals
	    	for angular velocity in the Z direction
    	Normalized and bounded within [-1,1]  
    61. fBodyAccMag.mean
    	numeric
    	Average mean of magnitude of frequency domain signals
	    	for body linear acceleration
    	Normalized and bounded within [-1,1]
    62. fBodyAccMag.std
    	numeric
    	Average standard deviation of magnitude of frequency
	    	domain signals for body linear acceleration
    	Normalized and bounded within [-1,1]
    63. fBodyAccJerkMag.mean
    	numeric
    	Average mean of magnitude of frequency domain signals
	    	for body linear acceleration jerk
    	Normalized and bounded within [-1,1]
    64. fBodyAccJerkMag.std
    	numeric
    	Average standard deviation of magnitude of frequency
	    	domain signals for body linear acceleration jerk
    	Normalized and bounded within [-1,1]
    65. fBodyGyroMag.mean
    	numeric
    	Average mean of magnitude of frequency domain signals
	    	for angular velocity
    	Normalized and bounded within [-1,1]
    66. fBodyGyroMag.std
    	numeric
    	Average standard deviation of magnitude of frequency
	    	domain signals for angular velocity
    	Normalized and bounded within [-1,1] 
    67. fBodyGyroJerkMag.mean
    	numeric
    	Average mean of magnitude of frequency domain signals
	    	for angular velocity jerk
    	Normalized and bounded within [-1,1]
    68. fBodyGyroJerkMag.std
    	numeric
    	Average standard deviation of magnitude of frequency
	    	domain signals for angular velocity jerk
    	Normalized and bounded within [-1,1]  


   




