WITH decode_cols AS(
    SELECT 
        tpep_pickup_datetime as pickup_datetime,
        tpep_dropoff_datetime as dropoff_datetime,
        PULocationID,
        Borough as puBorough,
        tzl.Zone as puZone,
        DOLocationID,
        store_and_fwd_flag,
        {{ decode_vendor('vendorId') }} as vendor_name,
        {{ decode_ratecode('rateCodeId') }} as rate_name,
        {{ decode_payment('payment_type') }} as method_payment,
        passenger_count,
        trip_distance,
        total_amount
    FROM {{ ref('fact_trips') }}
    LEFT JOIN {{ ref('dim_location') }} tzl
    ON PULocationID = cast(LocationID AS string)
)

SELECT 
    pickup_datetime,
    dropoff_datetime,
    PULocationID,
    puBorough,
    puZone,
    DOLocationID,
    Borough as doBorough,
    tzl.Zone as doZone,
    store_and_fwd_flag,
    vendor_name,
    rate_name,
    method_payment,
    passenger_count,
    trip_distance,
    total_amount
FROM decode_cols
LEFT JOIN {{ ref('dim_location') }} tzl
ON DOLocationID = cast(LocationID AS string)