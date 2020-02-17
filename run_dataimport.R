## Script to download and read the Samsung Galaxy data into R. 

# Download the dataset
filename <- "Coursera_DS3_Final.zip"

# Checking if zipfile already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename)
}  

# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Read column/feature names and the dataset into R
# Read the features into R
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))

# Read the six activites recorded into R
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Read the subject testing data into R
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

# Read the testing input data into R
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)

# Read the testing output data into R
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

# Read the subject training data into R
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# Read the training input data into R
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)

# Read the training output data into R
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

