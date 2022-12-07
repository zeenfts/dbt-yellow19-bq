WITH vendor_stg AS(
    SELECT DISTINCT 
        VendorID
    FROM {{ ref('stg_yellow_taxi') }}
)

SELECT
    VendorID,
    {{ decode_vendor('VendorID') }} as vendor_name,
FROM 
    vendor_stg
WHERE
    VendorID IS NOT NULL
ORDER BY
    VendorID ASC