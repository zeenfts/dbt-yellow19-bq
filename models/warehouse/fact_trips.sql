with yellow_taxi as (
    SELECT
        {{ dbt_utils.surrogate_key(['VendorID', 'tpep_pickup_datetime', 'PULocationID', 'DOLocationID', 'RatecodeID']) }} as tripId,
        tpep_pickup_datetime as pickup_datetime,
        tpep_dropoff_datetime as dropoff_datetime,
        PULocationID,
        DOLocationID,
        store_and_fwd_flag,
        VendorID as vendorId,
        RatecodeID as rateCodeId,
        payment_type,
        passenger_count,
        trip_distance,
        fare_amount,
        total_amount
    FROM 
        {{ ref('stg_yellow_taxi') }}
    WHERE
        RatecodeID IS NOT NULL 
        AND
        cast(RatecodeID as integer) < 7
        AND 
        cast(VendorID as integer) < 3
),

filter_1 as (
    SELECT *
    FROM
        yellow_taxi
    WHERE 
        passenger_count > 0 AND trip_distance > 0
)

SELECT * 
FROM 
    filter_1
WHERE DATETIME(pickup_datetime) BETWEEN 
DATETIME("2019-01-01 00:00:00") AND DATETIME("2020-01-01 00:00:00")