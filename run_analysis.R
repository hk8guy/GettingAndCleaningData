## import all the text files
activity_labels <- read.table("activity_labels.txt", header = FALSE)
features <- read.table("features.txt", header = FALSE)
subject_test <- read.table("test/subject_test.txt", header = FALSE)
X_test <- read.table("test/X_test.txt", header = FALSE)
y_test <- read.table("test/y_test.txt", header = FALSE)
subject_train <- read.table("train/subject_train.txt", header = FALSE)
X_train <- read.table("train/X_train.txt", header = FALSE)
y_train <- read.table("train/y_train.txt", header = FALSE)

## merge the training and the test sets
my_data <- rbind(cbind(subject_train, y_train, X_train), cbind(subject_test, y_test, X_test))

## labels the data sets
names(activity_labels) <- c("activity_code", "activity")
names(features) <- c("feature_code", "feature")
names(my_data) <- c("subject", "activity_code", as.character(features$feature))

## extracts only the measurements on the mean and standard deviation for each measuremen
feature_logic <- grepl("mean()", features$feature, fixed = TRUE)|grepl("std()", features$feature, fixed = TRUE)
my_extract_data <- my_data[,c(TRUE, TRUE, feature_logic)]

## use descriptive activity names to name the activities in the data set
my_extract_data <- merge(my_extract_data, activity_labels)

## create  tidy data set with the average of each variable for each activity and each subject
my_final_data <- sapply(split(my_extract_data[,-69], list(my_extract_data$subject, my_extract_data$activity)), colMeans)
my_final_data <- t(my_final_data)
rownames(my_final_data) <- NULL
my_final_data <- as.data.frame(my_final_data)
my_final_data <- merge(my_final_data, activity_labels)

write.table(my_final_data, "tidy_data.txt", row.name = FALSE)
