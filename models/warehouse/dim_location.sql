select 
    LocationID,
    tzl.Borough,
    Latitude as brLat,
    Longitude as brLon,
    tzl.Zone,
    service_zone
from 
{{ ref('taxi_zone_lookup') }} tzl
LEFT JOIN {{ ref('borough_latlon') }} bgl
ON tzl.Borough = bgl.Borough