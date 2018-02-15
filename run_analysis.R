# to understand the strcture of the source files and the general steps required to process the source data
# see the CodeBook.md and README.md for the details
# set working directory on local machine. Needs to be updated if 
setwd("C:\\colin\\Coursera\\Course 3\\UCI HAR Dataset")

library (dplyr) 

# Load subject identifiers for both test and training datasets
testSubjects <- read.table("test\\subject_test.txt")
trainSubjects <- read.table("train\\subject_train.txt")

# set column name to "subject" for the subject identifiers list (a single column table)
colnames(testSubjects) <- "subject"
colnames(trainSubjects) <- "subject"

# load activity identifiers for both test and training datasets 
testActivity <- read.table("test\\y_test.txt")
trainActivity <- read.table("train\\y_train.txt")

# set column name to "activity" for the activity identifiers list for both data sources 
colnames(testActivity) <- "activity"
colnames(trainActivity) <- "activity"

# load source data for both test and training groups
testData <- read.table("test\\X_test.txt")
trainData <- read.table("train\\X_train.txt")

# load the "text label" data for the different activity codes and set column names to "activity" and "activityLabel"
activityLabels <- read.table("activity_labels.txt")
colnames(activityLabels) <- c("activity","activityLabel")

# load the features (measures) labels which is a distinct set of all features that are recorded in the source files.
# the features are listed in the features file in the same order the actual data appears in both source datasets 
features <- read.table("features.txt")
colnames(features) <- c("featureID","feature")

# join the subject identifiers with the activity indentifiers into a single file for test and single file for training
testmeta <- cbind(testSubjects, testActivity)
trainmeta <- cbind(trainSubjects, trainActivity)

# join/merge the subject and activity identifiers data to the identifier label data 
# resulting in a file with subjects with text identifiers for the different activities
testmetaLabels <- merge(tbl_df(testmeta), tbl_df(activityLabels), by.x="activity", by.y="activity")
trainmetaLabels <- merge(tbl_df(trainmeta), tbl_df(activityLabels), by.x="activity", by.y="activity")

# join/bind the source datasets (test and training data) to the subject and activity identifiers to create
# a test and training file with complete data (data + activity and subject keys)
testDataDF <- cbind(testmetaLabels, testData)
trainDataDF <- cbind(trainmetaLabels, trainData)

# merge the test and training data into a single dataframe
AllDataDF <- rbind(testDataDF, trainDataDF)

# apply set of unique column names to the completed file
colnames(AllDataDF) <- c("activity","subject","activityLabel",make.names(names=features$feature, unique=TRUE))

#select from the completed file "subject", "activityLabel" plus all columns that contain mean or STD data
MeanStdDF <- select (AllDataDF,subject,activityLabel, names(AllDataDF)[grep("(\\.mean\\.|\\.std\\.)",names(AllDataDF))] )

# write clean data to disk as a comma delimited text file
write.table (MeanStdDF, "tidyData.txt", sep=",", row.names = FALSE, col.names = TRUE)


# 
# create a new dataframe of the mean and STD data grouped by subject and activity
grpDF <- group_by(MeanStdDF,activityLabel, subject)

#get a mean of all the source data grouped by the variables listed above
S_grp_df <- summarize_all(grpDF, .funs = mean)
# 