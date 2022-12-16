/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN DATE '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered IS true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IS true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3

-- Transactions
BEGIN;
UPDATE animal
SET species = 'unspecified';
SELECT * FROM animal;
ROLLBACK;
SELECT * FROM animal;

BEGIN;
UPDATE animal
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animal
SET species = 'pokemon'
WHERE species is NULL;
SELECT * FROM animal;

COMMIT;
SELECT * FROM animal;

BEGIN;
DELETE FROM animal;
SELECT * FROM animal;
ROLLBACK;
SELECT * FROM animal;

BEGIN;
DELETE FROM animal
WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
SELECT * FROM animal;

UPDATE animal
SET weight_kg = weight_kg * -1;
SELECT * FROM animal;

ROLLBACK TO SP1;
SELECT * FROM animal;

UPDATE animal
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animal;

-- How many animals are there?
SELECT COUNT(*) FROM animal;

--  number of animals have never tried to escape?
SELECT COUNT(*) AS "Animals count that never escaped" FROM animal
WHERE escape_attempts = 0;

-- average weight of animal?
SELECT CAST(AVG(weight_kg) AS DECIMAL(10,2)) AS "Animal average Weight" FROM animal;

-- escapes the most, neutered or not neutered animal?
SELECT neutered, MAX(escape_attempts) AS "Maximum escape attempts" FROM animal
GROUP BY neutered;

-- minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg) AS "Minimum weight", MAX(weight_kg) AS "MAX weight" FROM animal
GROUP BY species;

-- average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, CAST(AVG(escape_attempts) AS DECIMAL(10)) AS "Average of escaping" FROM animal
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;