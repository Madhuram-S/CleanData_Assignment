## Code Book for Tidy Human Activity Recognition (HAR) Using Smartphones dataset

The tidy Human Activity Recognition using dataset (HAR_tidy_dataset.txt) has been produced from the raw data obtained from Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. from Smartlab - Non Linear Complex Systems Laboratory.

### Source of data (Raw data)
The dataset .zip file can be obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone used by 30 volunteers performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The files that will be used to generate a tidy HAR dataset (HAR_tidy_dataset.txt) are : 
================================================================
* 'features.txt': List of all 561 features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': data values for training set.
* 'train/y_train.txt': Training labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* 'test/X_test.txt': data values for test set.
* 'test/y_test.txt': Test labels.
* 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

### Data transformation
From the above raw dataset, a tidier subset of the data was extracted based on the below requirement

* Both training and test data put together as whole dataset
* Each observation contains a subject variable and activity variable relating to the measurement
* Only mean and std measurements are considered. Also consider meanFreq() as it is weighted average of frequency measurements
* Each variable name has been given a descriptive value to identify what is being measured. For instance, tBodyAccmean()-X indicates, Body acceleration measured for x axis in time domain
* The activity variable indicates clearly the activity performed

Once this tidier data set is obtained, the data was reshaped to derive relationship by subject and activity to mean of each of the measurements. Thus for 30 volunteers performing 6 activties, 180 summary level observations are obtained

### Data Dictionary for Tidy HAR dataset

The file HAR_tidy_dataset.txt contains 81 variables. This file provides average of each variable for each activity and each subject or volunteer

* subject :- integer(2) - Identifies the subject or volunteer who participated in the experiment. Values ranges from 1 to 30

* activity :- character - List one of the six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

The below are average of measurement variables by subject and activity. Since it is a 3-axial measurement, three different variable are measured for x, y and z-axis

* tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z :- numeric - mean of Body Acceleration in time domain for x , y and z-axis 

* tBodyAcc-std()-X, tBodyAcc-std()-Y, tBodyAcc-std()-Z :- numeric - mean of Body Acceleration standard deviation in time domain for z-axis

* tGravityAcc-mean()-X, tGravityAcc-mean()-Y, tGravityAcc-mean()-Z :- numeric - mean of Gravity Acceleration in time domain for Z-axis

* tGravityAcc-std()-X, tGravityAcc-std()-Y, tGravityAcc-std()-Z :- numeric - mean of Gravity Acceleration standard deviation in time domain for Z-axis

* tBodyAccJerk-mean()-X, tBodyAccJerk-mean()-Y, tBodyAccJerk-mean()-Z :- numeric - mean of Body Jerk in acceleration in x, y and z- axis

* tBodyAccJerk-std()-X, tBodyAccJerk-std()-Y, tBodyAccJerk-std()-Z :- numeric - mean of standard deviation of Body Jerk in acceleration in x, y and z- axis

* tBodyGyro-mean()-X, tBodyGyro-mean()-Y, tBodyGyro-mean()-Z :- numeric - mean of body gyroscope signals in time domain for x, y and z- axis

* tBodyGyro-std()-X, tBodyGyro-std()-Y, tBodyGyro-std()-Z :- numeric - mean of standard dev. for of body gyroscope signals in time domain for x, y and z- axis

* tBodyGyroJerk-mean()-X, tBodyGyroJerk-mean()-Y, tBodyGyroJerk-mean()-Z :- numeric - mean of Body Jerk in gyroscope in time domain for x, y and z- axis

* tBodyGyroJerk-std()-X, tBodyGyroJerk-std()-Y, tBodyGyroJerk-std()-Z :- numeric - mean of standard dev. for Body Jerk in gyroscope in time domain for x, y and z- axis

* tBodyAccMag-mean(), tBodyAccMag-std(), tGravityAccMag-mean() :- numeric - mean of Gravity Acceleration magnitude in time domain for x, y and z- axis 
* tGravityAccMag-std(), tBodyAccJerkMag-mean(), tBodyAccJerkMag-std() :- numeric - mean of standard dev. Gravity Acceleration magnitude in time domain for x, y and z- axis 

* tBodyGyroMag-mean() :- numeric - mean of  Body Gyroscope signal magnitude in time domain for x, y and z- axis

* tBodyGyroMag-std() :- numeric - mean of std. dev. fo Body Gyroscope signal magnitude in time domain for x, y and z- axis

* tBodyGyroJerkMag-mean() :- numeric - mean of Body Jerk Gyroscope signal magnitude in time domain for x, y and z- axis
* tBodyGyroJerkMag-std() :- numeric - mean of std. dev. Body Jerk Gyroscope signal magnitude in time domain for x, y and z- axis

* fBodyAcc-mean()-X, fBodyAcc-mean()-Y, fBodyAcc-mean()-Z :- numeric - mean of Body acceleration in freq. domain for x, y and z-axis

* fBodyAcc-std()-X, fBodyAcc-std()-Y, fBodyAcc-std()-Z :- numeric - mean of std. dev. Body acceleration in freq. domain for x, y and z-axis

* fBodyAcc-meanFreq()-X, fBodyAcc-meanFreq()-Y, fBodyAcc-meanFreq()-Z :- numeric - mean of weigthed average of all Body Acceleration frequency measurements in x, y and z- axis

* fBodyAccJerk-mean()-X, fBodyAccJerk-mean()-Y, fBodyAccJerk-mean()-Z :- numeric - mean of Body Jerk during acceleration in freq. domain for x, y and z- axis

* fBodyAccJerk-std()-X, fBodyAccJerk-std()-Y, fBodyAccJerk-std()-Z :- numeric - mean of std. dev. Body Jerk during acceleration in freq. domain for x, y and z- axis

* fBodyAccJerk-meanFreq()-X, fBodyAccJerk-meanFreq()-Y, fBodyAccJerk-meanFreq()-Z :- numeric - mean of weigthed average of all Body Jerk during Acceleration frequency measurements in x, y and z- axis

* fBodyGyro-mean()-X, fBodyGyro-mean()-Y, fBodyGyro-mean()-Z :- numeric - mean of Body gyroscope signal in freq domain for x, y and z-axis

* fBodyGyro-std()-X, fBodyGyro-std()-Y, fBodyGyro-std()-Z :- numeric - mean of std. dev. Body gyroscope signal in freq domain for x, y and z-axis

* fBodyGyro-meanFreq()-X, fBodyGyro-meanFreq()-Y, fBodyGyro-meanFreq()-Z :- numeric - mean of weighted average of all Body gyroscope signal in freq domain for x, y and z-axis

* fBodyAccMag-mean() - :- numeric - mean of Body acceleration magnitude in freq. domain

* fBodyAccMag-std() :- numeric - mean of std. dev.  Body acceleration magnitude in freq. domain

* fBodyAccMag-meanFreq() :- numeric - mean of weighted average of Body acceleration magnitude in freq. domain

* fBodyBodyAccJerkMag-mean() :- numeric - mean of Body Jerk during acceleration magnitude in freq. domain 

* fBodyBodyAccJerkMag-std() :- numeric - mean of std. dev. Body Jerk during acceleration magnitude in freq. domain 

* fBodyBodyAccJerkMag-meanFreq() :- numeric - mean of weighted avg. of Body Jerk during acceleration magnitude in freq. domain

* fBodyBodyGyroMag-mean() :- numeric - mean of Body gyro magnitude in freq. domain

* fBodyBodyGyroMag-std() :- numeric - mean of std. dev. Body gyro magnitude in freq. domain

* fBodyBodyGyroMag-meanFreq() :- numeric - mean of weighted average of Body gyro magnitude in freq. domain

* fBodyBodyGyroJerkMag-mean() :- numeric - mean of Body Jerk in gyro magnitude in freq. domain

* fBodyBodyGyroJerkMag-std() :- numeric - mean of std. dev of Body Jerk in gyro magnitude in freq. domain

* fBodyBodyGyroJerkMag-meanFreq() :- numeric - mean of weighted average of Body Jerk in gyro magnitude in freq. domain