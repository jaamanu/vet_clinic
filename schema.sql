/* Database schema to keep the structure of entire database. */

CREATE TABLE animal (
id INT PRIMARY KEY NOT NULL,
name VARCHAR(50),
date_of_birth date,
escape_attempts INT,
neutered bool,
weight_kg decimal );
