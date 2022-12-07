WITH ratecode_stg AS(
    SELECT DISTINCT 
        RatecodeID
    FROM {{ ref('stg_yellow_taxi') }}
)

SELECT 
    RatecodeID,
    {{ decode_ratecode('RatecodeID') }} as rate_name
FROM 
    ratecode_stg
WHERE
    RatecodeID IS NOT NULL 
    AND
    cast(RatecodeID as integer) < 7
ORDER BY
    RatecodeID ASC