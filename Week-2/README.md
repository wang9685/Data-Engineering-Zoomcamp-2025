# Week-2
## Run kestra via Docker
### 1. Run containers
```bash
docker compose up
```
### 2. Connect to localhost:8080
### 3. Use the files in flows folder to create ETL pipeline
### 4. Select one taxi typ and execute 02_postgres_taxi_scheduled.yml
#### 4.1 This flow executes subflow.yml for each month

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
