/*
Find the difference between the total number of CITY entries in the table and
the number of distinct CITY entries in the table.
*/

SELECT (SELECT COUNT(ID) FROM STATION) - (SELECT COUNT(DISTINCT CITY) FROM STATION);
