##----------------RUN ANALYSIS SCRIPT OVERVIEW------------------------------------------------------------------
## The below program downloads, extract and cleans the Human Activity Recognition (HAR) data
## The clean or tidy HAR data is then written into a csv file 
## Also a summary HAR data is created for sugbject and activity groups

## The program has four distinct steps
## A) download and extract the raw data into data frames / tables
## B) Manipulate data set - merge test & train datasets and extract only mean and std cols
## C) Rename cols/ variables to be descriptive and replace activity ID with activity Label
## D) create another data based on step C) to compute average of the mean and std cols by suject and activity

## Base HAR files and their information that program uses
## activity_labels.txt - labels for activities
## features.txt - list of col. names
## subject_***.txt - List of subjects for test and train
## X_***.txt - values for 561 measured variables 
## y_***.txt - activities X values are measured against
##
## ASSUMPTION : File formats are already known and this script is based on the provided formats / structure
##--------------------------------------------------------------------------------------------------------------

run_analysis <- function(fileurl = "", datapath = getwd())
{
  ## Load plyr library for data set manipulation
  suppressPackageStartupMessages(library(plyr))
  suppressPackageStartupMessages(library(dplyr))
  
  print("*** plyr and dplyr packages loaded....***")
  
  ## DOWNLOAD FILE AND UNZIP INTO PROVIDED DATA PATH
  if(!file.exists(datapath)) dir.create(datapath)
  download.file(fileurl, destfile = paste(datapath,"/datafile.zip", sep=""))
  ## unzip files to the given data path.
  ## NOTE: zip folder structure is ignored and all files extracted to same directory
  unzip(paste(datapath,"/datafile.zip", sep=""), overwrite = T, junkpaths = T, exdir = datapath)
  
  print("*** File downloaded and unzipped....***")
  
  
  ## list the files that need to be imported to dataframes
  files <- list(test = c("/subject_test.txt","/y_test.txt","/X_test.txt"), 
                train = c("/subject_train.txt","/y_train.txt","/X_train.txt"),
                act_lbl = "/activity_labels.txt", features = "/features.txt")
  
  ## PART 1 : IMPORT RAW DATA FROM TXT FILES TO DATAFRAMES
  ## import raw data into data frame separately for test, train, activity list and features info
  ## while extracting the data combine subject, Y and X data into a single data set for test and train
  ## use cbind to bind the three datasets into a single dataset
  testDS <- importDataSet(datapath, files$test, "cbind")
  trainDS <- importDataSet(datapath,files$train,"cbind")
  
  ## import features and activity label that will be used later
  featureDS <- importDataSet(datapath,files$features)
  act_lbl <- importDataSet(datapath, files$act_lbl)
  
  print("*** Raw data imported to dataframes....***")
  
  ## PART 2 : MERGE THE TEST AND TRAIN DATAFRAMES INTO A SINGLE DATA FRAME
  # Merge Test and train dataset into a single dataset
  HAR_raw_data <- rbind(trainDS, testDS)
  
  print("*** One merged dataset created from test and train datasets ....***")
  
  ## PART 3 : CHANGE COLUMN NAMES TO DESCRIPTIVE AND MEANINGFUL NAMES
  
  ## construct col names from features.txt file and imported infor featureDS. 
  ## Features.txt has 2 columns ID and Names fo the colums which will be imported with columnames V1 and V2, use column V2
  ## Subject and Activity ID are placed in the front of the order
    names(HAR_raw_data) <- c("subject","activity",featureDS$V2)
    
    print("*** Variable names changed to desctiptive values....***")
    
  ## PART 4 : EXTRACT ONLY MEAN AND STD COLS FROM THE RAW DATASET (INLCUDE SUBJECT AND ACTVITY)
  ## use grep to filter out subject, activity, mean and std cols only
    HAR_clean_data <- HAR_raw_data[,grep("subject|activity|mean|std", names(HAR_raw_data))]
    
    print("*** Only mean and std columns extracted to a clean dataset....***")
  
    ## convert dataset to a dplyr dataset allowing us to able to use dplyr function
    HAR_clean_data <- tbl_df(HAR_clean_data)
  
  ## PART 5 : UPDATE ACTIVITY COLUMN TO NAMES INSTEAD OF ID
    HAR_clean_data$activity <- unlist(lapply(HAR_clean_data$activity, function(x) act_lbl[x,2]))
  
    print("*** Activity ID replaced with Activity label....***")  
  
  ## PART 6: CREATE A SUMMARY DATASET 
  ## THAT CALCULATES AVG. OF ALL THE MEAN AND STD COLS BY SUBJECT AND BY ACTIVITY
  ## the below line of code uses dplyr package to group by subject and activity
  ## and calculate the means of all the columns by the grouped cols
  
    HAR_finalDS <- HAR_clean_data %>% group_by(subject,activity) %>% summarise_each(funs(mean))
    
    print("*** Summary dataset created and is grouped by subject and activity....***")
  
  ## save the HAR_clean_data and HAR_sum_data datasets in *.csv files
    ##write.table(HAR_clean_data, paste(datapath,"/HAR_clean_data.txt",sep=""), row.names = F)
    write.table(HAR_finalDS, paste(datapath,"/HAR_tidy_dataset.txt", sep=""), row.names = F)
    
    print("*** Clean dataset and summary dataset written to HAR_tidy_dataset.txt....***")
    
    ## return the final dataset  
    
    ##HAR_finalDS
    
}

##----------------FUNCTION : IMPORTDATASET -------------------------------------------------
## function to import multiple .txt files data into a single dataset 
## args - path and filelist specify the path and names of text files
## action - is either cbind or rbind

importDataSet <- function(path, filelist, action = "rbind")
{
  filelist <- paste(path,filelist, sep = "")
  do.call(action, lapply(filelist, read.table, header = F, stringsAsFactors = F))
  
}