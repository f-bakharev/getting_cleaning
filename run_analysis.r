# Load required packages
library(dplyr)
library(tidyr)

# Download and unzip the dataset if it doesn't exist
if (!file.exists("UCI HAR Dataset")) {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = "dataset.zip")
    unzip("dataset.zip")
}

# Read the activity labels and features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "functions"))

# Read training data
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
train_x <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
train_y <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Read test data
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
test_x <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
test_y <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

# 1. Merge training and test sets
X <- rbind(train_x, test_x)
Y <- rbind(train_y, test_y)
Subject <- rbind(train_subject, test_subject)
merged_data <- cbind(Subject, Y, X)

# 2. Extract only measurements on mean and standard deviation
selected_features <- merged_data %>% 
    select(subject, code, contains("mean"), contains("std"))

# 3. Use descriptive activity names
selected_features$code <- activity_labels[selected_features$code, 2]

# 4. Label with descriptive variable names
names(selected_features)[2] = "activity"
names(selected_features) <- gsub("^t", "Time", names(selected_features))
names(selected_features) <- gsub("^f", "Frequency", names(selected_features))
names(selected_features) <- gsub("Acc", "Accelerometer", names(selected_features))
names(selected_features) <- gsub("Gyro", "Gyroscope", names(selected_features))
names(selected_features) <- gsub("Mag", "Magnitude", names(selected_features))
names(selected_features) <- gsub("BodyBody", "Body", names(selected_features))

# 5. Create independent tidy dataset with averages
tidy_data <- selected_features %>%
    group_by(subject, activity) %>%
    summarise_all(mean)

# Write the tidy dataset to a file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)