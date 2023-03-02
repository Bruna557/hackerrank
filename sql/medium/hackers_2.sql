/*
The total score of a hacker is the sum of their maximum scores for all of the
challenges. Write a query to print the hacker_id, name, and total score of the
hackers ordered by the descending score. If more than one hacker achieved the
same total score, then sort the result by ascending hacker_id. Exclude all
hackers with a total score of  from your result.
*/

SELECT Hackers.hacker_id, Hackers.name, SUM(a.s)
FROM Hackers
JOIN (
    SELECT hacker_id, challenge_id, MAX(score) as s
    FROM Submissions
    GROUP BY hacker_id, challenge_id
) a ON Hackers.hacker_id = a.hacker_id
GROUP BY Hackers.hacker_id, Hackers.name
HAVING SUM(a.s) > 0
ORDER BY SUM(a.s) DESC, Hackers.hacker_id ASC;
