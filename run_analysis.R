# run_analysis.R script to 

# Load required packages 
library(dplyr)

# Step 1: Merges the training and the test sets to create one data set.
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
Selected_Data <- select(Merged_Data, subject, code, contains("mean"), contains("std"))

# Step 3: Uses descriptive activity names to name the activities in the data set
Selected_Data$code <- activities[Selected_Data$code, 2]

# Step 4: Appropriately labels the data set with descriptive variable names.
# Go through and expand the spelling of each variable so they are clearly identifiable in a consitent format
names(Selected_Data)<- gsub(code,"Activity", names(Selected_Data))
names(Selected_Data)<-gsub("Acc", "Accelerometer", names(Selected_Data))
names(Selected_Data)<-gsub("Gyro", "Gyroscope", names(Selected_Data))
names(Selected_Data)<-gsub("BodyBody", "Body", names(Selected_Data))
names(Selected_Data)<-gsub("Mag", "Magnitude", names(Selected_Data))
names(Selected_Data)<-gsub("^t", "Time", names(Selected_Data))
names(Selected_Data)<-gsub("^f", "Frequency", names(Selected_Data))
names(Selected_Data)<-gsub("tBody", "TimeBody", names(Selected_Data))
names(Selected_Data)<-gsub("-mean()", "Mean", names(Selected_Data), ignore.case = TRUE)
names(Selected_Data)<-gsub("-std()", "STD", names(Selected_Data), ignore.case = TRUE)
names(Selected_Data)<-gsub("-freq()", "Frequency", names(Selected_Data), ignore.case = TRUE)
names(Selected_Data)<-gsub("angle", "Angle", names(Selected_Data))
names(Selected_Data)<-gsub("gravity", "Gravity", names(Selected_Data))

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject.

Tidy_Data <- group_by(Selected_Data, subject, activity) 
Tidy_Data <- summarise_all(Tidy_Data, mean)

# Write the data into a text document 
write.table(Tidy_Data, "Tidy_Data.txt", row.name=FALSE)




