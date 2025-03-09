# Week-6 Homework
## Write the most popular destination, your answer should be either the zone ID or the zone name of this destination.
```Python
df = green_stream.withColumn('timestamp', F.current_timestamp())
df = df.withWatermark("timestamp", "10 minutes")
df = df.groupBy(
    F.window(timeColumn=F.col('timestamp'), windowDuration='5 minutes'),
    df.DOLocationID
).count()
df = df.orderBy(F.col("count").desc())
query = df \
    .writeStream \
    .outputMode("complete") \
    .format("console") \
    .option("truncate", "false") \
    .start()

# DOLocationID: 74
```
