/*
Consider P1(a, c) and P2(b, d) to be two points on a 2D plane where (a, b) are
the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,
d) are the respective minimum and maximum values of Western Longitude (LONG_W)
in STATION.

Query the Euclidean Distance between points  and  and format your answer to
display  decimal digits.
*/

SELECT ROUND(SQRT(POWER((MAX(LAT_N) - MIN(LAT_N)),2) + POWER((MAX(LONG_W) - MIN(LONG_W)),2)), 4) FROM STATION;
