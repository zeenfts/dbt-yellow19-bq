with yellow_taxi as (
    SELECT
        {{ dbt_utils.surrogate_key(['VendorID', 'tpep_pickup_datetime', 'PULocationID', 'DOLocationID', 'RatecodeID']) }} as tripId,
        tpep_pickup_datetime,
        tpep_dropoff_datetime,
        PULocationID,
        DOLocationID,
        store_and_fwd_flag,
        VendorID as vendorId,
        RatecodeID as rateCodeId,
        payment_type,
        passenger_count,
        trip_distance,
        total_amount
    FROM 
        {{ ref('stg_yellow_taxi') }}
    WHERE
        RatecodeID IS NOT NULL 
        AND
        cast(RatecodeID as integer) < 7
        AND 
        cast(VendorID as integer) < 3
)

SELECT *
FROM
    yellow_taxi
WHERE 
    passenger_count > 0 AND trip_distance > 0