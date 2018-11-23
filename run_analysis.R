###merge train and test dataset ito one dataset
dataset<-bind_rows(train,test)
dataset_class<-bind_rows(train_class,test_class)
subject<-bind_rows(subject_train,subject_test)
#dataset<mutate(dataset,Class=dataset_class$V1,Subject=subject$V1);

final_dataset<-bind_cols(dataset,dataset_class,subject)
 head(final_dataset,2)
 dim(final_dataset)
 
features<-read.table("./data/UCI HAR Dataset/features.txt",header = FALSE)
Std<-contains(features$V2,match = "std",ignore.case =TRUE )
Mean<-contains(features$V2,match = "mean",ignore.case =TRUE )
std_measures<-select(final_dataset,Std)
mean_measures<-select(final_dataset,Mean)
#std_mean_data<-bind_cols(std_measures,mean_measures)
###merge mean data and std data
std_mean_data<-bind_cols(std_measures,mean_measures)


###escriptive activity names to name the activities in the data set
labels<-read.table("./data/UCI HAR Dataset/activity_labels.txt",header = FALSE)
class_label<- data.frame(class=cut(dataset_class$V1,breaks = c(1,2,3,4,5,6,7),labels =labels$V2))
std_mean_data<-mutate(std_mean_data,Class=class_label$class,Subject=subject$V1)


#### labels the data set with descriptive variable names.
fnames<- c( as.character(features[Std,2]), as.character(features[Mean,2])  )
names(std_mean_data)<-fnames
names(std_mean_data)[87]<-"class"
names(std_mean_data)[88]<-"subject"


#### average 
   data_grouped<-std_mean_data %>%group_by(class,subject)
   average<-mutate(data_grouped,aveg=mean(data_grouped,na.rm = TRUE))
