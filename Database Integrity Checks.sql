-- Entity Integrity:
-- 		Check for NULL values in primary keys for all tables
SELECT * FROM Pokemon WHERE PokemonNo IS NULL;
SELECT * FROM Type WHERE TypeNo IS NULL;
SELECT * FROM PokemonType WHERE ID IS NULL;
SELECT * FROM Color WHERE ColorID IS NULL;
SELECT * FROM PokemonAbility WHERE ID IS NULL;
SELECT * FROM Ability WHERE AbilityID IS NULL;
SELECT * FROM AbilityUsage WHERE PokemonNo IS NULL OR AbilityID IS NULL;
SELECT * FROM DamageType WHERE TypeNo IS NULL;
SELECT * FROM Item WHERE ID IS NULL;
SELECT * FROM ItemUsage WHERE PokemonNo IS NULL OR ItemID IS NULL;
SELECT * FROM Popularity_Rank WHERE ID IS NULL;
SELECT * FROM Competition_Record WHERE ID IS NULL;

-- After checking all tables, no NULL primary keys were found


-- Entity Integrity
-- 		Check for uniqueness in primary keys for all tables
SELECT PokemonNo, COUNT(*) FROM Pokemon GROUP BY PokemonNo HAVING COUNT(*) > 1;
SELECT TypeNo, COUNT(*) FROM Type GROUP BY TypeNo HAVING COUNT(*) > 1;
SELECT ID, COUNT(*) FROM PokemonType GROUP BY ID HAVING COUNT(*) > 1;
SELECT ColorID, COUNT(*) FROM Color GROUP BY ColorID HAVING COUNT(*) > 1;
SELECT ID, COUNT(*) FROM PokemonAbility GROUP BY ID HAVING COUNT(*) > 1;
SELECT AbilityID, COUNT(*) FROM Ability GROUP BY AbilityID HAVING COUNT(*) > 1;
SELECT PokemonNo, AbilityID, COUNT(*) FROM AbilityUsage GROUP BY PokemonNo, AbilityID HAVING COUNT(*) > 1;
SELECT TypeNo, COUNT(*) FROM DamageType GROUP BY TypeNo HAVING COUNT(*) > 1;
SELECT ID, COUNT(*) FROM Item GROUP BY ID HAVING COUNT(*) > 1;
SELECT PokemonNo, ItemID, COUNT(*) FROM ItemUsage GROUP BY PokemonNo, ItemID HAVING COUNT(*) > 1;
SELECT ID, COUNT(*) FROM Popularity_Rank GROUP BY ID HAVING COUNT(*) > 1;
SELECT ID, COUNT(*) FROM Competition_Record GROUP BY ID HAVING COUNT(*) > 1;

-- After checking all tables, no repeating primary keys were found


-- Referential Integrity:
-- Check referential integrity for table PokemonType:
SELECT * FROM PokemonType WHERE PokemonNo NOT IN (SELECT PokemonNo FROM Pokemon);
SELECT * FROM PokemonType WHERE TypeID NOT IN (SELECT TypeNo FROM Type);

-- No referential integrity violations found


-- Check referential integrity for table PokemonAbility
SELECT * FROM PokemonAbility WHERE PokemonNo NOT IN (SELECT PokemonNo FROM Pokemon);
SELECT * FROM PokemonAbility WHERE AbilityID NOT IN (SELECT AbilityID FROM Ability);

-- No referential integrity violations found


-- Check referential integrity for table AbilityUsage
SELECT * FROM AbilityUsage WHERE PokemonNo NOT IN (SELECT PokemonNo FROM Pokemon);
SELECT * FROM AbilityUsage WHERE AbilityID NOT IN (SELECT AbilityID FROM Ability);

-- No referential integrity violations found


-- Check referential integrity for table ItemUsage
SELECT * FROM ItemUsage WHERE PokemonNo NOT IN (SELECT PokemonNo FROM Pokemon);
SELECT * FROM ItemUsage WHERE ItemID NOT IN (SELECT ID FROM Item);

-- No referential integrity violations found


-- Check referential integrity for table Competition_Record
SELECT * FROM Competition_Record WHERE PokemonNo NOT IN (SELECT PokemonNo FROM Pokemon);
SELECT * FROM Competition_Record WHERE AbilityID1 NOT IN (SELECT AbilityID FROM Ability);
SELECT * FROM Competition_Record WHERE AbilityID2 NOT IN (SELECT AbilityID FROM Ability);
SELECT * FROM Competition_Record WHERE AbilityID3 NOT IN (SELECT AbilityID FROM Ability);
SELECT * FROM Competition_Record WHERE AbilityID4 NOT IN (SELECT AbilityID FROM Ability);

-- No referential integrity violations found


-- Check referential integrity for table Popularity_Rank
SELECT * FROM Popularity_Rank WHERE PokemonNo NOT IN (SELECT PokemonNO FROM Pokemon);

-- No referential integrity violations found
