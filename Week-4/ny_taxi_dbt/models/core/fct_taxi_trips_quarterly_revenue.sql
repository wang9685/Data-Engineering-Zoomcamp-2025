{{
    config(
        materialized='table'
    )
}}

WITH quarterly_revenue AS (
    SELECT
        taxi_type,  -- 'green' or 'yellow'
        EXTRACT(YEAR FROM pickup_datetime) AS year,
        EXTRACT(QUARTER FROM pickup_datetime) AS quarter,
        SUM(total_amount) AS total_revenue
    FROM
        `your_project.your_dataset.fact_taxi_trips`
    GROUP BY
        taxi_type, year, quarter
),


SELECT
    a.taxi_type,
    a.year,
    a.quarter,
    a.total_revenue,
    b.total_revenue AS previous_year_revenue,
    SAFE_DIVIDE((a.total_revenue - b.total_revenue), b.total_revenue) * 100 AS yoy_growth_percentage
FROM
    quarterly_revenue a
LEFT JOIN
    quarterly_revenue b
    ON a.taxi_type = b.taxi_type
    AND a.quarter = b.quarter
    AND a.year = b.year + 1


