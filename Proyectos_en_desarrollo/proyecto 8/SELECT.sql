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

