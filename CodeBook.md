# Source data set information

Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

# Transformations

Following transformations were done to the source data:

- script downloads source data set and unzip it

- source data set divided to test and train data sets with 3 files (i.e. X_test.txt, y_test.txt and subject_test.txt) in each data set directory that contains activity IDs, subjects IDs and measurements. Script combines them to data frames using `cbind` function.

- combine data frames to single, full data frame called `fullDataset` using `rbind` function

- set names to `fullDataset` columns, including feature names from `features.txt` file

- filter out all odd data, leave only necessary columns with activity ID, subject ID and mean/standard deviation features

- replace activity IDs with labels: read descriptive activity labels from `activity_labels.txt`, merge it with `fullDataset` and drop column with activity IDs

- rename columns with measurements to descriptive names: capitalize 'mean' and 'std', replace starting 't' with 'Time' and 'f' with 'Freq', remove brackets and replace '-' with '_'

- make resulting tidy data set called `avgDataset` with average of each variable for each activity and each subject and wtite out it to 'average_dataset.txt' file

# Tidy data set variables:

|  Name  |  Value  | 
|--------|---------|
| Activity | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING | 
| Subject | [1, 30] | 
| AvgTimeBodyAcc_Mean_X | [-1, 1] | 
| AvgTimeBodyAcc_Mean_Y | [-1, 1] | 
| AvgTimeBodyAcc_Mean_Z | [-1, 1] | 
| AvgTimeBodyAcc_Std_X | [-1, 1] | 
| AvgTimeBodyAcc_Std_Y | [-1, 1] | 
| AvgTimeBodyAcc_Std_Z | [-1, 1] | 
| AvgTimeGravityAcc_Mean_X | [-1, 1] | 
| AvgTimeGravityAcc_Mean_Y | [-1, 1] | 
| AvgTimeGravityAcc_Mean_Z | [-1, 1] | 
| AvgTimeGravityAcc_Std_X | [-1, 1] | 
| AvgTimeGravityAcc_Std_Y | [-1, 1] | 
| AvgTimeGravityAcc_Std_Z | [-1, 1] | 
| AvgTimeBodyAccJerk_Mean_X | [-1, 1] | 
| AvgTimeBodyAccJerk_Mean_Y | [-1, 1] | 
| AvgTimeBodyAccJerk_Mean_Z | [-1, 1] | 
| AvgTimeBodyAccJerk_Std_X | [-1, 1] | 
| AvgTimeBodyAccJerk_Std_Y | [-1, 1] | 
| AvgTimeBodyAccJerk_Std_Z | [-1, 1] | 
| AvgTimeBodyGyro_Mean_X | [-1, 1] | 
| AvgTimeBodyGyro_Mean_Y | [-1, 1] | 
| AvgTimeBodyGyro_Mean_Z | [-1, 1] | 
| AvgTimeBodyGyro_Std_X | [-1, 1] | 
| AvgTimeBodyGyro_Std_Y | [-1, 1] | 
| AvgTimeBodyGyro_Std_Z | [-1, 1] | 
| AvgTimeBodyGyroJerk_Mean_X | [-1, 1] | 
| AvgTimeBodyGyroJerk_Mean_Y | [-1, 1] | 
| AvgTimeBodyGyroJerk_Mean_Z | [-1, 1] | 
| AvgTimeBodyGyroJerk_Std_X | [-1, 1] | 
| AvgTimeBodyGyroJerk_Std_Y | [-1, 1] | 
| AvgTimeBodyGyroJerk_Std_Z | [-1, 1] | 
| AvgTimeBodyAccMag_Mean | [-1, 1] | 
| AvgTimeBodyAccMag_Std | [-1, 1] | 
| AvgTimeGravityAccMag_Mean | [-1, 1] | 
| AvgTimeGravityAccMag_Std | [-1, 1] | 
| AvgTimeBodyAccJerkMag_Mean | [-1, 1] | 
| AvgTimeBodyAccJerkMag_Std | [-1, 1] | 
| AvgTimeBodyGyroMag_Mean | [-1, 1] | 
| AvgTimeBodyGyroMag_Std | [-1, 1] | 
| AvgTimeBodyGyroJerkMag_Mean | [-1, 1] | 
| AvgTimeBodyGyroJerkMag_Std | [-1, 1] | 
| AvgFreqBodyAcc_Mean_X | [-1, 1] | 
| AvgFreqBodyAcc_Mean_Y | [-1, 1] | 
| AvgFreqBodyAcc_Mean_Z | [-1, 1] | 
| AvgFreqBodyAcc_Std_X | [-1, 1] | 
| AvgFreqBodyAcc_Std_Y | [-1, 1] | 
| AvgFreqBodyAcc_Std_Z | [-1, 1] | 
| AvgFreqBodyAccJerk_Mean_X | [-1, 1] | 
| AvgFreqBodyAccJerk_Mean_Y | [-1, 1] | 
| AvgFreqBodyAccJerk_Mean_Z | [-1, 1] | 
| AvgFreqBodyAccJerk_Std_X | [-1, 1] | 
| AvgFreqBodyAccJerk_Std_Y | [-1, 1] | 
| AvgFreqBodyAccJerk_Std_Z | [-1, 1] | 
| AvgFreqBodyGyro_Mean_X | [-1, 1] | 
| AvgFreqBodyGyro_Mean_Y | [-1, 1] | 
| AvgFreqBodyGyro_Mean_Z | [-1, 1] | 
| AvgFreqBodyGyro_Std_X | [-1, 1] | 
| AvgFreqBodyGyro_Std_Y | [-1, 1] | 
| AvgFreqBodyGyro_Std_Z | [-1, 1] | 
| AvgFreqBodyAccMag_Mean | [-1, 1] | 
| AvgFreqBodyAccMag_Std | [-1, 1] | 
| AvgFreqBodyBodyAccJerkMag_Mean | [-1, 1] | 
| AvgFreqBodyBodyAccJerkMag_Std | [-1, 1] | 
| AvgFreqBodyBodyGyroMag_Mean | [-1, 1] | 
| AvgFreqBodyBodyGyroMag_Std | [-1, 1] | 
| AvgFreqBodyBodyGyroJerkMag_Mean | [-1, 1] | 
| AvgFreqBodyBodyGyroJerkMag_Std | [-1, 1] | 
