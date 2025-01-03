# Code Book

## Data Source

The data represents experiments carried out with a group of 30 volunteers performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone.

## Variables in tidy_data.txt

* `subject`: ID of the test subject (1-30)
* `activity`: Type of activity performed

### Measurement Variables

All measurements are floating-point values, normalized and bounded within [-1,1].
The measurements are classified in two domains:

Time-domain signals (variables prefixed by 'Time'), captured at a constant rate of 50 Hz:
* TimeBodyAccelerometer-XYZ
* TimeGravityAccelerometer-XYZ
* TimeBodyAccelerometerJerk-XYZ
* TimeBodyGyroscope-XYZ
* TimeBodyGyroscopeJerk-XYZ
* TimeBodyAccelerometerMagnitude
* TimeGravityAccelerometerMagnitude
* TimeBodyAccelerometerJerkMagnitude
* TimeBodyGyroscopeMagnitude
* TimeBodyGyroscopeJerkMagnitude

Frequency-domain signals (variables prefixed by 'Frequency'):
* FrequencyBodyAccelerometer-XYZ
* FrequencyBodyAccelerometerJerk-XYZ
* FrequencyBodyGyroscope-XYZ
* FrequencyBodyAccelerometerMagnitude
* FrequencyBodyAccelerometerJerkMagnitude
* FrequencyBodyGyroscopeMagnitude
* FrequencyBodyGyroscopeJerkMagnitude

## Transformations

1. Training and test datasets were merged
2. Only mean and standard deviation measurements were extracted
3. Activity IDs were replaced with descriptive activity names
4. Variable names were expanded to be more descriptive
5. Data was summarized by calculating the average of each variable for each activity and subject