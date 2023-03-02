/*
Julia just finished conducting a coding contest, and she needs your help
assembling the leaderboard! Write a query to print the respective hacker_id and
name of hackers who achieved full scores for more than one challenge. Order
your output in descending order by the total number of challenges in which the
hacker earned a full score. If more than one hacker received full scores in
same number of challenges, then sort them by ascending hacker_id.

The following tables contain contest data:
    - Hackers: hacker_id, name
    - Difficulty: difficulty_level, score (max score for this difficulty level)
    - Challenges: challenge_id, hacker_id, difficulty_level
    - Submissions: submission_id, hacker_id, challenge_id, score
*/

SELECT Hackers.hacker_id, Hackers.name
FROM Hackers
INNER JOIN Submissions ON Hackers.hacker_id = Submissions.hacker_id
INNER JOIN Challenges ON Submissions.challenge_id = Challenges.challenge_id
INNER JOIN Difficulty ON Challenges.difficulty_level = Difficulty.difficulty_level
WHERE Submissions.score = Difficulty.score
GROUP BY Hackers.hacker_id, Hackers.name
HAVING COUNT(Hackers.hacker_id) > 1
ORDER BY COUNT(Hackers.hacker_id) DESC, Hackers.hacker_id ASC;
