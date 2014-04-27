CourseraDataCleaningAssignment
==============================

Coursera Data Cleaning Assignment
The function run_analysis is a no argument function that:
1) Reads in the test and training data sets (x values, y values, and the subject codes) from the local hard drive
2) Merges them using cbind and rbind functions to produce a consolidated data set
3) Reads the feature list from a file on the hard drive
4) Assigns the column names to the dataset created in step 2
5) Using the "grep" function, subsets the columns that have the texts "mean()", and "std()" in them
6) Replaces the activity codes with activity names using the "replace" function
7) Assigns column names to the Subject and Activity columns in the data set
8) Creates a summary report of means of all columns based on the combination of subjects and activities using the "split" and "lapply" functions
9) Writes the data files to the local hard drive using the "write.table" function

