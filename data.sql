/* Populate database with sample data. */

INSERT INTO animal (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', 'Feb 03,2020', 0, true, 10.23),
('Gabumon', 'Nov 15, 2018', 2, true, 8),
('Pikachu', 'Jan 07, 2021', 1, false, 15.04),
('Devimon', 'May 12, 2017', 5, true, 11),
('Charmander', 'Feb 03, 2020', 0, false, -11),
('Plantmon', 'Nov 15, 2021', 2, true, -5.7),
('Squirtle', 'Jun 12, 2005', 1, true, -12.3),
('Angemon', 'Jun 12, 2005', 1, true, -45),
('Boarmon', 'Jun 07, 2005', 7, true, 20.4),
('Blossom', 'Jun 13, 1998', 3, true, 17),
('Dito', 'May 14, 2022', 1, true, 22);

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon'),
('Digimon');

UPDATE animal SET species_id = 1 WHERE species_id IS NULL;

UPDATE animal SET species_id = 2 WHERE name LIKE '%mon';

UPDATE animal
  SET owners_id = (SELECT id from owners WHERE full_name = 'Sam Smith')
  WHERE name = 'Agumon';

  UPDATE animal
  SET owners_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell')
  WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animal
  SET owners_id = (SELECT id from owners WHERE full_name = 'Bob')
  WHERE name IN ('Devimon', 'Plantmon');

UPDATE animal
  SET owners_id = (SELECT id from owners WHERE full_name = 'Melody Pond')
  WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animal
  SET owners_id = (SELECT id from owners WHERE full_name = 'Dean Winchester')
  WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, 'APR 23, 2000'),
('Maisy Smith', 26, 'Jan 17, 2019'),
('Stephanie Mendez', 64, 'May 4, 1981'),
('Jack Harkness', 38, 'Jun 8, 2008');

INSERT INTO specializations (vet_id, species_id)
VALUES (
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  (SELECT id FROM species WHERE name = 'Pokemon')
);

INSERT INTO specializations (vet_id, species_id)
VALUES (
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM species WHERE name = 'Digimon')
);

INSERT INTO specializations (vet_id, species_id)
VALUES (
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM species WHERE name = 'Pokemon')
);

INSERT INTO specializations (vet_id, species_id)
VALUES (
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM species WHERE name = 'Digimon')
);


INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  (SELECT id FROM animal WHERE name = 'Agumon'),
  'May 24, 2020'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animal WHERE name = 'Agumon'),
  'July 22, 2020'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animal WHERE name = 'Gabumon'),
  'Feb 02, 2021'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animal WHERE name = 'Pikachu'),
  'Jan 05, 2020'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animal WHERE name = 'Pikachu'),
  'Mar 8, 2020'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animal WHERE name = 'Pikachu'),
  'May 14, 2020'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animal WHERE name = 'Devimon '),
  'May 4, 2021'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animal WHERE name = 'Charmander '),
  'Feb 24, 2021'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animal WHERE name = 'Plantmon'),
  'Dec 21, 2019'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  (SELECT id FROM animal WHERE name = 'Plantmon'),
  'Aug 10, 2020'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animal WHERE name = 'Plantmon'),
  'Apr 7, 2021'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animal WHERE name = 'Squirtle'),
  'Sep 29, 2019'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animal WHERE name = 'Angemon'),
  'Oct 3, 2020'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Jack Harkness'),
  (SELECT id FROM animal WHERE name = 'Angemon'),
  'Nov 4, 2020'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animal WHERE name = 'Boarmon'),
  'Jan 24, 2019'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animal WHERE name = 'Boarmon'),
  'May 15, 2019'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animal WHERE name = 'Boarmon'),
  'Feb 27, 2020'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Maisy Smith'),
  (SELECT id FROM animal WHERE name = 'Boarmon'),
  'Aug 3, 2020'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
  (SELECT id FROM animal WHERE name = 'Blossom'),
  'May 24, 2020'
);

INSERT INTO visits (vet_id, animal_id, date_of_visit)
VALUES(
  (SELECT id FROM vets WHERE name = 'William Tatcher'),
  (SELECT id FROM animal WHERE name = 'Blossom'),
  'Jan 11, 2021'
);