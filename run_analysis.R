# install 'plyr' if missed
if (!require('plyr')) {
    install.packages('plyr')
    require('plyr')
}

# default file path separator, suitable for unix-based OS
filePathSep = '/'

# download and unpack original dataset
dirName <- 'UCI HAR Dataset'
if (!file.exists(dirName)) {
    fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    fileName <- 'uci_har_dataset.zip'
    download.file(fileUrl, fileName, 'curl')
    unzip(fileName)
}

# function for merging testing and training datasets
prepareDataSet <- function(datasetName) {
    
    getFileName <- function(prefix) {
        paste(prefix, '_', datasetName, '.txt', sep = '')
    }
    
    activities <- read.table(paste(dirName, datasetName, getFileName('y'), sep = filePathSep))
    subjects <- read.table(paste(dirName, datasetName, getFileName('subject'), sep = filePathSep))
    measurements <- read.table(paste(dirName, datasetName, getFileName('X'), sep = filePathSep))
    
    cbind(activities, subjects, measurements)
}
# combine test and traing datasets to one dataset
fullDataset <- rbind(prepareDataSet('test'), prepareDataSet('train'))

# read features names
features <- read.table(paste(dirName, 'features.txt', sep = filePathSep))

# set column names
names(fullDataset) <- c('activity_id', 'Subject', features$V2) 

# exclude odd columns
filteredColumns <- grep('activity_id|Subject|(mean|std)\\(', names(fullDataset))
fullDataset <- fullDataset[, filteredColumns]

# read table with activity labels
activityLabels <- read.table(paste(dirName, 'activity_labels.txt', sep = filePathSep))
names(activityLabels) <- c('id', 'Activity')

# add column with activity labels to full dataset
fullDataset <- merge(activityLabels, fullDataset, by.x = 'id', by.y = 'activity_id', all = TRUE)

# drop columt with activity id
fullDataset$id <- NULL

# rename columns to descriptive names
renameFeatures <- function(pattern, replacement) {
    names(fullDataset) <<- gsub(pattern, replacement, names(fullDataset))
}
renameFeatures('mean', 'Mean')
renameFeatures('std', 'Std')
renameFeatures('^t', 'Time')
renameFeatures('^f', 'Freq')
renameFeatures('\\(\\)', '')
renameFeatures('-', '_')

# save full dataset
# write.table(fullDataset, file='full_dataset.txt')

# calculate average of each variable for each activity and each subject
avgDataset <- ddply(fullDataset, .(Activity, Subject), numcolwise(mean))

# add 'Avg' prefix to measurement columns
avgDatasetNames <- names(avgDataset)
for (i in 3:ncol(avgDataset)) {
    avgDatasetNames[i] <- paste('Avg', avgDatasetNames[i], sep='')
}

# save result
write.table(avgDataset, file='average_dataset.txt')
