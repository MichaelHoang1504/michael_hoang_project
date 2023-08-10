--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: eng; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.eng (
    name character varying(30) NOT NULL,
    experience_year numeric(2,1),
    country character varying(30),
    eng_id integer NOT NULL
);


ALTER TABLE public.eng OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    description character varying(300),
    constellation character varying(30),
    designations character varying(30),
    size_ly integer,
    eng_id integer
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
-- Name: group_of_engineer_eng_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.group_of_engineer_eng_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_of_engineer_eng_id_seq OWNER TO freecodecamp;

--
-- Name: group_of_engineer_eng_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.group_of_engineer_eng_id_seq OWNED BY public.eng.eng_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    radius_km double precision,
    distance_ly numeric(4,2),
    eng_id integer
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
    name character varying(30) NOT NULL,
    eng_id integer,
    star_id integer,
    radius_km integer,
    distance_ly numeric(4,2),
    have_moon boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    spectral_type text,
    distance_ly numeric(4,2),
    have_planets boolean,
    eng_id integer
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
-- Name: eng eng_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.eng ALTER COLUMN eng_id SET DEFAULT nextval('public.group_of_engineer_eng_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: eng; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.eng VALUES ('Lippershey', 8.5, 'GERMANY', 1);
INSERT INTO public.eng VALUES ('Maestlin', 6.8, 'GERMANY', 2);
INSERT INTO public.eng VALUES ('US_Naval', 9.5, 'USA', 3);
INSERT INTO public.eng VALUES ('Smyth', 8.0, 'SCOTLAND', 4);
INSERT INTO public.eng VALUES ('Jansky', 4.5, 'USA', 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'barred_spiral', 'daughter of the king', 'Andromeda', 'M31', 528, 1);
INSERT INTO public.galaxy VALUES (2, 'Antennae', 'barred_spiral', 'dual galaxy', 'corvus', 'NGC4038', 1100, 1);
INSERT INTO public.galaxy VALUES (3, 'Backward', 'elliptical', 'rotate opposite direction', 'Centaurus', 'NGC4622', 4850, 5);
INSERT INTO public.galaxy VALUES (4, 'Black eye', 'irregular', 'look like an eye', 'Coma Berenices', 'M64', 1680, 5);
INSERT INTO public.galaxy VALUES (5, 'Bode', 'irregular', 'name of the founder', 'Ursa Major', 'M81', 7000, 4);
INSERT INTO public.galaxy VALUES (6, 'BUTTERFLY', 'elliptical', 'binary galaxies', 'Virgo', 'NGC4567', 2500, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 34, 28.00, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, 18.00, 2);
INSERT INTO public.moon VALUES (3, 'Delimos', 2, 6, 18.00, 4);
INSERT INTO public.moon VALUES (4, 'Io', 5, 18, 16.00, 2);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 15, 16.00, 2);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 26, 16.00, 1);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 24, 16.00, 1);
INSERT INTO public.moon VALUES (8, 'Alalthea', 5, 83, 19.00, 2);
INSERT INTO public.moon VALUES (9, 'Metis', 5, 43, 19.00, 2);
INSERT INTO public.moon VALUES (10, 'Adrasthea', 5, 16, 19.00, 2);
INSERT INTO public.moon VALUES (11, 'Thebe', 5, 98, 19.00, 1);
INSERT INTO public.moon VALUES (12, 'Leda', 5, 21, 19.00, 2);
INSERT INTO public.moon VALUES (13, 'Triton', 6, 13, 18.00, 1);
INSERT INTO public.moon VALUES (14, 'Nereid', 6, 17, 19.00, 2);
INSERT INTO public.moon VALUES (15, 'Galatea', 6, 87, 19.00, 1);
INSERT INTO public.moon VALUES (16, 'Despina', 6, 75, 19.00, 2);
INSERT INTO public.moon VALUES (17, 'Titan', 7, 24, 19.00, 1);
INSERT INTO public.moon VALUES (18, 'Enceladus', 7, 50, 17.00, 1);
INSERT INTO public.moon VALUES (19, 'Mimas', 7, 17, 19.00, 2);
INSERT INTO public.moon VALUES (20, 'Miranda', 9, 50, 19.00, 1);
INSERT INTO public.moon VALUES (21, 'KOI', 15, NULL, 20.00, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 2, 1, 12, NULL, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 1, 67, 16.00, true);
INSERT INTO public.planet VALUES (3, 'Mercury', 1, 1, 48, 16.00, false);
INSERT INTO public.planet VALUES (4, 'Venus', 1, 1, 12, 16.00, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 1, 13, 16.00, true);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 1, 48, 18.00, true);
INSERT INTO public.planet VALUES (7, 'Saturn', 1, 1, 58, 16.00, true);
INSERT INTO public.planet VALUES (8, 'Pluto', 1, 1, 11, 19.00, true);
INSERT INTO public.planet VALUES (9, 'Uranus', 1, 1, 25, 17.00, true);
INSERT INTO public.planet VALUES (10, 'kepler', 3, 2, 67, 20.00, NULL);
INSERT INTO public.planet VALUES (11, 'Gliese', 2, 3, 28, 20.00, NULL);
INSERT INTO public.planet VALUES (12, 'Pegasi', 2, 6, 13, 19.00, false);
INSERT INTO public.planet VALUES (13, 'L 98-59', 2, 9, 31, 20.00, NULL);
INSERT INTO public.planet VALUES (14, 'Bocaprins', 4, 12, 16, 20.00, NULL);
INSERT INTO public.planet VALUES (15, 'KOI', 3, 13, 11, 20.00, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 45.00, true, 4);
INSERT INTO public.star VALUES (2, 'kepler-1649', 1, 'M5V', 20.00, true, 4);
INSERT INTO public.star VALUES (3, 'Gliese 163', 5, 'M3V', 12.00, true, 3);
INSERT INTO public.star VALUES (4, 'Alpha-andromedae', 2, 'A3V', 19.00, false, 3);
INSERT INTO public.star VALUES (5, 'Mirach', 2, 'M0III', 15.00, false, 5);
INSERT INTO public.star VALUES (6, '51-pegasi', 2, 'B-type', NULL, false, 3);
INSERT INTO public.star VALUES (7, 'Delta-centauri', 3, 'B-type', NULL, false, 3);
INSERT INTO public.star VALUES (8, 'Canis-major', 4, 'DA2', 20.00, NULL, 4);
INSERT INTO public.star VALUES (9, 'L 98-59', 3, 'M3V', 20.00, true, 3);
INSERT INTO public.star VALUES (10, 'Antares', 1, 'B2.5V', 18.00, false, 3);
INSERT INTO public.star VALUES (11, 'Mu_Cephei', 1, 'M2', 18.00, false, 5);
INSERT INTO public.star VALUES (12, 'WASP-39', 1, 'G8', 11.00, true, 4);
INSERT INTO public.star VALUES (13, 'VEPA', 2, 'A0V', 20.00, true, 4);
INSERT INTO public.star VALUES (14, 'KOI', 1, 'A0Va', 20.00, true, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: group_of_engineer_eng_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.group_of_engineer_eng_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: eng group_of_engineer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.eng
    ADD CONSTRAINT group_of_engineer_name_key UNIQUE (name);


--
-- Name: eng group_of_engineer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.eng
    ADD CONSTRAINT group_of_engineer_pkey PRIMARY KEY (eng_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_eng_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_eng_id_fkey FOREIGN KEY (eng_id) REFERENCES public.eng(eng_id);


--
-- Name: moon moon_eng_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_eng_id_fkey FOREIGN KEY (eng_id) REFERENCES public.eng(eng_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_eng_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_eng_id_fkey FOREIGN KEY (eng_id) REFERENCES public.eng(eng_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_eng_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_eng_id_fkey FOREIGN KEY (eng_id) REFERENCES public.eng(eng_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

