if (!require('plyr')) {
    install.packages('plyr')
    require('plyr')
}


filePathSep = '/'
dirName <- 'UCI HAR Dataset'
if (!file.exists(dirName)) {
    fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    fileName <- 'uci_har_dataset.zip'
    download.file(fileUrl, fileName, 'curl')
    unzip(fileName)
}

prepareDataSet <- function(datasetName) {
    
    getFileName <- function(prefix) {
        paste(prefix, '_', datasetName, '.txt', sep = '')
    }
    
    activities <- read.table(paste(dirName, datasetName, getFileName('y'), sep = filePathSep))
    subjects <- read.table(paste(dirName, datasetName, getFileName('subject'), sep = filePathSep))
    measurements <- read.table(paste(dirName, datasetName, getFileName('X'), sep = filePathSep))
    
    cbind(activities, subjects, measurements)
}

fullDataset <- rbind(prepareDataSet('test'), prepareDataSet('train'))
features <- read.table(paste(dirName, 'features.txt', sep = filePathSep))

names(fullDataset) <- c('activity_id', 'Subject', features$V2) 

filteredColumns <- grep('activity_id|Subject|(mean|std)\\(', names(fullDataset))
fullDataset <- fullDataset[, filteredColumns]

activityLabels <- read.table(paste(dirName, 'activity_labels.txt', sep = filePathSep))
names(activityLabels) <- c('id', 'Activity')

fullDataset <- merge(activityLabels, fullDataset, by.x = 'id', by.y = 'activity_id', all = TRUE)
fullDataset$id <- NULL

renameFeatures <- function(pattern, replacement) {
    names(fullDataset) <<- gsub(pattern, replacement, names(fullDataset))
}
renameFeatures('mean', 'Mean')
renameFeatures('std', 'Std')
renameFeatures('^t', 'Time')
renameFeatures('^f', 'Freq')
renameFeatures('\\(\\)', '')
renameFeatures('-', '_')

write.table(fullDataset, file='full_dataset.txt')

avgDataset <- ddply(fullDataset, .(activity, subject), numcolwise(mean))

names(avgDataset)[c(-1, -2)] <- sapply(names(avgDataset)[c(-1, -2)], function(x) paste("Average", x, sep=""))

write.table(avgDataset, file='average_dataset.txt')

