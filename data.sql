/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', '2020-02-03', 10.23, true, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', '2018-11-15', 8, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', '2021-01-07', 15.04, false, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', '2017-5-12', 11, true, 5);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Charmander', '2020-02-08', -11, false, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Plantmon', '2021-11-15', -5.7, true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Squirtle', '1993-04-02', -12.13, false, 3);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Angemon', '2005-06-12', -45, true, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Boarmon', '2005-06-07', 20.4, true, 7);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Blossom', '1998-10-13', 17, true, 3);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Ditto', '2022-03-14', 22, true, 4);

INSERT INTO owners (full_name, age)
  VALUES  ('Sam Smith', 34),
          ('Jennifer Orwell', 19),
          ('Bob', 45),
          ('Melody Pond', 75),
          ('Dean Winchester', 14),
          ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES  ('Pokemon'), ('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE name NOT LIKE '%mon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name in ('Pikachu', 'Gabumon');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name in ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name in ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Winchester') WHERE name in ('Angemon', 'Boarmon');

INSERT INTO vets (name, age, date_of_graduation)
  VALUES  ('William Tatcher', 45, '2000-04-23'),
          ('Maisy Smith', 26, '2019-01-17'),
          ('Stephanie Mendez', 64, '1981-05-04'),
          ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vets_id, species_id)
  VALUES  ((SELECT id FROM vets WHERE name = 'William Tatcher'),
            (SELECT id FROM species WHERE name = 'Pokemon')),
          ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
            (SELECT id FROM species WHERE name = ('Pokemon'))),
          ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
            (SELECT id FROM species WHERE name = ('Digimon'))),
          ((SELECT id FROM vets WHERE name = 'Jack Harkness'),
            (SELECT id FROM species WHERE name = ('Digimon')));

INSERT INTO visits (animals_id, vets_id, date_of_visit)
  VALUES ((SELECT id FROM animals WHERE name = 'Agumon'),
          (SELECT id FROM vets WHERE name = 'William Tatcher'), ('May 24, 2020')),
        ((SELECT id FROM animals WHERE name = 'Agumon'),
          (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), ('Jul 22, 2020')),
        ((SELECT id FROM animals WHERE name = 'Gabumon'),
          (SELECT id FROM vets WHERE name = 'Jack Harkness'), ('Feb 2, 2021')),
        ((SELECT id FROM animals WHERE name = 'Pikachu'),
          (SELECT id FROM vets WHERE name = 'Maisy Smith'), ('Jan 5, 2020')),
        ((SELECT id FROM animals WHERE name = 'Pikachu'),
          (SELECT id FROM vets WHERE name = 'Maisy Smith'), ('March 8, 2020')),
        ((SELECT id FROM animals WHERE name = 'Pikachu'),
          (SELECT id FROM vets WHERE name = 'Maisy Smith'), ('May 14, 2020')),
        ((SELECT id FROM animals WHERE name = 'Devimon'),
          (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), ('May 4, 2021')),
        ((SELECT id FROM animals WHERE name = 'Charmander'),
          (SELECT id FROM vets WHERE name = 'Jack Harkness'),('Feb 24, 2021')),
        ((SELECT id FROM animals WHERE name = 'Plantmon'),
          (SELECT id FROM vets WHERE name = 'Maisy Smith'), ('Dec 21, 2019')),
        ((SELECT id FROM animals WHERE name = 'Plantmon'),
          (SELECT id FROM vets WHERE name = 'William Tatcher'),('Aug 10, 2020')),
        ((SELECT id FROM animals WHERE name = 'Plantmon'),
          (SELECT id FROM vets WHERE name = 'Maisy Smith'), ('Apr 7, 2021')),
        ((SELECT id FROM animals WHERE name = 'Squirtle'),
          (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), ('Sep 29, 2019')),
        ((SELECT id FROM animals WHERE name = 'Angemon'),
          (SELECT id FROM vets WHERE name = 'Jack Harkness'), ('Oct 3, 2020')),
        ((SELECT id FROM animals WHERE name = 'Angemon'),
          (SELECT id FROM vets WHERE name = 'Jack Harkness'), ('Nov 4, 2020')),
        ((SELECT id FROM animals WHERE name = 'Boarmon'),
          (SELECT id FROM vets WHERE name = 'Maisy Smith'), ('Jan 24, 2019')),
        ((SELECT id FROM animals WHERE name = 'Boarmon'),
          (SELECT id FROM vets WHERE name = 'Maisy Smith'), ('May 15, 2019')),
        ((SELECT id FROM animals WHERE name = 'Boarmon'),
          (SELECT id FROM vets WHERE name = 'Maisy Smith'), ('Feb 27, 2020')),
        ((SELECT id FROM animals WHERE name = 'Boarmon'),
          (SELECT id FROM vets WHERE name = 'Maisy Smith'), ('Aug 3, 2020')),
        ((SELECT id FROM animals WHERE name = 'Blossom'),
          (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), ('May 24, 2020')),
        ((SELECT id FROM animals WHERE name = 'Blossom'),
          (SELECT id FROM vets WHERE name = 'William Tatcher'),('Jan 11, 2021'));