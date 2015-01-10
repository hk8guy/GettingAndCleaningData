# Introduction

The course project is to work with the data set provided. One R script is created to perform the tasks of cleaning up the data and producing a text file of the tidy data set.

# Description of Files

1.	CodeBook.md - The code book described the variables and the data
2.	project_instruction.md - A copy of course project instruction
3.	README.md - Introduction and description of the R script
4.	run_analysis.R - The R script that manipulates the data set and produce the final result in text file
5.	tidy_data.txt - The final result containing the tidy data set

# run_analysis.R

The R script works in the following steps:
1.	Read all the text files (activity_labels.txt, features.txt, subject_test.txt, X_test.txt, y_test.txt, subject_train.txt, X_train.txt, y_train.txt)
	"read.table" is used without header.
	The text files folder structure is maintained.
	The text files are saved into corresponding data frames.
2.	Merge both the test data and train data using "cbind".
3.	Combine the test data and merge data using "rbind".
4.	Name the variables in all the data frames for manipulation later.
	Here, the variable names in the merged data set are applied directly from the features data set.
5.	Extract the data that have mean and standard deviation using "grepl". The keyword are "mean()" and "std()".
6.	Apply the descriptive activity names to the data set by using "merge".
7.	Create a new data set with the average of each variable for each activity and each subject by using "sapply", "split" and "colMeans".
	Here, descriptive activity names are omitted for "sapply" to work.
	The created table has variables as rows and subject+activity as columns. Therefore, tranpose "t" is applied.
	In order to transform the data set into data frame, row names (i.e. subject+activity) are removed before "as.data.frame" is applied.
	The final touch is to add back the descriptive activity names to the data set by using "merge".
8.	Use "write.table" to generate the text file "tidy_data.txt" containing the final result.
	As instructed, row names are omitted.

