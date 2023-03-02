/*
Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately
followed by the first letter of each profession as a parenthetical (i.e.:
enclosed in parentheses). For example: AnActorName(A), ADoctorName(D),
AProfessorName(P), and ASingerName(S).

Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the
occurrences in ascending order, and output them in the following format:

    There are a total of [occupation_count] [occupation]s.

where [occupation_count] is the number of occurrences of an occupation in
OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one
Occupation has the same [occupation_count], they should be ordered
alphabetically.

Note: There will be at least two entries in the table for each type of
occupation.
*/

SELECT CASE
    WHEN Occupation = 'Doctor' THEN CONCAT(Name, '(D)')
    WHEN Occupation = 'Professor' THEN CONCAT(Name, '(P)')
    WHEN Occupation = 'Singer' THEN CONCAT(Name, '(S)')
    ELSE CONCAT(Name, '(A)')
END
FROM OCCUPATIONS;

SELECT CASE
    WHEN Occupation = 'Doctor' THEN CONCAT('There are a total of ', Total, ' doctors')
    WHEN Occupation = 'Professor' THEN CONCAT('There are a total of ', Total, ' professors')
    WHEN Occupation = 'Singer' THEN CONCAT('There are a total of ', Total, ' singers')
    ELSE CONCAT('There are a total of ', Total, ' actors')
END
FROM (SELECT Occupation, COUNT(Occupation) AS Total FROM OCCUPATIONS GROUP BY Occupation ORDER BY Total, Occupation) AS Result;


/* From the discussion */
SELECT CONCAT(NAME, '(',SUBSTR(OCCUPATION,1,1),')') FROM OCCUPATIONS ORDER BY NAME;

SELECT CONCAT('There are a total of ',COUNT(OCCUPATION),' ',LOWER(OCCUPATION),'s.') FROM OCCUPATIONS GROUP BY OCCUPATION ORDER BY COUNT(OCCUPATION),OCCUPATION;
