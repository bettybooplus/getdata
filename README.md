## Description of R scripts
======

* The R script called 'run_analysis.R' in this repo is intended to create an independent tidy data set with the average of each variable for each activity and each subject. The following steps summarize what the script does: 
  * Downloads the dataset if it does not already exist in the working directory.
  * Loads both, the training and test datasets,the activity and feature info.
  * Merges the two datasets (training and test). 
  * Selects only those columns whith the measurements of the mean and standard deviation.
  * Assigns names (features.txt) to columns in the dataset.
  * Adds the activity and subject data for each dataset, and merges those columns with the dataset.
  * Uses descriptive activity names to name the activities in the data set.
  * Calculates the average of each variable for each activity and each subject.
  * One output file is generated in the current working directory called: 'tidydata.txt'. It contains a data frame of 180*68 dimension.


* To perform the analysis source the script 'run_analysis.R'. 

       source ("run_analysis.R")

* In order to read the tidy data in R, do the following:

       tidy <- read.table ("tidydata.txt", header=TRUE)

