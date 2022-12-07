with yellow_taxi as (
    SELECT * 
    FROM {{ ref('stg_yellow_taxi') }}
)

SELECT
    {{ dbt_utils.surrogate_key(['VendorID', 'tpep_pickup_datetime', 'PULocationID']) }} as tripId,
    {{ dbt_utils.surrogate_key(['tpep_dropoff_datetime', 'trip_distance', 'RatecodeID', 'DOLocationID']) }} as transactId,
    VendorID as vendorId,
    RatecodeID as rateCodeId,
    payment_type,
    passenger_count,
    trip_distance,
FROM
    yellow_taxi
WHERE 
    trip_distance > 0 AND passenger_count > 0