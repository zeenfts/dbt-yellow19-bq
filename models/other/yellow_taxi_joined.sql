WITH lookup_clean AS(
    SELECT *
    FROM {{ ref('dim_location') }}
    WHERE Borough <> "Unknown"
),

decode_cols AS(
    SELECT 
        pickup_datetime,
        dropoff_datetime,
        PULocationID,
        Borough as puBorough,
        brLat as puBrLat,
        brLon as puBrLon,
        CONCAT(brLat, ", " , brLon) as puBrLatLon,
        tzl.Zone as puZone,
        Country as puCountry,
        tzl.State as puState,
        DOLocationID,
        store_and_fwd_flag,
        {{ decode_vendor('vendorId') }} as vendor_name,
        {{ decode_ratecode('rateCodeId') }} as rate_name,
        {{ decode_payment('payment_type') }} as method_payment,
        passenger_count,
        trip_distance,
        fare_amount,
        total_amount
    FROM {{ ref('fact_trips') }}
    INNER JOIN lookup_clean tzl
    ON PULocationID = cast(LocationID AS string)
), 

select_joined AS(
    SELECT 
        pickup_datetime,
        dropoff_datetime,
        DATETIME_DIFF(dropoff_datetime, pickup_datetime, MINUTE) as trip_duration_minutes,
        PULocationID,
        puBorough,
        puBrLat,
        puBrLon,
        puBrLatLon,
        puZone,
        puCountry,
        puState,
        DOLocationID,
        Borough as doBorough,
        brLat as doBrLat,
        brLon as doBrLon,
        CONCAT(brLat, ", " , brLon) as doBrLatLon,
        tzl.Zone as doZone,
        Country as doCountry,
        tzl.State as doState,
        store_and_fwd_flag,
        vendor_name,
        rate_name,
        method_payment,
        passenger_count,
        trip_distance,
        fare_amount,
        total_amount
    FROM decode_cols
    INNER JOIN lookup_clean tzl
    ON DOLocationID = cast(LocationID AS string)
)

SELECT * FROM select_joined