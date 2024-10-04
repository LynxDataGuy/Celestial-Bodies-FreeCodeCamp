--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    galaxy_type character varying(30),
    has_life boolean DEFAULT false,
    CONSTRAINT galaxy_age_in_million_years_check CHECK ((age_in_million_years >= 0))
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    moon_type character varying(30),
    age_in_million_years numeric,
    has_atmosphere boolean DEFAULT false
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_type character varying(30),
    age_in_million_years numeric,
    habitable boolean DEFAULT false
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon_relationship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon_relationship (
    planet_id integer NOT NULL,
    name character varying(30),
    planet_type character varying(30),
    planet_age numeric,
    moon_name character varying(30),
    moon_age integer,
    moon_type character varying(30),
    planet_moon_relationship_id integer NOT NULL
);


ALTER TABLE public.planet_moon_relationship OWNER TO freecodecamp;

--
-- Name: planet_moon_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_relationship_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_relationship_id_seq OWNED BY public.planet_moon_relationship.planet_moon_relationship_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    star_type character varying(30),
    supports_life boolean DEFAULT false,
    star_description text,
    CONSTRAINT star_age_in_million_years_check CHECK ((age_in_million_years >= 0))
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_moon_relationship planet_moon_relationship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_relationship ALTER COLUMN planet_moon_relationship_id SET DEFAULT nextval('public.planet_moon_relationship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 10000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 10000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 10000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 13000, 'Elliptical', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 'Natural Satellite', 4500, false);
INSERT INTO public.moon VALUES (2, 2, 'Alpheratz b I', 'Hypothetical', 200, false);
INSERT INTO public.moon VALUES (3, 3, 'B0830-00 b I', 'Hypothetical', 1000, false);
INSERT INTO public.moon VALUES (4, 4, 'M104-67 b I', 'Hypothetical', 10000, false);
INSERT INTO public.moon VALUES (5, 5, 'M51-3 b I', 'Hypothetical', 10000, false);
INSERT INTO public.moon VALUES (6, 6, 'M87 b I', 'Hypothetical', 13000, false);
INSERT INTO public.moon VALUES (7, 7, 'Kepler-186f I', 'Hypothetical', 4400, false);
INSERT INTO public.moon VALUES (8, 8, 'Proxima Centauri b I', 'Hypothetical', 4850, false);
INSERT INTO public.moon VALUES (9, 9, 'TRAPPIST-1e I', 'Hypothetical', 7600, false);
INSERT INTO public.moon VALUES (10, 10, 'LHS 1140 c I', 'Hypothetical', 6000, false);
INSERT INTO public.moon VALUES (11, 11, 'Phobos', 'Natural Satellite', 4500, false);
INSERT INTO public.moon VALUES (12, 12, 'Io', 'Natural Satellite', 4600, true);
INSERT INTO public.moon VALUES (13, 13, 'Titan', 'Natural Satellite', 4600, true);
INSERT INTO public.moon VALUES (15, 13, 'Ganymede', 'Natural Satellite', 4600, true);
INSERT INTO public.moon VALUES (16, 13, 'Deimos', 'Natural Satellite', 4500, false);
INSERT INTO public.moon VALUES (17, 14, 'Callisto', 'Natural Satellite', 4600, false);
INSERT INTO public.moon VALUES (18, 14, 'Europa', 'Natural Satellite', 4600, true);
INSERT INTO public.moon VALUES (19, 14, 'Amalthea', 'Natural Satellite', 4600, false);
INSERT INTO public.moon VALUES (20, 15, 'Enceladus', 'Natural Satellite', 4600, true);
INSERT INTO public.moon VALUES (21, 15, 'Rhea', 'Natural Satellite', 4600, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 'Terrestrial', 4600, true);
INSERT INTO public.planet VALUES (2, 2, 'Alpheratz b', 'Gas Giant', 200, false);
INSERT INTO public.planet VALUES (3, 3, 'B0830-00 b', 'Pulsar planet', 1000, false);
INSERT INTO public.planet VALUES (4, 4, 'M104-67 b', 'Gas Giant', 10000, false);
INSERT INTO public.planet VALUES (5, 5, 'M51-3 b', 'Rocky Exoplanet', 10000, true);
INSERT INTO public.planet VALUES (6, 6, 'M87 b', 'Giant Planet', 13000, false);
INSERT INTO public.planet VALUES (7, 7, 'Kepler-186f', 'Earth-sized exoplanet', 4400, true);
INSERT INTO public.planet VALUES (8, 8, 'Proxima Centauri b', 'Super-Earth', 4850, true);
INSERT INTO public.planet VALUES (9, 9, 'TRAPPIST-1e', 'Earth-sized exoplanet', 7600, true);
INSERT INTO public.planet VALUES (10, 10, 'LHS 1140 c', 'Super-Earth', 6000, true);
INSERT INTO public.planet VALUES (11, 1, 'Mercury', 'Terrestrial', 4600, false);
INSERT INTO public.planet VALUES (12, 1, 'Venus', 'Terrestrial', 4600, false);
INSERT INTO public.planet VALUES (13, 1, 'Mars', 'Terrestrial', 4500, false);
INSERT INTO public.planet VALUES (14, 1, 'Jupiter', 'Gas Giant', 4600, false);
INSERT INTO public.planet VALUES (15, 1, 'Saturn', 'Gas Giant', 4600, false);


--
-- Data for Name: planet_moon_relationship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon_relationship VALUES (1, 'Earth', 'Terrestrial', 4600, 'Moon', 4500, 'Natural Satellite', 1);
INSERT INTO public.planet_moon_relationship VALUES (2, 'Alpheratz b', 'Gas Giant', 200, 'Alpheratz b I', 200, 'Hypothetical', 2);
INSERT INTO public.planet_moon_relationship VALUES (3, 'B0830-00 b', 'Pulsar planet', 1000, 'B0830-00 b I', 1000, 'Hypothetical', 3);
INSERT INTO public.planet_moon_relationship VALUES (4, 'M104-67 b', 'Gas Giant', 10000, 'M104-67 b I', 10000, 'Hypothetical', 4);
INSERT INTO public.planet_moon_relationship VALUES (5, 'M51-3 b', 'Rocky Exoplanet', 10000, 'M51-3 b I', 10000, 'Hypothetical', 5);
INSERT INTO public.planet_moon_relationship VALUES (6, 'M87 b', 'Giant Planet', 13000, 'M87 b I', 13000, 'Hypothetical', 6);
INSERT INTO public.planet_moon_relationship VALUES (7, 'Kepler-186f', 'Earth-sized exoplanet', 4400, 'Kepler-186f I', 4400, 'Hypothetical', 7);
INSERT INTO public.planet_moon_relationship VALUES (8, 'Proxima Centauri b', 'Super-Earth', 4850, 'Proxima Centauri b I', 4850, 'Hypothetical', 8);
INSERT INTO public.planet_moon_relationship VALUES (9, 'TRAPPIST-1e', 'Earth-sized exoplanet', 7600, 'TRAPPIST-1e I', 7600, 'Hypothetical', 9);
INSERT INTO public.planet_moon_relationship VALUES (10, 'LHS 1140 c', 'Super-Earth', 6000, 'LHS 1140 c I', 6000, 'Hypothetical', 10);
INSERT INTO public.planet_moon_relationship VALUES (11, 'Mercury', 'Terrestrial', 4600, 'Phobos', 4500, 'Natural Satellite', 11);
INSERT INTO public.planet_moon_relationship VALUES (12, 'Venus', 'Terrestrial', 4600, 'Io', 4600, 'Natural Satellite', 12);
INSERT INTO public.planet_moon_relationship VALUES (13, 'Mars', 'Terrestrial', 4500, 'Titan', 4600, 'Natural Satellite', 13);
INSERT INTO public.planet_moon_relationship VALUES (13, 'Mars', 'Terrestrial', 4500, 'Ganymede', 4600, 'Natural Satellite', 14);
INSERT INTO public.planet_moon_relationship VALUES (13, 'Mars', 'Terrestrial', 4500, 'Deimos', 4500, 'Natural Satellite', 15);
INSERT INTO public.planet_moon_relationship VALUES (14, 'Jupiter', 'Gas Giant', 4600, 'Callisto', 4600, 'Natural Satellite', 16);
INSERT INTO public.planet_moon_relationship VALUES (14, 'Jupiter', 'Gas Giant', 4600, 'Europa', 4600, 'Natural Satellite', 17);
INSERT INTO public.planet_moon_relationship VALUES (14, 'Jupiter', 'Gas Giant', 4600, 'Amalthea', 4600, 'Natural Satellite', 18);
INSERT INTO public.planet_moon_relationship VALUES (15, 'Saturn', 'Gas Giant', 4600, 'Enceladus', 4600, 'Natural Satellite', 19);
INSERT INTO public.planet_moon_relationship VALUES (15, 'Saturn', 'Gas Giant', 4600, 'Rhea', 4600, 'Natural Satellite', 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 4600, 'G-Type', true, 'The Sun is the closest star to Earth and is vital for life on our planet.');
INSERT INTO public.star VALUES (2, 2, 'Alpheratz', 200, 'B-Type', false, 'Alpheratz is a bright star in the Andromeda Galaxy, known for its bluish hue.');
INSERT INTO public.star VALUES (3, 3, 'B0830+00', 1000, 'Pulsar', false, 'A pulsar that emits regular pulses of radio waves, located in the Triangulum Galaxy.');
INSERT INTO public.star VALUES (4, 4, 'M104-67', 10000, 'Spiral Galaxy', false, 'A star located in the Sombrero Galaxy, part of its stunning visual appearance.');
INSERT INTO public.star VALUES (5, 5, 'M51-3', 10000, 'Spiral Galaxy Star', false, 'A bright star in the Whirlpool Galaxy, contributing to the galaxy spiral arms.');
INSERT INTO public.star VALUES (6, 6, 'M87 Star', 13000, 'Giant', false, 'A prominent star located in the massive elliptical galaxy Messier 87, known for its black hole.');
INSERT INTO public.star VALUES (7, 1, 'Kepler-186', 4400, 'K-dwarf', true, 'A cooler and dimmer star than the Sun, located about 500 light-years away in the constellation Cygnus.');
INSERT INTO public.star VALUES (8, 1, 'Proxima Centauri', 4850, 'M-dwarf', true, 'The closest known star to the Sun, located about 4.24 light-years away. It is a red dwarf with a low luminosity and exhibits stellar activity.');
INSERT INTO public.star VALUES (9, 1, 'TRAPPIST-1', 7600, 'M-dwarf', true, 'A very cool and dim red dwarf located about 40 light-years away, hosting seven Earth-sized exoplanets, three in the habitable zone.');
INSERT INTO public.star VALUES (10, 1, 'LHS 1140', 6000, 'M-dwarf', true, 'A nearby red dwarf star located about 40 light-years away, cooler than the Sun, with a stable environment for its orbiting planets.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_moon_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_relationship_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_moon_relationship planet_moon_relationship_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_relationship
    ADD CONSTRAINT planet_moon_relationship_moon_name_key UNIQUE (moon_name);


--
-- Name: planet_moon_relationship planet_moon_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon_relationship
    ADD CONSTRAINT planet_moon_relationship_pkey PRIMARY KEY (planet_moon_relationship_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

