CREATE TABLE star (
    star_id INT NOT NULL,
    galaxy_id INT,
    name VARCHAR(30) NOT NULL,
    age_in_million_years INT,
    star_type VARCHAR(30),
    supports_life BOOLEAN DEFAULT false,
    star_description TEXT,
    CONSTRAINT star_age_in_million_years_check CHECK ((age_in_million_years >= 0))
);