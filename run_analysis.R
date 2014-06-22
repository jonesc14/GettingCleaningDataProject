#NOTE: You need to install.packages("reshape2") for melt
library(reshape2)
#download zip file to current directory
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# My computer doesn't like method="curl"
#download.file(fileUrl,destfile="./dataset.zip",method="curl")
download.file(fileUrl,destfile="./dataset.zip")
#unzip file
unzip("./dataset.zip")
#read in features and activity labels
features<-read.table("UCI HAR Dataset/features.txt")
activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")

#NOTE: specify col.names on read.table as check.names defaults to TRUE which will ensure that they are syntactically valid
#variable names and there are no duplicates

#read in training set and corresponding labels and subjects
training_set<-read.table("UCI HAR Dataset/train/X_train.txt", comment.char="",colClasses="numeric", col.names=features$V2)
training_labels<-read.table("UCI HAR Dataset/train/y_train.txt")
training_subjects<-read.table("UCI HAR Dataset/train/subject_train.txt")

#read in test set and corresponding labels and subjects
test_set<-read.table("UCI HAR Dataset/test/X_test.txt", comment.char="",colClasses="numeric", col.names=features$V2)
test_labels<-read.table("UCI HAR Dataset/test/y_test.txt")
test_subjects<-read.table("UCI HAR Dataset/test/subject_test.txt")

#merge training and test data for data, labels, and subject data frames
set<-rbind(training_set,test_set)
labels<-rbind(training_labels, test_labels)
subjects<-rbind(training_subjects, test_subjects)

#find feature names that contain "mean()" or "std()"
indices<-sort(c(grep("mean\\(\\)", features$V2),grep("std\\(\\)", features$V2)))

#create a subset using these indices
subset<-set[indices]

#lower case and remove . from column names (dots were added by read.table to make valid names)
names(subset)<-gsub("[.]","",names(subset),)
names(subset)<-tolower(names(subset))

#add activity and subject columns to data frame
subset$activity<-unlist(lapply(labels, function(x) activity_labels$V2[x]))
subset$subject<-subjects$V1

#melt data adding subject and activity to each observation
subsetMelt<-melt(subset,id.vars=c("subject","activity"))
#cast data back into data frame taking the mean for each feature
x<-dcast(subsetMelt, subject+activity ~ variable, fun=mean)
#create tidy data set
write.table(x, file="./tidy.txt")
