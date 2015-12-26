##CodeBook
======

###Overview

This file is intendend to describe all the variables, data and transformations that I have performed to clean up the data. 

###Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###The dataset includes the following files: 
* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name. 

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

The file 'subject.txt' is available for the train and test data, and its descriptions is equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

###Transformations from raw to tidy data

1. Download the dataset if it does not already exist in the working directory.
2. Load both, the training and test datasets,the activity and feature info.
3. Merge the two datasets (training and test). 
4. Select only those columns whith the measurements of the mean and standard deviation.
5. Assign names (features.txt) to columns in the dataset.
6. Add the activity and subject data for each dataset, and merges those columns with the dataset.
7. Use descriptive activity names to name the activities in the data set.
8. Create an independent tidy data set with the average of each variable for each activity and each subject. 
9. Finally, the output is stored in the file called 'tidydata.txt'.


####Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2). 
- The gyroscope units are rad/seg. 