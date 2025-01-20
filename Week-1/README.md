# Week-1
## Question 1. Understanding docker first run
``` bash
docker run -it python:3.12.8 bash
pip --version
```
```

## Question 2. Understanding Docker networking and docker-compose
db:5432

## Question 3. Trip Segmentation Count

``` SQL
SELECT *
FROM 
	green_trip_data AS t
WHERE 
	t.lpep_dropoff_datetime BETWEEN '2019-10-01 00:00:00' AND '2019-10-31 23:59:59'
	AND t.trip_distance <= 1

```
```SQL
SELECT COUNT(1)
FROM 
	green_trip_data AS t
WHERE 
	t.lpep_dropoff_datetime BETWEEN '2019-10-01 00:00:00' AND '2019-10-31 23:59:59'
	AND t.trip_distance > 1
	AND t.trip_distance <= 3
```

## Question 4. Longest trip for each day
```SQL
SELECT t.lpep_pickup_datetime, t.trip_distance
FROM green_trip_data t
ORDER BY trip_distance DESC
LIMIT 1;
```

## Question 5. Three biggest pickup zones
``` SQL
SELECT z."Zone", SUM(t."total_amount") AS total_amount
FROM 
	green_trip_data t 
JOIN taxi_zone z ON t."PULocationID" = z."LocationID"
WHERE
	t.lpep_pickup_datetime::date = '2019-10-18'
GROUP BY
	z."Zone"
ORDER BY "total_amount" DESC;
```

## Question 6. Largest tip
``` SQL
SELECT z."Zone", t.tip_amount, z1."Zone", t.lpep_pickup_datetime
FROM 
	green_trip_data t 
JOIN taxi_zone z ON t."PULocationID" = z."LocationID"
JOIN taxi_zone z1 ON t."DOLocationID" = z1."LocationID"
WHERE
	z."Zone" = 'East Harlem North'
	AND t.lpep_pickup_datetime::date BETWEEN '2019-10-01' AND '2019-10-31'
ORDER BY t.tip_amount DESC;

```