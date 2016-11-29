library(dplyr)

## STEP 1: Loading and merging of observations from train and test datasets into one dataset

# Get data if not exists
if(!file.exists("UCI HAR Dataset")){
        download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "data.zip")  
        unzip("data.zip")
        file.remove("data.zip")
}

# load activity labels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("id","name")

# load description of feature vector
features <- read.table("UCI HAR Dataset/features.txt")
names(features) <- c("id","name")

# load train activities, subjects and measures
train.activities <- read.table("UCI HAR Dataset/train/y_train.txt")
train.subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train.measures <- read.table("UCI HAR Dataset/train/X_train.txt")

# load test activities, subjects and measures
test.activities <- read.table("UCI HAR Dataset/test/y_test.txt")
test.subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test.measures <- read.table("UCI HAR Dataset/test/X_test.txt")

# bind train and test activities, set name for activity variable
activities <- bind_rows(train.activities,test.activities)
rm("train.activities","test.activities")
names(activities) <- c("activity")

# bind train and test subjects, set name for subject variable
subjects <- bind_rows(train.subjects,test.subjects)
rm("train.subjects","test.subjects")
names(subjects) <- c("subject")

# bind train and test measures
measures <- bind_rows(train.measures,test.measures)
rm("train.measures","test.measures")



## STEP 2: Extracting mean and std related measurements from original dataset 

# find positions of mean and std variables in feature vector
features.reduced.logical <- grepl(pattern = "mean|std", features$name)

# select subset of variables and add names to variables
measures.reduced <- select(measures,which(features.reduced.logical))




## STEP 3: Changing numeric codes for activities with their descriptive names.

activities$activity <- factor(activities$activity, levels = activity_labels$id, labels = activity_labels$name)




## STEP 4: Altering names of measurement variables into "tidy" format. 

# get names of mean and std related variables
features.reduced.names <- grep(pattern = "mean|std", features$name, value = TRUE)

# convert official names to something more "tidy"
features.reduced.names <- gsub("\\(\\)", "", features.reduced.names)
features.reduced.names <- gsub("^t", "time", features.reduced.names)
features.reduced.names <- gsub("^f", "freq", features.reduced.names)
features.reduced.names <- gsub("-", ".", features.reduced.names)
features.reduced.names <- tolower(features.reduced.names)

names(measures.reduced) <- features.reduced.names



## STEP 5: Generating output summary dataset which contain average value for each combination of activity and subject

# bind activity, subjects and reducet measures into one set
dataset <- bind_cols(activities, subjects, measures.reduced)

# group by activity and subject
dataset.group <- group_by(dataset, activity, subject)

# calculate average values for each activity and subject
dataset.group.summary <- summarise_each(dataset.group,funs(mean))

# write to file
write.table(dataset.group.summary,file="uci_har_dataset.txt",row.names = FALSE)

