WITH payment_stg AS(
    SELECT DISTINCT 
        payment_type
    FROM {{ ref('stg_yellow_taxi') }}
)

SELECT 
    payment_type,
    decode_payment(payment_type) as method_payment
FROM payment_stg