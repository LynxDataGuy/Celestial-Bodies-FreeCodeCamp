CREATE TABLE moon (
    moon_id INT NOT NULL,
    planet_id INT NOT NULL,
    name VARCHAR(30) NOT NULL,
    moon_type VARCHAR(30),
    age_in_million_years NUMERIC,
    has_atmosphere BOOLEAN DEFAULT false
);