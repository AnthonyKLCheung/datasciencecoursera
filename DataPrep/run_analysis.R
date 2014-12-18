# This script assume a directory named "data" at the working directory containing the unzip contents from the original data zip file
library(plyr)
library(doBy)

# command base directory string
baseDirectory <- "./data/UCI HAR Dataset/"

# name of the 2 datasets
datasets <- c("test", "train")

# read the activity label file to give us the mapping between activity ID to activity description
activityLabel<-read.table(paste(baseDirectory, "activity_labels.txt", sep=""))

# read the feature measurement names
features<-read.table(paste(baseDirectory, "features.txt", sep=""))

# find out the column indexes for all names with mean or std()
allMeans <- grep("mean",features$V2, ignore.case = TRUE)
allStds <- grep("std\\(\\)", features$V2)
allColumns <- sort(c(allMeans, allStds))

# loop for each of the datasets
for (i in 1:length(datasets)) 
{ 
  # read the measurement file
  x <- read.table(paste(paste(paste(paste(baseDirectory, datasets[i], sep=""),"/x_", sep=""),datasets[i], sep=""),".txt", sep=""))
  
  # set the column names
  names(x) <- as.character(features$V2)
  
  # select only the columns with names containing either "mean" or "std()"
  subx <- x[,allColumns]
  
  # read the activity file
  y <- read.table(paste(paste(paste(paste(baseDirectory, datasets[i], sep=""),"/y_", sep=""),datasets[i], sep=""),".txt", sep=""))
  
  # join such that we map the activity description to each of the observations
  yJoin <- join(y,activityLabel, by="V1")  
  
  # read in the subject file
  subject <- read.table(paste(paste(paste(paste(baseDirectory, datasets[i], sep=""),"/subject_", sep=""),datasets[i], sep=""),".txt", sep=""))
  
  # combine the subject, activity description, and measurement subset into one
  temp <- cbind(cbind(subject, yJoin$V2), subx)
  if (i == 1)
  {
    # if this is the first dataset, just store the result
    allRows <- temp
  }
  else
  {
    # if this is not the first dataset, merge in the observations
    allRows<-merge(allRows, temp, all=TRUE)
  }
}

names(allRows)[1] <- "Subject"
names(allRows)[2] <- "Activity"

# calcuate the mean of each measurements grouped by subject and activity
summary<-aggregate(allRows, list(allRows$Subject, allRows$Activity), mean)

# takes away the aggregation of the subject and activity columns
summary <- summary[,-c(3,4)]

# set the names of the subject and activity columns
names(summary)[1] = "Subject"
names(summary)[2] <- "Activity"

write.table(summary, file="output.txt", row.names = FALSE)


