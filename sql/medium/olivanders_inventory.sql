/*
Harry Potter and his friends are at Ollivander's with Ron, finally replacing
Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of
gold galleons needed to buy each non-evil wand of high power and age. Write a
query to print the id, age, coins_needed, and power of the wands that Ron's
interested in, sorted in order of descending power. If more than one wand has
same power, sort the result in order of descending age.

The following tables contain data on the wands in Ollivander's inventory:
 - Wands: The id is the id of the wand, code is the code of the wand,
 coins_needed is the total number of gold galleons needed to buy the wand, and
 power denotes the quality of the wand (the higher the power, the better the
 wand is).
 - Wands_Property: The code is the code of the wand, age is the age of the
 wand, and is_evil denotes whether the wand is good for the dark arts. If the
 value of is_evil is 0, it means that the wand is not evil. The mapping between
 code and age is one-one
*/

/*
First attempt - wrong result
For the reason for MIN(Wands.id), see the answer by Ahmad Mobaraki on
https://stackoverflow.com/questions/41887460/select-list-is-not-in-group-by-clause-and-contains-nonaggregated-column-inc
*/

SELECT MIN(Wands.id), Wands_Property.age, MIN(Wands.coins_needed), Wands.power
FROM Wands
INNER JOIN Wands_Property ON Wands.code = Wands_Property.code
WHERE Wands_Property.is_evil = 0
GROUP BY Wands.power, Wands_Property.age
ORDER BY Wands.power DESC, Wands_Property.age DESC;

/*
Second attempt - right result
*/

SELECT Wands.Id, a.age, a.cn, a.pwr
FROM Wands
JOIN Wands_Property ON Wands.code = Wands_Property.code
JOIN (
    SELECT Wands_Property.age AS age, MIN(Wands.coins_needed) AS cn, Wands.power AS pwr
    FROM Wands
    JOIN Wands_Property ON Wands.code = Wands_Property.code
    WHERE Wands_Property.is_evil = 0
    GROUP BY Wands.power, Wands_Property.age, Wands.code
) a ON Wands_Property.age = a.age AND Wands.coins_needed = a.cn AND Wands.power = a.pwr
ORDER BY a.pwr DESC, a.age DESC;
