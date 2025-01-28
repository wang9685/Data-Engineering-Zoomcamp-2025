# Week-2
## 1. Within the execution for Yellow Taxi data for the year 2020 and month 12: what is the uncompressed file size (i.e. the output file yellow_tripdata_2020-12.csv of the extract task)?

## 2. What is the rendered value of the variable file when the inputs taxi is set to green, year is set to 2020, and month is set to 04 during execution?

## 3. How many rows are there for the Yellow Taxi data for all CSV files in the year 2020?

## 4. How many rows are there for the Green Taxi data for all CSV files in the year 2020?

## 5. How many rows are there for the Yellow Taxi data for the March 2021 CSV file?
``` sql
SELECT COUNT(*)
FROM yellow_tripdata
WHERE filename like '%2021-03%';
```

## 6. How would you configure the timezone to New York in a Schedule trigger?

