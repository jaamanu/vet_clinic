/* Database schema to keep the structure of entire database. */

CREATE TABLE animal (
  id INT NOT NULL PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOL,
  weight_kg DECIMAL, 
);
ALTER TABLE animal
ADD species VARCHAR(100);
