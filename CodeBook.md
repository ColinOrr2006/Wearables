This project is based on actigraphy dataset as defined by http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



The data files used in this project are as follows;

Source data files	
	Training data - all the data in these files relate to the TRAINING group
		X_train.txt		
			raw data file with all the measure / features recorded. Each row contains a set of measures for a specific subject performing a specific activity
		y_train.txt		
			has the same number of rows as the X_train file. Each row contains 1 identifier, 
			to identify the activity the subject was doing when the data in X_train was recorded
		subjects_train.txt
			has the same number of rows as the X_train file. Each row contains 1 identifier,
			to identify the subject that the data in X_train relates to.
			
		
	Test data - all the data in these files relate to the TEST group
		X_test.txt		
			raw data file with all the measure / features recorded. Each row contains a set of measures for a specific subject performing a specific activity
		y_test.txt		
			has the same number of rows as the X_test file. Each row contains 1 identifier, 
			to identify the activity the subject was doing when the data in X_test was recorded
		subjects_test.txt
			has the same number of rows as the X_test file. Each row contains 1 identifier,
			to identify the subject that the data in X_test relates to.

			
	Metadata
		activity_labels.txt
			a list of descriptive labels for each activity. Each label corresponds to a specific code in the y_test/y_train file. 
			The file contains a 1:1 relationship between the code and a text description
		features.txt
			a list of descriptive labels for each feature / measaure. This file contains a descriptive label for each column in the X_train/X_test files. 
			
			
			
To create a tidy data file the following actions / transformations took place.

				1. all the source data is loaded into a set of dataframes.
				2. data frame for Test_subjects / Train_subjects file has a suitable column name added
				3. data frame for y_test/y_train (activity codes) data file has a suitable column name added
				4. load metadata data into set of dataframe (activity_labels and features/measures)
				5. add suitable column name to the activity_labels metadata for further processing
				6. add suitable column names to the features metadata for further processing
				7. create a single dataframe containing subject and activity keys for each record in the source data.
				   This is possible since each record in the key files corresponds to an entry in the raw source data files in the same position (rowid).
				8. the key dataframe (metaLabels) is merged with the acitivty_labels data to extract the text description for each activity code
				9. the merged dataframe is then joined to the raw data dataframes using a column bind function. The result of this join is	
				   all the raw data plus keys and key labels in a test and train dataframe, both of the same format. 
				10.Since they are both the same format we can join the two datasets together into a single dataframe of test and training data.
				11.The merged dataframe has a suitable set of column names applied.
				12.A subset of columns (those with a .mean. or .std. string in their name) plus the key fields loaded into a seperate dataframe. 
				   The logic used to identify the appropriate columns is based on the fact that all instances of mean() and std() have been converted to 
				   .mean. or .std. using the make.names function. Columns such as MeanFreq will not be included as they will not appear as .mean. in the new 
				   column names
				12. The tidy dataframe is output to a text file tidyData.txt
				13. The data is then grouped by subject and activity to get a mean for each group for each variable.
				14. The mean analysis is output to a seperate file MeanData.txt
				
	


