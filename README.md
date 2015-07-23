## explanation of the code
1. First part
  Reading text fikes from main repo: activity_labels and features. Name thir colomn names properly (see CodeBook.md for explanation)
2. Second part
  Reading text files that are related to X. data from X_test and X_train files. Also name the columns
3. Third part
  Reading text files that are related to Y. data from Y_test and Y_train files. Also name the colum
4. Fotrh part
  Reading subject_test.txt and subject_train.txt files. Make the colomn name "num_of_subject"
5. Fifth part
  Combining all small data sets into one usint cbind for groups (test_subject, y_test_data, x_test_data) and (train_subject, y_train_data, x_train_data), and then combine last two with rbind()
6. Sixth part
  Make subset of big data set where data of columns which in their names have "mean" or "std" parts, using grep
  Merge two data frames "activity_labels" and the subset that was last described (with mean snd std)  by common column name "num_of_activity"
  Melt and dcast data set where num_of_activity + type_of_activity + num_of_subject are variables, and taking mean() function
7. Seventh part
  Write table output from dcast() function
