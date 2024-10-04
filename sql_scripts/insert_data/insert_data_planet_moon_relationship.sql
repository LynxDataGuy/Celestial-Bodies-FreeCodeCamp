INSERT INTO planet_moon_relationship 
(
planet_id,
name, 
planet_type, 
planet_age, 
moon_name, 
moon_age, 
moon_type)


SELECT 
p.planet_id AS "planet_id",
p.name AS "name",
p.planet_type AS "planet_type",
p.age_in_million_years AS "planet_age",
m.moon_name,
m.age_in_million_years AS "moon_age",
m.moon_type 
FROM planet p
LEFT JOIN moon m 
ON p.planet_id = m.planet_id
;