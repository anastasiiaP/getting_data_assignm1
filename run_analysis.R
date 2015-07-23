
  ##  Open  library
  library(reshape2)
  
   ##__________________________________________________________________________________
  ## READING TEXT FILES AS TABLES FROM MAIN REPO
  ## NAMING COLUMNS


  ##  1. Read file "avtivity lables" and name colomns as "num_of_activity" (number of...), "type_of_activity"
      activity_labels <- read.table("./activity_labels.txt")
      colnames(activity_labels)=c("num_of_activity","type_of_activity")
  ##  2. Read file "features". As it has inside "number of feature" and "type of feature" columns,
      ## "type_of_feature" variable will be the second column
      features <- read.table("features.txt")
      type_of_feature <-  features[,2]
  ##____________________________________________________________________________________  
      
  ## READING TEXT FILES THAT ARE RELATED TO "X" AS TABLES
  ## NAMING COLUMNS
      
  ##  1. Read X test data and name columns using variable "type_of_feature"
      x_test_data <- read.table("./test/X_test.txt")
      colnames(x_test_data) <- type_of_feature
  
  ##  2. Read X training data and name columns using variable "type_of_feature"
      x_train_data <- read.table("./train/X_train.txt")
      colnames(x_train_data) <- type_of_feature
  

  
  ##____________________________________________________________________________________  
  
  ## READING TEXT FILES THAT ARE RELATED TO "Y" AS TABLES
  ## NAMING COLUMNS
  
  ##  1. Read "activity numbers" of the Y test data and name columns
      y_test_data <- read.table("./test/y_test.txt")
      colnames(y_test_data) <- "num_of_activity"
  

  ##  2. Read the numbers of activity of the Y training data and name columns
      y_train_data <- read.table("./train/y_train.txt")
     colnames(y_train_data) <- "num_of_activity"
  
  ##____________________________________________________________________________________  
  ##  READING TEST AND TRAINING SUBJECTS
  
  ##  1. Read numbers of the test subjects and name columns
     test_subject <- read.table("./test/subject_test.txt")
      colnames(test_subject) <- "num_of_subject"
  
  ##  2. Read numbers of the TRAIN subjects and name columns
     train_subject <- read.table("./train/subject_train.txt")
     colnames(train_subject) <- "num_of_subject"
  
  ##____________________________________________________________________________________  
  ## MAKE ONE TABLE USINE CBIND() AND RBIND()
  
  
  ## 1. make test data set using cbind()
  
     test_data_set <- cbind(test_subject, y_test_data, x_test_data)
  
  ## 2. make traning data set using cbind()
    
     train_data_set <- cbind(train_subject, y_train_data, x_train_data)
  
  ## 3. Make final data set
  
     data_set <- rbind(train_data_set, test_data_set)
  
  ##____________________________________________________________________________________  
  ##  PREPROCESSING OF THE DATA SET ACCORDING TO THE ASSIGNMENT 
  
  ##  1. Make data set with just mean or std values
   
  
     num_mean <- grep("mean",names(data_set),ignore.case=TRUE)
     name_mean <- names(data_set)[num_mean]
     
     num_std <- grep("std",names(data_set),ignore.case=TRUE)
     name_std <- names(data_set)[num_std]
     
     mean_and_std_data_set <-data_set[,c("num_of_subject","num_of_activity",name_mean,name_std)]
  
  
  ##  2. Merge the mean_and_std_data_set to make one dataset with activity names
    
     data_set_with_activ_names_mean_and_svd <- merge(activity_labels,mean_and_std_data_set,by.x="num_of_activity",by.y="num_of_activity",all=TRUE)
  
  ##  3. Melt the dataset - convert to milten data frame
    
     melt_data_set <- melt(data_set_with_activ_names_mean_and_svd,id=c("num_of_activity","type_of_activity","num_of_subject"))
  
  ##  4. Cast the melted dataset 
     mean_data_set <- dcast(melt_data_set,num_of_activity + type_of_activity + num_of_subject ~ variable,mean)
  
  ##____________________________________________________________________________________  
  ##  WRITE FINAL TABLE
    
   write.table(mean_data_set,"./pr_as1_data.txt", row.name=FALSE)
  