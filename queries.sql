/*Queries that provide answers to the questions from all projects.*/

SELECT * from animal WHERE name = 'Luna';
SELECT * FROM animal WHERE name LIKE '%mon';
SELECT name FROM animal WHERE date_of_birth BETWEEN DATE '2016-01-01' AND '2019-12-31';
SELECT name FROM animal WHERE neutered IS true AND escape_attempts < 3;
SELECT date_of_birth FROM animal WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animal WHERE weight_kg > 10.5;
SELECT * FROM animal WHERE neutered IS true;
SELECT * FROM animal WHERE name != 'Gabumon';
SELECT * FROM animal WHERE weight_kg BETWEEN 10.4 AND 17.3

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

SELECT name, full_name
  FROM animal
  INNER JOIN owners
  ON animal.owners_id = owners.id
  WHERE owners.full_name = 'Melody Pond';

SELECT animal.name, species.name
  FROM animal
  INNER JOIN species
  ON animal.species_id = species.id
  WHERE species.name = 'Pokemon';

SELECT owners.full_name, animal.name
  FROM owners
  LEFT JOIN animal
  ON owners.id = animal.owners_id;

SELECT COUNT(animal.name), species.name
  FROM animal
  INNER JOIN species
  ON animal.species_id = species.id
  GROUP BY species.name;

SELECT owners.full_name, animal.name, species.name
  FROM owners
  INNER JOIN animal
  ON owners.id = animal.owners_id
  INNER JOIN species
  ON species.id = animal.species_id
  WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT owners.full_name, animal.name, animal.escape_attempts
  FROM owners
  INNER JOIN animal
  ON owners.id = animal.owners_id
  WHERE owners.full_name = 'Dean Winchester' AND animal.escape_attempts = 0;

SELECT owners.full_name , COUNT(*)
  FROM owners
  INNER JOIN animal
  ON owners.id = animal.owners_id
  GROUP BY owners.full_name
  ORDER BY count DESC LIMIT 1;