GettingCleaningDataProject
==========================

Coursera Data Scientist Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

An R script called run_analysis.R does the following. 

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The following documentation is extracted from the comments in run_analysis.R

NOTE: You need to install.packages("reshape2") for melt
download zip file to current directory
unzip file
read in features and activity labels
NOTE: specify col.names on read.table as check.names defaults to TRUE which will ensure that they are syntactically valid
variable names and there are no duplicates
read in training set and corresponding labels and subjects
read in test set and corresponding labels and subjects
merge training and test data for data, labels, and subject data frames
find feature names that contain "mean()" or "std()"
create a subset using these indices
lower case and remove . from column names (dots were added by read.table to make valid names)
add activity and subject columns to data frame
melt data adding subject and activity to each observation
cast data back into data frame taking the mean for each feature
create tidy data set
