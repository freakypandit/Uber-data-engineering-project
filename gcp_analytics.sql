CREATE OR REPLACE TABLE `dezoomcamptaxi.uber_de_project.uber_data_analytics` AS (
SELECT 
f.trip_id,
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
p.occupancy_code,
t.trip_distance_code,
r.rate_code_name,
pick.pickup_latitude,
pick.pickup_longitude,
drop.dropoff_latitude,
drop.dropoff_longitude,
pay.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount
FROM 
`dezoomcamptaxi.uber_de_project.fact_table` f
JOIN `dezoomcamptaxi.uber_de_project.datetime_dim` d  ON f.datetime_id=d.datetime_id
JOIN `dezoomcamptaxi.uber_de_project.occupancy_dim` p  ON p.occupancy_dim_id=f.occupancy_dim_id  
JOIN `dezoomcamptaxi.uber_de_project.trip_distance_dim` t  ON t.trip_distance_id=f.trip_distance_id  
JOIN `dezoomcamptaxi.uber_de_project.rate_code_dim` r ON r.rate_code_id=f.rate_code_id  
JOIN `dezoomcamptaxi.uber_de_project.pickup_location_dim` pick ON pick.pickup_location_id=f.pickup_location_id
JOIN `dezoomcamptaxi.uber_de_project.dropoff_location_dim` drop ON drop.dropoff_location_id=f.dropoff_location_id
JOIN `dezoomcamptaxi.uber_de_project.payment_type_dim` pay ON pay.payment_type_id=f.payment_type_id)
;