/*____________________________________________________________________
Dimension Exploration

Purpose:
-To analyze how rentals differ across various categories or conditions (season, holiday, weather).

Why it's important:
-This reveals the external factors that shape demand, helping identify what drives usage.

____________________________________________________________________ */
--QUERIES

-- 1. Rental count by season
SELECT 
    seasons,
    AVG(bike_rental_count) AS avg_rentals,
    SUM(bike_rental_count) AS total_rentals
FROM bike_data
GROUP BY seasons
ORDER BY avg_rentals DESC;

-- 2. Holiday vs non-holiday
SELECT 
    holiday,
    AVG(bike_rental_count) AS avg_rentals,
    SUM(bike_rental_count) AS total_rentals
FROM bike_data
GROUP BY holiday
ORDER BY avg_rentals DESC;

-- 4. Temperature bands
SELECT
    CASE
        WHEN temperature_f < 32 THEN 'Freezing (<32°F)'
        WHEN temperature_f < 50 THEN 'Cold (32–50°F)'
        WHEN temperature_f < 68 THEN 'Cool (50–68°F)'
        WHEN temperature_f < 80 THEN 'Warm (68–80°F)'
        ELSE 'Hot (>=80°F)'
    END AS temp_band,
    AVG(bike_rental_count) AS avg_rentals,
    COUNT(*) AS hours
FROM bike_data
GROUP BY temp_band
ORDER BY avg_rentals DESC;

-- 5. Rain vs dry
SELECT
    CASE WHEN rainfall_mm > 0 THEN 'Rainy' ELSE 'Dry' END AS rain_flag,
    AVG(bike_rental_count) AS avg_rentals,
    SUM(bike_rental_count) AS total_rentals,
    COUNT(*)               AS hours
FROM bike_data
GROUP BY rain_flag
ORDER BY avg_rentals DESC;
