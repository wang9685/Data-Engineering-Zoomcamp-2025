{{
    config(
        materialized='table'
    )
}}

WITH quarterly_revenue AS (
    SELECT
        service_type,  -- 'green' or 'yellow'
        EXTRACT(YEAR FROM pickup_datetime) AS year,
        EXTRACT(QUARTER FROM pickup_datetime) AS quarter,
        SUM(total_amount) AS total_revenue
    FROM
        `zoomcamp_week4.fact_trips` 
    GROUP BY
        service_type, year, quarter
)

SELECT 
    year,
    quarter,
    total_revenue,
    service_type,
    total_revenue - LAG(total_revenue) OVER (PARTITION BY service_type, quarter ORDER BY year) AS revenue_diff
FROM quarterly_revenue
ORDER BY revenue_diff



