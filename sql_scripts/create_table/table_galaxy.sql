CREATE TABLE galaxy (
    galaxy_id INT PRIMARY KEY NOT NULL,
    name VARCHAR(30) UNIQUE NOT NULL,
    age_in_million_years INT,
    galaxy_type VARCHAR(30),
    has_life BOOLEAN DEFAULT false,
    CONSTRAINT galaxy_age_in_million_years_check CHECK ((age_in_million_years >= 0))
);