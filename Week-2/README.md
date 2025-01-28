# Week-2
## Question 3. How many rows are there for the Yellow Taxi data for all CSV files in the year 2020?
```sql
SELECT COUNT(*)
FROM yellow_tripdata
WHERE filename like '%2020%';
```
## Question 4. How many rows are there for the Green Taxi data for all CSV files in the year 2020?
```sql
SELECT COUNT(*)
FROM green_tripdata
WHERE filename like '%2020%';
```
## Question 5. How many rows are there for the Yellow Taxi data for the March 2021 CSV file?
``` sql
SELECT COUNT(*)
FROM yellow_tripdata
WHERE filename like '%2021-03%';
```
