train<-read.table("./data/UCI HAR Dataset/train/X_train.txt",header = FALSE)
train_class<-read.table("./data/UCI HAR Dataset/train/y_train.txt",header = FALSE)
test<-read.table("./data/UCI HAR Dataset/test/X_test.txt",header = FALSE)
test_class<-read.table("./data/UCI HAR Dataset/test/y_test.txt",header = FALSE)
subject_train<-read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test<-read.table("./data/UCI HAR Dataset/test/subject_test.txt",header = FALSE)
