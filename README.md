# Human Activity Recognition Data Analysis

This repository contains the analysis of the Human Activity Recognition Using Smartphones Dataset.

## Files in the Repository

* `run_analysis.R` - R script to process and clean the data
* `CodeBook.md` - Description of variables, data, and transformations
* `tidy_data.txt` - Final processed dataset

## How the Script Works

The `run_analysis.R` script performs the following operations:

1. Downloads and unzips the dataset if not present
2. Loads activity labels and features
3. Reads and merges training and test datasets
4. Extracts mean and standard deviation measurements
5. Applies descriptive activity names
6. Labels variables with descriptive names
7. Creates a tidy dataset with averages
8. Writes the result to `tidy_data.txt`

## Running the Analysis

1. Clone this repository
2. Open R or RStudio
3. Set working directory to the repository location
4. Run `source("run_analysis.R")`

Required R packages: `dplyr`, `tidyr`