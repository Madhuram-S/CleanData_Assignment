##  Analyse and create a tidy dataset for the Human Acitivity Recognition 

The aim of the analysis is to produce a dataset that follows adheres to the tidy data principles of
* Each variable is listed in a column
* Each observation is a row
* One table for same kind of data

## Source of data
The source of the data is obtained from Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. from Smartlab - Non Linear Complex Systems Laboratory via the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

More information can be found in the site http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## High level Program flow
The code has been designed in the following flow

* Step 1: Download and unzip the file into data directory under current working directory. Note: During unzip, all files are extracted into same destination directory ignoring the zip folder structure

* Step 2: The raw data is obtained from below files
      * 'features.txt': List of all 561 features.
      * 'activity_labels.txt': Links the class labels with their activity name.
      * 'X_train.txt': data values for training set.
      * 'y_train.txt': Training labels.
      * 'subject_train.txt': Each row identifies the subject who performed the activity. Its range is from 1 to 30.
      * 'X_test.txt': data values for test set.
      * 'y_test.txt': Test labels.
      * 'subject_test.txt': Each row identifies the subject who performed the activity. Its range is from 1 to 30.

  Using read.table, the data is read into 4 dataframes
      1) activity dataset
      2) features dataset
      3) training dataset - This dataset combines , subject(subject_train.txt), activity(y_train.txt) and feature measurement(X_train.txt) into a single dataframe by column
      4) test dataset - This dataset combines , subject(subject_test.txt), activity(y_test.txt) and feature measurement(X_test.txt) into a single dataframe by column
      
* Step 3: Merge of the test and train datasets to ensure the one table for same kind of data
    Using rbind(), the traning and test datasets are merged
    
* Step 4: Making the dataset readable by giving descriptive column names and activity labels instead of activity id

* Step 5: Subsetting the dataset to contain, subject, activity, measurement variable containing mean and std.

* Step 6: Reshaping data to a tidier dataset that provides average for each measurement variable by subject and by acivity

## Script content
The script "run_analysis.r" contains two functions. 

### function : run_analysis
This is the main function that needs to be called to create tidy data. It accepts two arguments
    * fileurl - location of the raw data zipfile
    * datapath - path where all data files are to extracted and final file to be written

#### Key dependencies

    * The files mentioned in Step 2 above should be present with the same naming and format for it to extract data. If not error is produced
    * plyr and dplyr packages are needed for program execution. It automatically loads the packages if already installed. If not installed, error is produced
    
#### Output

It creates a txt file names HAR_tidy_dataset.txt within the mentioned data path. This can be read into R and viewed as below

ds <- read.table("HAR_tidy_dataset.txt", header = T, stringsAsFactors = F); 
View(ds)


### function: importDataSet
This is a sub-function that helps to load the datasets into dataframes. This is called internally by run_analysis function

It takes a list of txt files, reads them and loads them into a single dataframe either by cbind or rbind.

## Running the script
To run, the script must be sourced. Once sourced, the function run_analysis and importDataSet are loaded into the environment.
Then run_analysis() can be called to produce the final dataset

source("run_analysis.r")
run_analysis("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", datapath = "<provide your datapath")
