with yellow_taxi as (
    SELECT
        {{ dbt_utils.surrogate_key(['VendorID', 'tpep_pickup_datetime', 'PULocationID']) }} as tripId,
        {{ dbt_utils.surrogate_key(['tpep_dropoff_datetime', 'trip_distance', 'RatecodeID', 'DOLocationID']) }} as transactId,
        {{ dbt_utils.surrogate_key(['VendorID', 'tpep_dropoff_datetime', 'DOLocationID']) }} as txmTraceId,
        RatecodeID as rateCodeId,
        passenger_count,
    FROM 
        {{ ref('stg_yellow_taxi') }}
)

-- vendor_taxi AS(
--     SELECT 
--         txmTraceId,
--         tpep_pickup_datetime,
--         tpep_dropoff_datetime,
--         PULocationID,
--         DOLocationID,
--         store_and_fwd_flag,
--         trip_distance
--     FROM
--         {{ ref('dim_vendor') }}
-- ),

-- together_joined AS(
--     SELECT
--         ytx.txmTraceId,
--         tpep_pickup_datetime,
--         tpep_dropoff_datetime,
--         PULocationID,
--         DOLocationID,
--         store_and_fwd_flag,
--         VendorID as vendorId,
--         RatecodeID as rateCodeId,
--         passenger_count,
--         trip_distance,
--         tripId
--     FROM
--         yellow_taxi ytx
--     LEFT JOIN 
--         vendor_taxi vtx
--     ON ytx.txmTraceId = vtx.txmTraceId
-- ),

-- amount_joined AS(
--     SELECT
--         dts.transactId,
--         txmTraceId,
--         tpep_pickup_datetime,
--         tpep_dropoff_datetime,
--         PULocationID,
--         DOLocationID,
--         store_and_fwd_flag,
--         VendorID as vendorId,
--         RatecodeID as rateCodeId,
--         payment_type,
--         passenger_count,
--         trip_distance,
--         tripId,
--         total_amount
--     FROM 
--         together_joined tgd
--     left JOIN
--         {{ ref('dim_transaction') }} dts
--     ON dts.transactId = dts.transactId
-- )

SELECT *
FROM
    yellow_taxi
WHERE 
    passenger_count > 0