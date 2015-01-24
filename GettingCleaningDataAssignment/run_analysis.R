

##Preparation
###################

##Load required packages
library(sqldf) ##to use SQL injections
library(tcltk) ##to use SQL injections
library(dplyr) ##to use data manipulation functionality




##1.
############

## reading in data as data assigned to 'test' and 'train' respectively
test1 <- read.table("./UCI HAR Dataset/test/X_test.txt")	##data
test2 <- read.table("./UCI HAR Dataset/test/Y_test.txt")	##activity
test_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt") ##subject


train1 <- read.table("./UCI HAR Dataset/train/X_train.txt") ##data 
train2 <- read.table("./UCI HAR Dataset/train/Y_train.txt") ##activity 
train_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt") ##subject


##load the header data and configure as headers
features <- read.table("./UCI HAR Dataset/features.txt")
headers <-as.character(features[,2])
headers <- make.names(headers, unique=TRUE)

##assign header lables to columns in data
colnames(test1)<- headers
colnames(train1)<- headers

## rename activity column header name to 'Activity'
test2 <- rename(test2 , Activity = V1)
train2 <- rename(train2 , Activity = V1)

## rename subject column header name to 'subject'
test_sub <- rename(test_sub, Subject = V1)
train_sub <- rename(train_sub, Subject = V1)

##bind the activities to the test and training data
test <- cbind(test2,test_sub,test1)
train <- cbind(train2,train_sub,train1)


## merging the two data sets 'test' and 'train' to one data set called 'data'
## via SQL UNION statemen
data<- sqldf("SELECT * FROM test UNION ALL SELECT * FROM train")

##2.
###################

##extracting relevant columns (BodyAcc, GravityAcc, BodyGyro)
data2<- select(data,Activity ,Subject ,3:8,43:48,123:128)


##3. 
#############

##create a column containin corraborating values to data in 'Activity'

##load activity values
act <- read.table("./UCI HAR Dataset/activity_labels.txt")

## assign relevant header to column 2
act <- rename(act , Activity = V1)
act <- rename(act , Activity_Desc = V2)

##Join the activity descriptions to data via SQL JOIN
data3 <- sqldf("SELECT a.*,b.Activity_Desc 
			FROM data2 AS a 
			Left JOIN act AS b
			ON a.Activity = b.Activity 
			")


##4.
######## Assigning simplified labels

data4 <- rename(data3 , BAccMeanX = tBodyAcc.mean...X,
				BAccMeanY = tBodyAcc.mean...Y,
				BAccMeanZ = tBodyAcc.mean...Z,
				BAccStdX  = tBodyAcc.std...X,
				BAccStdY  = tBodyAcc.std...Y,
				BAccStdZ  = tBodyAcc.std...Z,
				GAccMeanX = tGravityAcc.mean...X,
				GAccMeanY = tGravityAcc.mean...Y,
				GAccMeanZ = tGravityAcc.mean...Z,
				GAccStdX  = tGravityAcc.std...X,
				GAccStdY  = tGravityAcc.std...Y,
				GAccStdZ  = tGravityAcc.std...Z,
				BGyrMeanX = tBodyGyro.mean...X,
				BGyrMeanY = tBodyGyro.mean...Y,
				BGyrMeanZ = tBodyGyro.mean...Z,
				BGyrStdX  = tBodyGyro.std...X,
				BGyrStdY  = tBodyGyro.std...Y,
				BGyrStdZ  = tBodyGyro.std...Z
)


##5.
###############

##select relevant data
data5<- select(data4,Activity,Activity_Desc,2:20)

##group by activity and subject and calculate the average using SQL
tidy <- sqldf("SELECT 	Activity,
				Activity_Desc,
				Subject,
				avg(BAccMeanX)AS[BAccMeanX],
				avg(BAccMeanY)AS[BAccMeanY],
				avg(BAccMeanZ)AS[BAccMeanZ],
				avg(BAccStdX)AS[BAccStdX],
				avg(BAccStdY)AS[BAccStdY],
				avg(BAccStdZ)AS[BAccStdZ],
				avg(GAccMeanX)AS[GAccMeanX],
				avg(GAccMeanY)AS[GAccMeanY],
				avg(GAccMeanZ)AS[GAccMeanZ],
				avg(GAccStdX)AS[GAccStdX],
				avg(GAccStdY)AS[GAccStdY],
				avg(GAccStdZ)AS[GAccStdZ],
				avg(BGyrMeanX)AS[BGyrMeanX],
				avg(BGyrMeanY)AS[BGyrMeanY],
				avg(BGyrMeanZ)AS[BGyrMeanZ],
				avg(BGyrStdX)AS[BGyrStdX],
				avg(BGyrStdY)AS[BGyrStdY],
				avg(BGyrStdZ)AS[BGyrStdZ]
 
				FROM data5
				GROUP BY 	Activity,
						Activity_Desc,
						Subject
			")


#sort the data by Activity and Subject
tidy <- arrange(tidy,Activity,Subject)


##Export data fields seperated by '|'
########################################

write.table(tidy,"./tidy.txt",sep="|",row.name=FALSE)



