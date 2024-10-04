CREATE TABLE planet (
    planet_id SERIAL NOT NULL PRIMARY KEY,
    star_id INT NOT NULL,
    FOREIGN KEY(star_id) REFERENCES star(star_id), 
    planet_name VARCHAR(30) UNIQUE NOT NULL,
    planet_type VARCHAR(30),
    age_in_million_years NUMERIC, 
    habitable BOOLEAN DEFAULT FALSE
);