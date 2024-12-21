--Actividad 1
SELECT 
    cabs.company_name,
    COUNT(trips.trip_id) AS trips_amount 
From
    cabs
INNER JOIN trips ON trips.cab_id = cabs.cab_id
Where 
    trips.start_ts::date = '2017-11-15'
    OR trips.start_ts::date = '2017-11-16'
GROUP BY
    cabs.company_name
ORDER BY
    trips_amount DESC;


-- Actividad 2
SELECT 
    company_name, 
    trips_amount
FROM (
    SELECT 
        c.company_name, 
        COUNT(t.trip_id) AS trips_amount
    FROM 
        trips t
    JOIN 
        cabs c
        ON t.cab_id = c.cab_id
    WHERE 
        c.company_name LIKE '%Yellow%' 
        AND CAST(t.start_ts AS DATE) >= '2017-11-01'
        AND CAST(t.start_ts AS DATE) < '2017-11-08'
    GROUP BY 
        c.company_name

    UNION

    SELECT 
        c.company_name, 
        COUNT(t.trip_id) AS trips_amount
    FROM 
        trips t
    JOIN 
        cabs c
        ON t.cab_id = c.cab_id
    WHERE 
        c.company_name LIKE '%Blue%' 
        AND CAST(t.start_ts AS DATE) >= '2017-11-01'
        AND CAST(t.start_ts AS DATE) < '2017-11-08'
    GROUP BY 
        c.company_name
) AS combined_results
ORDER BY 
    trips_amount DESC;

-- actividad 3

SELECT 
    CASE 
        WHEN c.company_name = 'Flash Cab' THEN 'Flash Cab'
        WHEN c.company_name = 'Taxi Affiliation Services' THEN 'Taxi Affiliation Services'
        ELSE 'Other'
    END AS company, 
    COUNT(t.trip_id) AS trips_amount
FROM 
    trips t
JOIN 
    cabs c
    ON t.cab_id = c.cab_id
WHERE 
    CAST(t.start_ts AS DATE) >= '2017-11-01'
    AND CAST(t.start_ts AS DATE) < '2017-11-08'
GROUP BY 
    CASE 
        WHEN c.company_name = 'Flash Cab' THEN 'Flash Cab'
        WHEN c.company_name = 'Taxi Affiliation Services' THEN 'Taxi Affiliation Services'
        ELSE 'Other'
    END
ORDER BY 
    trips_amount DESC;



-- actividad 4
SELECT 
    name,
    neighborhood_id
FROM 
    neighborhoods
WHERE
   name LIKE '%Hare' OR name LIKE 'Loop'


--act 5
select 
    ts, 
    CASE 
    WHEN description LIKE '%rain%' THEN 'Bad' 
    WHEN description LIKE '%storm%' THEN 'Bad' 
    ELSE 'Good' 
END AS weather_conditions
FROM 
    weather_records


-- act 6
SELECT
    trips.start_ts,
        CASE 
    WHEN weather_records.description LIKE '%rain%' THEN 'Bad' 
    WHEN weather_records.description LIKE '%storm%' THEN 'Bad' 
    ELSE 'Good' 
    END AS weather_conditions,
    trips.duration_seconds
FROM 
    trips
INNER JOIN 
    weather_records ON  trips.start_ts = weather_records.ts
Where
    EXTRACT(DOW from trips.start_ts)= 6 AND
    trips.pickup_location_id = 50 AND 
    trips.dropoff_location_id = 63
ORDER BY 
trip_id;