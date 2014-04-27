
The variables and the data used are as follows:
 

  file_x_test: stores data from the x_test file
  
  file_y_test: stires data from the y_test file

  file_subject_test: stores data from subject_test file

  file_x_train: stores data from x_train file

  file_y_train: stores data from y_train file
  
  file_subject_train: stores data from subject_train file 

  overall_test_data: combines data from file_x_test, file_y_test, file_subject_test

  overall_training_data : combines data from file_x_train, file_y_train, file_subject_train
 
  overall_data : combines data from overall_test_data, overall_training_data

  featureNames : gets the feature names from features file

  mean_columns : subsets the mean columns
  
  stdDev_columns:  subsets the standard deviation columns
  
  tidy_data stores the subsetted data

  split_tidy_data:  stores the summary data based on activity and subject

The transformations are as follows:

1) Merging of the training and the test data sets: this involved merging of data from 6 individual files
2) Subsetting data to include only mean and standard deviation columns: Used the grep function to accomplish this. Also added column names before grepping.
3) Summarization of data: Summarized the data based on the activity and subjects. Reported the mean of individual cloumns by activities and subjects. Used the split and
lappy functions to accomplish this
4) Wrote the data to two individual files on the hard drive in the working directory.
