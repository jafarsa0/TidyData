---
title: "README.md"
author: "Me"
date: "3/25/2020"
output: word_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Reading files

Here we read all the files that we are going to work on and assign them to variables.
we use the sep = "" which means any number of spaces can be used as a sperator between 2 values

First , we read all the train files inside the "Data/train/" Directory

```{r train}
#reading train datasets
x_train <- read.table("./Data/train/X_train.txt" ,  sep = "")
act_train <- read.table("./Data/train/y_train.txt" , sep = "")
sub_train <- read.table("./Data/train/subject_train.txt" , sep = "")
```

Second, we read all the test files inside the "/Data/test" directory 

```{r test}
#reading test datasets
x_test <- read.table("./Data/test/X_test.txt" , sep ="")
act_test <- read.table("./Data/test/y_test.txt" , sep ="")
sub_test <- read.table("./Data/test/subject_test.txt" , sep ="")
```

Third , we read all the general files in the main directory "/Data" , these are two files :
1. features file which will be the list of names for our columns
1. Activity file which attach every activity number with its label 

```{r}
features <- read.table("./Data/features.txt" , sep ="")
act_labels <- read.table("./Data/activity_labels.txt" , sep ="")

```



# # Adding column names to datasets :

we add column names to our train dataset using the features varibales that stored all the values for our columns 
we also add column names to our other dataframes, subject and activities of train :

```{r}
names(x_train) <- features[,2]
names(act_train) <- "ActivityId"
names(sub_train) <- "SubjectId"
```

we do the same thing to our test dataset :

```{r}
names(x_test) <- features[,2]
names(act_test) <- "ActivityId"
names(sub_test) <- "SubjectId"

```



# # Merging dataset :

First we merge the train dataset with its subjects IDs and its activities and perform the same thing to our test dataset :

```{r}
com_train <- cbind(sub_train , act_train , x_train)
com_test <- cbind(sub_test , act_test , x_test)
```

then we merge both datasets (train + test) together using their common coulmns :

```{r}
final_df <- rbind(com_train , com_test)
```


# # Extracting mean and std columns :

Our task now is to build  a new dataframe from the previous completed one. However, this dataframe will contain only the columns 
that calculates the mean and std , in addition to subjects and activities.

As we can see below, we used regular expressions to search through the columns and grep the values of these columns that have
the words : "mean" or "std" or "SubjectId" or "ActivityId" , and this would return a character vector that contains all the columns names with the previous words.


```{r}
mean_std <- final_df[ ,grep("mean|std|SubjectId|ActivityId", names(final_df) , value = T)]
```


# # Giving our activities names

As we saw , our dataframe has activity column that codes every activity using a number between 1 and 6 , now we want to replace these numbers with labels using the dataframe we extract from the file that records every activity number with its name.

We used "plyr" package so we can use join to match every activity number with its label, after that we just get rid of the activity id column


```{r}
library(plyr)
names(act_labels) <- c("ActivityId" , "ActivityName")
mean_std <- join(mean_std , act_labels , by="ActivityId" , match = "first")
mean_std <- mean_std[,-1]
```


# # Modifying columns names

Our column names are not that descriptive, they are hard to read or to be typed, so we changed to things in the column names :

1. Get read of the special characters
1. Change the shortcuts in each name to a more descriptive word 


```{r}
names(mean_std) <- gsub("\\()|-" , "" , names(mean_std)) 
names(mean_std) <- gsub("^t" , "Time" , names(mean_std))
names(mean_std) <- gsub("^f" , "Frequency" , names(mean_std))
names(mean_std) <- gsub("Acc" , "Acceleration" , names(mean_std))
names(mean_std) <- gsub("Gyro" , "Gyroscope" , names(mean_std))
names(mean_std) <- gsub("Mag" , "Magnitude" , names(mean_std))
names(mean_std) <- gsub("mean" , "Mean" , names(mean_std))
names(mean_std) <- gsub("std" , "Std" , names(mean_std))
names(mean_std) <- gsub("BodyBody" , "Body" , names(mean_std))

```



# # Grouping by subject and activity  + finding mean:

We now reformed our dataset using "reshape2" library, so that we can group up the rows by their subjectId and ActivityName.

We then passed the resulted dataframe to dcast function to put each group with its measurmants means

```{r}
library(reshape2)
library(reshape2)
group_sub_act <-  melt(mean_std  , id =c("SubjectId" , "ActivityName")) 
by_mean <-  dcast( group_sub_act , SubjectId + ActivityName ~ variable , mean)
```



# # Writing the data :

Final step is to write our tidy data into a new file :

```{r}
write.table(by_mean , file = "./Data/Tidy.txt")
```

