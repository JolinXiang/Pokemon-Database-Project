-- This query returns a table containing "Pokemon Name" and "Pokemon Type"
-- 		for all fire-type pokemon. This type of query could be useful for
-- 		players who want to see al the pokemon of a specific type.
SELECT NAME AS 'Pokemon Name',
	TypeName AS 'Pokemon Type'
FROM Pokemon p
JOIN PokemonType pt ON p.PokemonNo = pt.PokemonNo
JOIN Type t ON t.TypeNo = pt.TypeID
WHERE TypeName = 'Fire';

-- This query returns a table that displays the top three competitive players
-- 		for the year 2022, as well as their pokemon choices and ability
-- 		combinations. With this information, players can replicate the ability
-- 		combinations of the top players to gain an advantage over others who
-- 		don't have this information.
SELECT cr.YEAR AS 'Year', cr.Player, cr.Rank,
	p.NAME AS Pokemon, a1.NAME AS 'Ability 1',
    a2.NAME AS 'Ability 2', a3.NAME AS 'Ability 3',
    a4.NAME AS 'Ability 4'
FROM Competition_record cr
INNER JOIN Pokemon p ON cr.PokemonNo = p.PokemonNo
INNER JOIN Ability a1 ON cr.AbilityID1 = a1.AbilityID
INNER JOIN Ability a2 ON cr.AbilityID2 = a2.AbilityID
INNER JOIN Ability a3 ON cr.AbilityID3 = a3.AbilityID
INNER JOIN Ability a4 ON cr.AbilityID4 = a4.AbilityID
WHERE YEAR = 2022;

-- This query returns the pokemon with the ten hightest total stats.
-- 		Total stats refers to the sum of all the pokemon's individual
-- 		stats, like their HP, Attack, and Defense values. It's useful
-- 		for players to know what the hightet total stats pokemon are.
SELECT PokemonNo AS 'Pokemon ID',
	NAME AS 'Pokemon Name',
    Total AS 'Total Stats'
FROM Pokemon
ORDER BY Total DESC
LIMIT 10;

-- This query returns the top three most popular pokemon for each year.
-- 		Popularity can be an indicator of a pokemon's performance in
-- 		battle, so this could potentially prove to be useful information
-- 		for a player to leverage.
SELECT p.NAME AS 'Pokemon Name',
	Rank AS 'Popularity Rank',
    YEAR AS 'Year'
FROM Pokemon p
JOIN popularity_rank pr ON pr.PokemonNo = p.PokemonNo
WHERE Rank <=3
ORDER BY YEAR DESC;
