---
title: "Code Book"
author: "Oliver Fisher"
output: html_document
---

### Overview
This document details the variables, the data, and any transformations or work that has been performed to clean up the data.

### Raw dataset
Raw dataset can be found at: 
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
  
To download and import the data use ```run_dataimport.R```

### Transformations preformed by the ```run_dataimport.R``` script to create variables 
**Step 1**: Dataset is downloaded and extracted under the folder called **UCI HAR Dataset**

**Step 2**: Assign data to variables withing the global environment 

- **features** <- features.txt : 561 rows, 2 columns
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
- **activities** <- activity_labels.txt : 6 rows, 2 columns
*List of activities performed when the corresponding measurements were taken and its codes (labels)*
- **subject_test** <- test/subject_test.txt : 2947 rows, 1 column
*contains test data of 9/30 volunteer test subjects being observed*
- **x_test** <- test/X_test.txt : 2947 rows, 561 columns
*contains recorded features test data*
- **y_test** <- test/y_test.txt : 2947 rows, 1 columns
*contains test data of activities’code labels*
- **subject_train** <- test/subject_train.txt : 7352 rows, 1 column
*contains train data of 21/30 volunteer subjects being observed*
- **x_train** <- test/X_train.txt : 7352 rows, 561 columns
*contains recorded features train data*
- **y_train** <- test/y_train.txt : 7352 rows, 1 columns
*contains train data of activities’code labels*

### Transformations preformed by the ```run_analysis.R``` script
The script follows the 5 step outline provide the peer grade assignment guidelines

**Step 1**: Merges the training and the test sets to create one data set

- **X** (10299 rows, 561 columns) is created by merging **x_train** and **x_test** using **rbind()** function
- **Y** (10299 rows, 1 column) is created by merging **y_train** and **y_test** using **rbind()** function
- **Subject** (10299 rows, 1 column) is created by merging **subject_train** and **subject_test** using **rbind()**  function
- **Merged_Data** (10299 rows, 563 column) is created by merging **Subject**, Y and X using **cbind()** function

**Step 2**: Extracts only the measurements on the mean and standard deviation for each measurement.

- **Selected_Data** (10299 rows, 88 columns) is created by subsetting **Merged_Data**, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

**Step 3**: Uses descriptive activity names to name the activities in the data set

- Entire numbers in code column of the **Selected_Data** replaced with corresponding activity taken from second column of the activities variable

**Step 4**: Appropriately labels the data set with descriptive variable names.

- The *code* column in Selected_Data renamed into **activities**
- All *Acc* in column’s name replaced by *Accelerometer*
- All *Gyro* in column’s name replaced by *Gyroscope*
- All *BodyBody* in column’s name replaced by *Body*
- All *Mag* in column’s name replaced by *Magnitude*
- All start with character *f* in column’s name replaced by *Frequency*
- All start with character *t* in column’s name replaced by *Time*

**Step 5**: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- **Tidy_Data** (180 rows, 88 columns) is created by sumarizing **Selected_Data** taking the means of each variable for each activity and each subject, after groupped by *subject* and *activity*.
- Export T**idy_Data** into **Tidy_Data.txt** file.

