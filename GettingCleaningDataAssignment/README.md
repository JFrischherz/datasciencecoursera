Getting and Cleaning Data Course Project - README
=======================================================

This document outlines the working of "run_analysis.R" which is the script used to produce the 'tidy' dataset. As well as the Code Book explaining variables.


Prerequisite:
----------------
The project data is extracted in the user's working directory.


R Package Requirements:
------------------------
To run the script the following packages need to be loaded:
### to run SQL queries on the data in R:
- sqldf
- tcltk

### to use advanced data manipulation functionality:
- dplyr


Step 1: 
--------
### reading the test and training data into R.
The data is loaded into the variables 'test1' and 'train1' respectively.
Also the activities are loaded into 'test2' and 'train2'.
Finally the subjects are loaded into 'test_sub' and 'train_sub'.

### configuring headers
Having all the required data loaded into R we proceed with loading the headers.
The headers are then configured as characters and set as names.
These headers are then assigned to 'test1' and 'train1'.

In the activity data 'test1' and 'train1'obtain assigned header in V1 called 'Activity'.
In the same manner we assign the header 'Subject' to V1 in 'test_sub' and 'train_sub'.

### combining and merging data
First, we bind Activities ('test2'), Subjects ('test_sub') and test data ('test1') using the column bind functionality in R.
Second, we repeat the same for the training data, i.e. binding Activities ('train2'), Subjects ('train_sub') and training data ('train1') using the column bind functionality in R.

Finally, we merge the test and training data using a SQL UNION statement in R. This results in the combined data (called 'data').


Step 2:
----------

We extract a subset from the dataset produced in step 1. We select the Activity, Subject as well as the three(3) means and standard deviations for Body and Gravity Accelleration representing the accelerometer axial raw signal computations. In addition to this the gyroscope 3-axial raw sygnals were selected.
N.B.tBodyAcc as well as tGravity Acc are derived from Body acceleration while tBodyGyro represents Gravity Acceleration.
The three (3) axial raw signals are represented as X, Y and Z.

The resulting sub set is called 'data2'.

Step 3:
------------
We load an additional data set containing activity labels ('act').
Pursuant to loading the data header names are assigned. V1 becomes 'Activity' and V2 is assigned ' Actitivity_Desc'.
Then the activity descriptions (column Activity_Desc) is joined to the data set created in Step 2 (data2).
The join is performed via SQL injection based on the field 'Activity'.
The resulting enriched data set is called 'data3'.


Step 4:
-----------

The lable names for the selected means and standard deviations are simplyfied. Refer to the codebook below for further documentation of the fields in the resulting dataset of the script ('tidy').


Step 5:
----------

A final column selection is made for the finalisation of the data set. We select ACtivity, Activity_Desc, Subject and the means and standard deviations. This selection statement also puts the columns in thier final order. 
The resulting dataset is called 'data5'.

Then we pursue to produce our final grouped data set ('tidy'). We acomplish this by using an SQL statement that calculates the average [avg()] by Activity and Subject. N.B. the inclusion of Activity and 'Activity_Desc' does not affect the end result from a grouping point of view as 'Activity_Desc' solely reflects a descriptive representation of 'Activity'.

Finally we sort the 'tidy' dataset by Activity and Subject.

The script concludes with an export statement, writing 'tidy' to text, seperating columns by '|' and not assigning row names.


Codebook
===========

The 'tidy' data set is a summary of selected averages from means and standard deviations of Body and Gyro Acceleration data based of three vecotrs (X, Y, Z). The summary is performed based on Activities and each of the 30 test subjects.
Refer to Step 2 above for rationale of variable selection for average of means and standard deviations.

Variables
----------

### V1 - Activity (Integer) [Unit - N/A]
ID for the activity performed, holds values 1 - 6. 

### V2 - Activity_Desc (string) [Unit - N/A]
Description of Activity. Possible Activities are:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

### V3 - Subject (Integer) [Unit - N/A]
ID of the test subject, holds values 1 - 30.

### V4 - BAccMeanX (Float) [Unit - Hz]
Average of Body Acceleration Mean for Vector X.

### V5 - BAccMeanY (Float) [Unit - Hz]
Average of Body Acceleration Mean for Vector Y.

### V6 - BAccMeanZ (Float) [Unit - Hz]
Average of Body Acceleration Mean for Vector Z.

### V7 - BAccStdX (Float) [Unit - Hz]
Average of Body Acceleration Standard Deviation for Vector X.

### V8 - BAccStdY (Float) [Unit - Hz]
Average of Body Acceleration Standard Deviation for Vector Y.

### V9 - BAccStdZ (Float) [Unit - Hz]
Average of Body Acceleration Standard Deviation for Vector Z.

### V10 - GAccMeanX (Float) [Unit - Hz]
Average of Gravity Acceleration Mean for Vector X.

### V11 - GAccMeanY (Float) [Unit - Hz]
Average of Gravity Acceleration Mean for Vector Y.

### V12 - GAccMeanZ (Float) [Unit - Hz]
Average of Gravity Acceleration Mean for Vector Z.

### V13 - GAccStdX (Float) [Unit - Hz]
Average of Gravity Acceleration Standard Deviation for Vector X.

### V14 - GAccStdY (Float) [Unit - Hz]
Average of Gravity Acceleration Standard Deviation for Vector Y.

### V15 - GAccStdZ (Float) [Unit - Hz]
Average of Gravity Acceleration Standard Deviation for Vector Z.

### V16 - BGyrMeanX (Float) [Unit - Hz]
Average of Gyro  Mean for Vector X.

### V17 - BGyrMeanY (Float) [Unit - Hz]
Average of Gyro  Mean for Vector Y.

### V18 - BGyrMeanZ (Float) [Unit - Hz]
Average of Gyro  Mean for Vector Z.

### V19 - BGyrStdX (Float) [Unit - Hz]
Average of Gyro  Standard Deviation for Vector X.

### V20 - BGyrStdY (Float) [Unit - Hz]
Average of Gyro  Standard Deviation for Vector Y.

### V21 - BGyrStdZ (Float) [Unit - Hz]
Average of Gyro  Standard Deviation for Vector Z.



