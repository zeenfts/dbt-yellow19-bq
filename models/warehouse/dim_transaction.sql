WITH yellow_taxi AS (
    SELECT * 
    FROM {{ ref('stg_yellow_taxi') }}
)

SELECT
    {{ dbt_utils.surrogate_key(['tpep_dropoff_datetime', 'trip_distance', 'RatecodeID', 'DOLocationID']) }} as transactId,
    payment_type,
    fare_amount,
    extra,
    mta_tax,
    tip_amount, 
    tolls_amount,
    improvement_surcharge,
    congestion_surcharge,
    total_amount
FROM
    yellow_taxi