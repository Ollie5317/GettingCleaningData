# Getting and Cleaning Data Course Project: Peer Grade Assignment
Author: Oliver Fisher 

This repository is for the Getting and Cleaning Data course project. It has the instructions on how to run analysis on Human Activity recognition dataset provided by UCI.

## Dataset
Human Activity Recognition Using Smartphones
URL link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Files
CodeBook.md a code book that describes the variables, the data, and the transformations and work performed to clean up the data

run_dataimport.R downloads the data into a the working directory and reads the dataset into R. 

run_analysis.R performs the data preparation and then followed by the 5 steps required by the assignment guidelines:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names.
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for       each activity and each subject.
  
Tidy_Data.txt is the exported final data after going through all the sequences described above.
