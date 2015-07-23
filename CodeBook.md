
## READING TEXT FILES AS TABLES FROM MAIN REPO

  1. "activity_labels" - Readed file "activity lables" and name colomns as "num_of_activity" (number of...),                        "type_of_activity", save to "activity_labels" variable with columns' names ("num_of_activity","type_of_activity")
  2. "features" - Readed file "features". As it has inside "number of feature" and "type of feature" columns,
  ## "type_of_feature" variable will be the second column

## READING TEXT FILES THAT ARE RELATED TO "X" AS TABLES AND NAMING COLUMNS
  
1. x_test_data - Readed X test data and name columns using variable "type_of_feature"

2. x_train_data - Readed X training data and name columns using variable "type_of_feature"

## READING TEXT FILES THAT ARE RELATED TO "Y" AS TABLES AND NAMING COLUMNS
  
1. y_test_data - Readed "activity numbers" of the Y test data and name columns "num_of_activity"

2. y_train_data - Readed the numbers of activity of the Y training data and name columns "num_of_activity"

##  READING TEST AND TRAINING SUBJECTS
  
1. test_subject - Readed numbers of the test subjects and name columns "num_of_subject"

2. train_subject - Readed numbers of the TRAIN subjects and name columns "num_of_subject"
  
## MAKE ONE TABLE USINE CBIND() AND RBIND()
 1. test_data_set - maded test data set using cbind() for variables  (test_subject, y_test_data, x_test_data)
  
 2. train_data_set - maded traning data set using cbind() for variables (train_subject, y_train_data, x_train_data)
  
 3. data_set - Maded final data set using rbind() for variables (train_data_set, test_data_set)

##  PREPROCESSING OF THE DATA SET ACCORDING TO THE ASSIGNMENT 
1. Make data set with just mean or std values
 
 1.1.1  num_mean - id of "mean" included world in name of column of data_set variavle, using  grep(),
 Here (ignore.case=TRUE) - for showing that the mean is the part of the name of variable
 1.1.2 name_mean -  names of ids of "data_set" variable,  where "mean" was the part of the column name 

 1.2.1 num_std id of "std" included world in name of column of data_set variavle, using  grep(),
 Here (ignore.case=TRUE) - for showing that the mean is the part of the name of variable
 1.2.2 name_std <-  names of ids of "data_set" variable,  where "std" was the part of the column name 

 1.3   mean_and_std_data_set - the subset of "data_set" variable whis all rows and ("num_of_subject","num_of_activity",name_mean,name_std) columns
 
2. data_set_with_activ_names_mean_and_svd - Merged the mean_and_std_data_set to make one dataset with activity names
3. melt_data_set - converted to milten format "data_set_with_activ_names_mean_and_svd" data frame
4. mean_data_set - Casted the "melt_data_set", where (num_of_activity + type_of_activity + num_of_subject) are variables, and funcion is mean()
