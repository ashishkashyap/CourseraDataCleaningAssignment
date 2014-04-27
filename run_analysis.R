run_analysis<-function(){
  
  # Loading X_test.txt
  file_x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
  
  # Loading y_test.txt
  file_y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
  
  #Loading subject_test.txt
  file_subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
  
  # All Test Files loaded, now loading Training files
  
  # Loading X_train.txt
  file_x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
  
  # Loading y_train.txt
  file_y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
  
  # Loading subject_train.txt
  file_subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
  
  # All files are now loaded. Merging now...
  
  # Merging Test Data first
  overall_test_data <- cbind(file_subject_test, file_y_test, file_x_test)
  
  # Merging Training Data now
  overall_training_data <- cbind(file_subject_train, file_y_train, file_x_train)  
  
  # Now merging the rows across test and training data
  
  overall_data <- rbind(overall_test_data, overall_training_data)
  
  # Loading the feature names
  featureNames <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors=FALSE)
  featureNames <- featureNames[[2]]
  additionalColumnNames <- c("Subject", "Activity")
  featureNames <- append(additionalColumnNames, featureNames)
  names(overall_data) <- featureNames
  
  # Now subsetting data to get only the means and standard deviation columns along with the subject and activity
  mean_columns <- overall_data[, grep("mean\\(\\)", names(overall_data))]
  stdDev_columns <- overall_data[, grep("std\\(\\)", names(overall_data))]
  tidy_data <- cbind(overall_data[,1:2], mean_columns, stdDev_columns)
  
  # Splitting the tidy data by subject and activity
  split_tidy_data <- split(tidy_data, list(tidy_data$Subject, tidy_data$Activity))
  split_tidy_data <- as.data.frame(t(as.data.frame(lapply(split_tidy_data, colMeans)))) 
  
  # Now giving descriptive names to activities
  tidy_data$Activity <- replace(tidy_data$Activity, tidy_data$Activity == 1,"WALKING")
  tidy_data$Activity <- replace(tidy_data$Activity, tidy_data$Activity == 2,"WALKING_UPSTAIRS")
  tidy_data$Activity <- replace(tidy_data$Activity, tidy_data$Activity == 3,"WALKING_DOWNSTAIRS")
  tidy_data$Activity <- replace(tidy_data$Activity, tidy_data$Activity == 4,"SITTING")
  tidy_data$Activity <- replace(tidy_data$Activity, tidy_data$Activity == 5,"STANDING")
  tidy_data$Activity <- replace(tidy_data$Activity, tidy_data$Activity == 6,"LAYING")
  
  split_tidy_data$Activity <- replace(split_tidy_data$Activity, split_tidy_data$Activity == 1,"WALKING")
  split_tidy_data$Activity <- replace(split_tidy_data$Activity, split_tidy_data$Activity == 2,"WALKING_UPSTAIRS")
  split_tidy_data$Activity <- replace(split_tidy_data$Activity, split_tidy_data$Activity == 3,"WALKING_DOWNSTAIRS")
  split_tidy_data$Activity <- replace(split_tidy_data$Activity, split_tidy_data$Activity == 4,"SITTING")
  split_tidy_data$Activity <- replace(split_tidy_data$Activity, split_tidy_data$Activity == 5,"STANDING")
  split_tidy_data$Activity <- replace(split_tidy_data$Activity, split_tidy_data$Activity == 6,"LAYING")  

  write.table(tidy_data, file="tidy_data.txt")
  
  write.table(split_tidy_data, file="split_tidy_data.txt")
  
  
  return (split_tidy_data)

}