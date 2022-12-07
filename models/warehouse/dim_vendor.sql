WITH vendor_stg AS(
    SELECT *
    FROM {{ ref('stg_yellow_taxi') }}
)

SELECT
    {{ dbt_utils.surrogate_key(['VendorID', 'tpep_dropoff_datetime', 'DOLocationID']) }} as txmTraceId,
    VendorID,
    {{ decode_vendor('VendorID') }} as vendor_name,
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    PULocationID,
    DOLocationID,
    store_and_fwd_flag,
    trip_distance,
FROM 
    vendor_stg
WHERE
    VendorID IS NOT NULL AND trip_distance > 0
ORDER BY
    VendorID ASC