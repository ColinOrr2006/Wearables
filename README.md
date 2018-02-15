==================================================================
Based on the study "Human Activity Recognition Using Smartphones"

==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - UniversitÃ  degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

See http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for further details on the source datasets and the measurements collectedThe

This project is based on the outputs from that study. 

The data files used in this project are as follows ;
=========================================

- 'README.txt'

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 



Notes: 
======
To run the R script run_analysis.R in your environment you need to update the working directory statement at the top of the script. 
The working directory needs to contain the files / folders listed above. i.e you need to have a train and a test folder with the corresponding 
data files.

There are two outputs from the script:
	TidyData.txt : A formatted dataset with subject, activity and a set of mean and std data from the completed dataset. Columns are all labeled
	MeanData.txt : A formatted dataset of TidyData containg a a mean of each of the numeric columns grouped by activity and subject.  


For a detailed description of the processing of the files see CodeBook.md



Please note license retrictions below based on README.txt in source project

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
