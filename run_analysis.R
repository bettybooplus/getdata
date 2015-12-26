#load libraries
library(dplyr)
library (reshape2)

#get data set from the web
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Dataset.zip", method = "curl")
unzip("Dataset.zip", exdir="./")
setwd("UCI HAR Dataset/")

#read all data sets needed 
sub_test <- read.table("./test/subject_test.txt")
sub_train <- read.table("./train/subject_train.txt")
X_test <- read.table("./test/X_test.txt")
X_train <- read.table("./train/X_train.txt")
y_test <- read.table("./test/y_test.txt")
y_train <- read.table("./train/y_train.txt")
activity_labels <- read.table("./activity_labels.txt")
feature <- read.table("./features.txt")

#Merge the training and the test sets to create one data set
dataset <- rbind(X_test, X_train) #10299x561

#Extract only the measurements on the mean and standard deviation
selection <- feature[grepl("mean\\(\\)", as.character(feature$V2)) | grepl("std\\(\\)", as.character(feature$V2)), 1]
dataset <- select(dataset, num_range("V", selection)) #10299x66

#assign names to columns 
names(dataset) <- c(as.character(feature[selection,2])) 

#add what is left from the training and the test 
#sets: subject and labels (10299x68)
dataset <- mutate(dataset, 
       Subject= c (sub_test$V1, sub_train$V1),
       Activity = c (y_test$V1, y_train$V1)
)

#reorder variables where "Subject" and "Activity" are in the front
dataset <- select(dataset, Subject, Activity, everything())

#Use descriptive activity names to name the activities in the data set
dataset$Activity <- factor(dataset$Activity, levels=activity_labels$V1, labels=activity_labels$V2)

#Tidy data set with the average of each variable for each activity 
#and each subject
tidy <- dcast(melt(dataset, id=c("Subject","Activity")), Subject+Activity ~ variable, mean) #180x68

#write .txt file using write.table()function
write.table(tidy, "tidydata.txt", row.names = FALSE)
