# Week-3
## Create external table
```sql
CREATE OR REPLACE EXTERNAL TABLE `zoomcamp_week3.yellow_taxi_external_2024`
OPTIONS (
  format= 'parquet',
  uris= ['gs://dezoomcamp_week3/yellow_tripdata_2024-0*.parquet']
);
```

## Create regular table
```sql
CREATE OR REPLACE TABLE `zoomcamp_week3.yellow_taxi_regular_2024`
AS SELECT *
FROM `zoomcamp_week3.yellow_taxi_external_2024`;
```

## Create materialized table
```sql
CREATE MATERIALIZED VIEW `zoomcamp_week3.yellow_taxi_materialized_2024`
AS SELECT *
FROM `zoomcamp_week3.yellow_taxi_regular_2024`;
```


## Question 1
```sql
SELECT COUNT(*)
FROM `zoomcamp_week3.yellow_taxi_external_2024`;
```

```sql
SELECT COUNT(DISTINCT PULocationID) AS distinct_pulocation_count
FROM `zoomcamp_week3.yellow_taxi_materialized_2024`;
```

```sql
SELECT COUNT(DISTINCT PULocationID) AS distinct_pulocation_count
FROM `zoomcamp_week3.yellow_taxi_external_2024`;
```

## Question 2
```sql
SELECT PULocationID
FROM `zoomcamp_week3.yellow_taxi_materialized_2024`;
```

```sql
SELECT PULocationID, DOLocationID
FROM `zoomcamp_week3.yellow_taxi_materialized_2024`;
```

## Question 4
```sql
----8,333
SELECT COUNT(fare_amount)
FROM `zoomcamp_week3.yellow_taxi_materialized_2024`
WHERE fare_amount = 0;
```

## Question 5
```sql
CREATE TABLE `zoomcamp_week3.yellow_taxi_partition_cluster_2024`
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID
AS
SELECT * FROM `zoomcamp_week3.yellow_taxi_materialized_2024`;
```

## Question 6
```sql
--- 310.24 MB
SELECT COUNT(DISTINCT(VendorID))
FROM `zoomcamp_week3.yellow_taxi_materialized_2024`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';
```

```sql
--- 26.84 MB
SELECT COUNT(DISTINCT(VendorID))
FROM `zoomcamp_week3.yellow_taxi_partition_cluster_2024`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';
```
