with yellow_taxi as (
    SELECT
        {{ dbt_utils.surrogate_key(['VendorID', 'tpep_pickup_datetime', 'PULocationID']) }} as tripId,
        {{ dbt_utils.surrogate_key(['tpep_dropoff_datetime', 'trip_distance', 'RatecodeID', 'DOLocationID']) }} as transactId,
        VendorID as vendorId,
        RatecodeID as rateCodeId,
        payment_type,
        passenger_count,
        trip_distance,
    FROM 
        {{ ref('stg_yellow_taxi') }}
),

vendor_taxi AS(
    SELECT 
        transactId,
        tpep_pickup_datetime,
        tpep_dropoff_datetime,
        PULocationID,
        DOLocationID,
        store_and_fwd_flag
    FROM
        {{ ref('dim_vendor') }}
),

together_joined AS(
    SELECT
        ytx.transactId,
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
        tripId
    FROM
        yellow_taxi ytx
    LEFT JOIN 
        vendor_taxi vtx
    ON ytx.transactId = vtx.transactId
),

amount_joined AS(
    SELECT
        dts.transactId,
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
        tripId,
        total_amount
    FROM 
        together_joined tgd
    left JOIN
        ref {{ ref('dim_transaction') }} dts
    ON dts.transactId = dts.transactId
)

SELECT
    tripId,
    transactId,
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    vendorId,
    store_and_fwd_flag,
    PULocationID,
    DOLocationID,
    rateCodeId,
    payment_type,
    passenger_count,
    trip_distance,
    total_amount
FROM
    amount_joined
WHERE 
    trip_distance > 0 AND passenger_count > 0
ORDER BY
    tpep_pickup_datetime ASC,
    tpep_dropoff_datetime ASC