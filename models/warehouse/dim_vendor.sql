WITH vendor_stg AS(
    SELECT DISTINCT 
        VendorID
    FROM {{ ref('stg_yellow_taxi') }}
)

SELECT 
    VendorID,
    decode_vendor(VendorID) as vendor_name,
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    PULocationID,
    DOLocationID,
FROM vendor_stg