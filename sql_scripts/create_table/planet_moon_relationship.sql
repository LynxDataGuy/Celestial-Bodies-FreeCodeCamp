CREATE TABLE planet_moon_relationship (
    planet_id INT NOT NULL,
    name VARCHAR(30),
    planet_type VARCHAR(30),
    planet_age numeric,
    moon_name VARCHAR(30),
    moon_age INT,
    moon_type VARCHAR(30),
    planet_moon_relationship_id INT PRIMARY KEY NOT NULL
);
