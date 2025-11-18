/*____________________________________________________________________
Advanced Analysis

Purpose:
-To uncover deeper insights, unusual patterns, or correlations that aren't visible with simple grouping.

Why it's important:
-Advanced analysis creates richer storytelling and supports more analytical conclusions in your project.

____________________________________________________________________ */
--QUERIES

-- 1. Top 10 busiest hours
SELECT 
    date,
    hour,
    bike_rental_count
FROM bike_data
ORDER BY bike_rental_count DESC
LIMIT 10;

-- 2. Correlation analysis
SELECT
    corr(bike_rental_count, temperature_f)       AS corr_rentals_temp,
    corr(bike_rental_count, humidity_percent)    AS corr_rentals_humidity,
    corr(bike_rental_count, wind_speed_ms)       AS corr_rentals_wind,
    corr(bike_rental_count, solar_radiation_mj)  AS corr_rentals_solar
FROM bike_data;

-- 3. Rentals by humidity bands
SELECT
    CASE
        WHEN humidity_percent < 30 THEN 'Low (<30%)'
        WHEN humidity_percent < 60 THEN 'Medium (30–60%)'
        ELSE 'High (>=60%)'
    END AS humidity_band,
    AVG(bike_rental_count) AS avg_rentals,
    COUNT(*)               AS hours
FROM bike_data
GROUP BY humidity_band
ORDER BY avg_rentals DESC;

-- 4. Snow vs no snow (if applicable)
SELECT
    CASE WHEN snowfall_cm > 0 THEN 'Snow' ELSE 'No snow' END AS snow_flag,
    AVG(bike_rental_count) AS avg_rentals,
    SUM(bike_rental_count) AS total_rentals,
    COUNT(*)               AS hours
FROM bike_data
GROUP BY snow_flag
ORDER BY avg_rentals DESC;
