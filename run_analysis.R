#reading the important files

#reading train datasets
x_train <- read.table("./Data/train/X_train.txt" ,  sep = "")
act_train <- read.table("./Data/train/y_train.txt" , sep = "")
sub_train <- read.table("./Data/train/subject_train.txt" , sep = "")

#reading test datasets
x_test <- read.table("./Data/test/X_test.txt" , sep ="")
act_test <- read.table("./Data/test/y_test.txt" , sep ="")
sub_test <- read.table("./Data/test/subject_test.txt" , sep ="")


#reading features and activities lables
features <- read.table("./Data/features.txt" , sep ="")
act_labels <- read.table("./Data/activity_labels.txt" , sep ="")

#adding column names to x_train , act_train , sub_train
names(x_train) <- features[,2]
names(act_train) <- "ActivityId"
names(sub_train) <- "SubjectId"

#creating a full train dataset that contains all the attributes
com_train <- cbind(sub_train , act_train , x_train)




#adding column names to x_test , act_test , sub_test
names(x_test) <- features[,2]
names(act_test) <- "ActivityId"
names(sub_test) <- "SubjectId"



#creating a full test dataset that contains all the attributes
com_test <- cbind(sub_test , act_test , x_test)

#combining both test and train datasets
final_df <- rbind(com_train , com_test)



#Extracts only the measurements on the mean and standard deviation for each measurement
mean_std <- final_df[ ,grep("mean|std|SubjectId|ActivityId", names(final_df) , value = T)]


#Uses descriptive activity names to name the activities in the data set
library(plyr)
names(act_labels) <- c("ActivityId" , "ActivityName")
mean_std <- join(mean_std , act_labels , by="ActivityId" , match = "first")
mean_std <- mean_std[,-1]



#Appropriately labels the data set with descriptive variable names.
names(mean_std) <- gsub("\\()|-" , "" , names(mean_std)) 
names(mean_std) <- gsub("^t" , "Time" , names(mean_std))
names(mean_std) <- gsub("^f" , "Frequency" , names(mean_std))
names(mean_std) <- gsub("Acc" , "Acceleration" , names(mean_std))
names(mean_std) <- gsub("Gyro" , "Gyroscope" , names(mean_std))
names(mean_std) <- gsub("Mag" , "Magnitude" , names(mean_std))
names(mean_std) <- gsub("mean" , "Mean" , names(mean_std))
names(mean_std) <- gsub("std" , "Std" , names(mean_std))
names(mean_std) <- gsub("BodyBody" , "Body" , names(mean_std))



#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
group_sub_act <-  melt(mean_std  , id =c("SubjectId" , "ActivityName")) 
by_mean <-  dcast( group_sub_act , SubjectId + ActivityName ~ variable , mean)



#writing the a data on a new file (txt)
write.table(by_mean , file = "./Data/Tidy.txt")

