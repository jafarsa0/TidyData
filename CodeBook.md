---
title: "CodeBook.md"
author: "Me"
date: "3/25/2020"
output: pdf_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
# # Feature selection :

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals TimeAccelerationXYZ and TimeGyroscopeXYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAccelerationXYZ and TimeGravityAccelerationXYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerationJerkXYZ and TimeBodyAccelerationJerkXYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccelerationJerkMagnitude, TimeGravityAccelerationMagnitude, TimeBodyAccelerationJerkMagnitude, TimeBodyGyroscopeMagnitude, TimeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FrequencyBodyAccelerationXYZ, FrequencyBodyAccelerationJerkXYZ, FrequencyBodyGyroscopeXYZ, FrequencyBodyAccelerationJerkMagnitude, FrequencyBodyGyroscopeMagnitude, FrequencyBodyGyroscopeJerkMagnitude.

These signals were used to estimate variables of the feature vector for each pattern:  
'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

TimeAccelerationXYZ  
TimeGyroscopeXYZ
TimeBodyAccelerationXYZ
TimeGravityAccelerationXYZ
TimeBodyAccelerationJerkXYZ 
TimeBodyAccelerationJerkXYZ
TimeBodyAccelerationJerkMagnitude
TimeGravityAccelerationMagnitude 
TimeBodyAccelerationJerkMagnitude
TimeBodyGyroscopeMagnitude 
TimeBodyGyroscopeJerkMagnitude
FrequencyBodyAccelerationXYZ
FrequencyBodyAccelerationJerkXYZ
FrequencyBodyGyroscopeXYZ
FrequencyBodyAccelerationJerkMagnitude 
FrequencyBodyGyroscopeMagnitude 
FrequencyBodyGyroscopeJerkMagnitude

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
TimeBodyAccelerationMean
TimeBodyAccelerationJerkMean
TimeBodyGyroscopeMean
imeBodyGyroscopeJerkMean

The complete list of variables of each feature vector is available in the "Features Lisist" section




# # Features List

"SubjectId"                                      "TimeBodyAccelerationMeanX"                     
"TimeBodyAccelerationMeanY"                      "TimeBodyAccelerationMeanZ"                     
"TimeBodyAccelerationStdX"                       "TimeBodyAccelerationStdY"                      
"TimeBodyAccelerationStdZ"                       "TimeGravityAccelerationMeanX"                  
"TimeGravityAccelerationMeanY"                   "TimeGravityAccelerationMeanZ"                  
"TimeGravityAccelerationStdX"                    "TimeGravityAccelerationStdY"                   
"TimeGravityAccelerationStdZ"                    "TimeBodyAccelerationJerkMeanX"                 
"TimeBodyAccelerationJerkMeanY"                  "TimeBodyAccelerationJerkMeanZ"                 
"TimeBodyAccelerationJerkStdX"                   "TimeBodyAccelerationJerkStdY"                  
"TimeBodyAccelerationJerkStdZ"                   "TimeBodyGyroscopeMeanX"                        
"TimeBodyGyroscopeMeanY"                         "TimeBodyGyroscopeMeanZ"                        
"TimeBodyGyroscopeStdX"                          "TimeBodyGyroscopeStdY"                         
"TimeBodyGyroscopeStdZ"                          "TimeBodyGyroscopeJerkMeanX"                    
"TimeBodyGyroscopeJerkMeanY"                     "TimeBodyGyroscopeJerkMeanZ"                    
"TimeBodyGyroscopeJerkStdX"                      "TimeBodyGyroscopeJerkStdY"                     
"TimeBodyGyroscopeJerkStdZ"                      "TimeBodyAccelerationMagnitudeMean"             
"TimeBodyAccelerationMagnitudeStd"               "TimeGravityAccelerationMagnitudeMean"          
"TimeGravityAccelerationMagnitudeStd"            "TimeBodyAccelerationJerkMagnitudeMean"         
"TimeBodyAccelerationJerkMagnitudeStd"           "TimeBodyGyroscopeMagnitudeMean"                
"TimeBodyGyroscopeMagnitudeStd"                  "TimeBodyGyroscopeJerkMagnitudeMean"            
"TimeBodyGyroscopeJerkMagnitudeStd"              "FrequencyBodyAccelerationMeanX"                
"FrequencyBodyAccelerationMeanY"                 "FrequencyBodyAccelerationMeanZ"                
"FrequencyBodyAccelerationStdX"                  "FrequencyBodyAccelerationStdY"                 
"FrequencyBodyAccelerationStdZ"                  "FrequencyBodyAccelerationMeanFreqX"            
"FrequencyBodyAccelerationMeanFreqY"             "FrequencyBodyAccelerationMeanFreqZ"            
"FrequencyBodyAccelerationJerkMeanX"             "FrequencyBodyAccelerationJerkMeanY"            
"FrequencyBodyAccelerationJerkMeanZ"             "FrequencyBodyAccelerationJerkStdX"             
"FrequencyBodyAccelerationJerkStdY"              "FrequencyBodyAccelerationJerkStdZ"             
"FrequencyBodyAccelerationJerkMeanFreqX"         "FrequencyBodyAccelerationJerkMeanFreqY"        
"FrequencyBodyAccelerationJerkMeanFreqZ"         "FrequencyBodyGyroscopeMeanX"                   
"FrequencyBodyGyroscopeMeanY"                    "FrequencyBodyGyroscopeMeanZ"                   
"FrequencyBodyGyroscopeStdX"                     "FrequencyBodyGyroscopeStdY"                    
"FrequencyBodyGyroscopeStdZ"                     "FrequencyBodyGyroscopeMeanFreqX"               
"FrequencyBodyGyroscopeMeanFreqY"                "FrequencyBodyGyroscopeMeanFreqZ"               
"FrequencyBodyAccelerationMagnitudeMean"         "FrequencyBodyAccelerationMagnitudeStd"         
"FrequencyBodyAccelerationMagnitudeMeanFreq"     "FrequencyBodyAccelerationJerkMagnitudeMean"    
"FrequencyBodyAccelerationJerkMagnitudeStd"      "FrequencyBodyAccelerationJerkMagnitudeMeanFreq"
"FrequencyBodyGyroscopeMagnitudeMean"            "FrequencyBodyGyroscopeMagnitudeStd"            
"FrequencyBodyGyroscopeMagnitudeMeanFreq"        "FrequencyBodyGyroscopeJerkMagnitudeMean"       
"FrequencyBodyGyroscopeJerkMagnitudeStd"         "FrequencyBodyGyroscopeJerkMagnitudeMeanFreq"   
"ActivityName"                                  



# # SubjectId :
 A sequance of numbers from 1 to 30
 
 
# # ActivityName :

A list of activities that the sample performed :
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING



# # Transformations :

This section include the transformation that have been made on the original -messy- dataset:

1. Merging X_train dataset with its own activity dataset (y_train) and its own subject dataset (subject_train)
1. Merging X_test dataset with its own activity dataset (y_test) and its own subject dataset (subject_test)
1. Giving both of the datasets same columns names
1. Merging both datasets in one dataset
1. Extracting the measures that are only realted to the average and standard deviation
1. Giving the columns describtive names
1. Grouping the dataset by Subject and Activity 
1. Find the average of each of the measurments for each of the groups


