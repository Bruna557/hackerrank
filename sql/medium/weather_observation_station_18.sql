/*
Consider P1(a, b) and P2(c, d) to be two points on a 2D plane.

    - a happens to equal the minimum value in Northern Latitude (LAT_N inSTATION).
    - b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
    - c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
    - d happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.
*/

SELECT ROUND(((SELECT MAX(LAT_N) FROM STATION) - (SELECT MIN(LAT_N) FROM STATION) + (SELECT MAX(LONG_W) FROM STATION) - (SELECT MIN(LONG_W) FROM STATION)), 4);

/* From de discussion */
SELECT ROUND(abs(MAX(LAT_N) - MIN(LAT_N)) + abs(MAX(LONG_W) - MIN(LONG_W)), 4) FROM STATION
