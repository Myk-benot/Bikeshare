
with bike_share AS (

SELECT 
--Select values needed for viz.
rideable_type,
CONVERT(DATE,started_at) AS start_date,
--Date calculation
CONVERT(DATE,ended_at) AS end_date,
--Date calculation
DATEDIFF(Minute,started_at,ended_at) AS ride_length,
--Calculation for ride_length
DATENAME (WEEKDAY, started_at) AS week_day,
--Calculation to display weekday for viz
start_station_name,
end_station_name,
member_casual
FROM dbo.[1]
--
WHERE 
start_station_name IS NOT NULL 
AND
end_station_name IS NOT NULL)
--Decided to remove the empty station names.
SELECT * FROM bike_share
WHERE ride_length > 0
--Remove ride length thats less than zero.