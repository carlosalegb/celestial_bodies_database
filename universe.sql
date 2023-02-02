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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(15) NOT NULL,
    magnitude numeric(5,2),
    commun_name text,
    type character varying(15) NOT NULL,
    ra_2000 character varying(10)
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
    name character varying(20) NOT NULL,
    planet_id integer,
    diameter_in_km integer,
    orbital_period_in_days numeric(5,2)
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
    number_of_moons integer,
    rings boolean,
    star_id integer
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
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_id integer,
    constellation text,
    intelligent boolean
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    ra_2000 character varying(10),
    constellation character varying(30),
    galaxy_id integer
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
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'M31', 3.40, 'Andromeda Galaxy', 'Sb I-II', '00 42.7');
INSERT INTO public.galaxy VALUES (2, 'NGC 253', 7.30, 'Sculptor Galaxy', 'Sc p', '00 47.6');
INSERT INTO public.galaxy VALUES (3, 'NGC 292', 2.30, 'Small Magellanic Cloud', 'SBmp IV', '00 52.7');
INSERT INTO public.galaxy VALUES (4, 'NGC 300', 8.20, NULL, 'Sd III-IV', '00 54.9');
INSERT INTO public.galaxy VALUES (5, 'M33', 5.70, 'Triangulum Galaxy', 'Sc II-III', '01 33.9');
INSERT INTO public.galaxy VALUES (6, 'PGC 17223', 0.90, 'Large Magellanic Cloud', 'SB(s)m III-IV', '05 23.6');
INSERT INTO public.galaxy VALUES (7, 'M106', 8.40, NULL, 'Sb+p', '12 19.8');
INSERT INTO public.galaxy VALUES (8, 'M49', 8.30, NULL, 'E4', '12 29.8');
INSERT INTO public.galaxy VALUES (9, 'M104', 8.10, 'Sombrero Galaxy', 'Sb-', '12 40.0');
INSERT INTO public.galaxy VALUES (10, 'M94', 8.10, 'Black Eye Galaxy', 'Sb-p II:', '12 50.9');
INSERT INTO public.galaxy VALUES (11, 'Milky Way', -26.74, 'Milky Way', 'Spiral', NULL);
INSERT INTO public.galaxy VALUES (12, 'Kepler-186', NULL, 'Kepler-186', 'Red Dwarf', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3476, 27.32);
INSERT INTO public.moon VALUES (2, 'Ganymade', 5, 5276, 7.16);
INSERT INTO public.moon VALUES (3, 'Calliso', 5, 4800, 16.69);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3629, 1.77);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3126, 3.55);
INSERT INTO public.moon VALUES (6, 'Triton', 8, 2705, 5.88);
INSERT INTO public.moon VALUES (7, 'Prometeus', 8, 420, 1.12);
INSERT INTO public.moon VALUES (8, 'Tital', 6, 5150, 15.95);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1828, 4.52);
INSERT INTO public.moon VALUES (10, 'Ia petus', 6, 1436, 79.32);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 1120, 2.74);
INSERT INTO public.moon VALUES (12, 'Thetis', 6, 1060, 1.89);
INSERT INTO public.moon VALUES (15, 'Enceladus', 6, 498, 1.89);
INSERT INTO public.moon VALUES (16, 'Mimas', 6, 398, 0.94);
INSERT INTO public.moon VALUES (17, 'Hyperion', 6, 360, 21.28);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 1580, 8.71);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 1526, 13.46);
INSERT INTO public.moon VALUES (20, 'Umbriel', 7, 1190, 4.14);
INSERT INTO public.moon VALUES (21, 'Ariel', 7, 1160, 2.52);
INSERT INTO public.moon VALUES (22, 'Mirnada', 7, 472, 1.41);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 67, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, true, 1);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bb', NULL, NULL, 2);
INSERT INTO public.planet VALUES (10, 'HD 10180 b', NULL, NULL, 3);
INSERT INTO public.planet VALUES (11, 'Kepler-186 b', NULL, NULL, 7);
INSERT INTO public.planet VALUES (12, 'Gliese 667 Cc', NULL, NULL, 4);
INSERT INTO public.planet VALUES (13, 'Pandora', NULL, NULL, 2);
INSERT INTO public.planet VALUES (14, 'Vulcan', NULL, NULL, 8);
INSERT INTO public.planet VALUES (6, 'Saturn', 62, true, 1);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'Human', 1, 'Taurus', true);
INSERT INTO public.species VALUES (2, 'Na´vi', 2, 'Alpha Centauri', true);
INSERT INTO public.species VALUES (3, 'Vulcanian', 8, '40 Eridani', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 'Taurus', 11);
INSERT INTO public.star VALUES (3, 'HD 10180', '11 04.33', NULL, 11);
INSERT INTO public.star VALUES (4, 'Gliese 667', '17 45.57', 'Scorpius', 11);
INSERT INTO public.star VALUES (5, 'Sirius', '06 45.2', 'Canis Major', 11);
INSERT INTO public.star VALUES (6, 'Canopus', '06 23.9', 'Carina', 11);
INSERT INTO public.star VALUES (7, 'Kepler-186', NULL, NULL, 12);
INSERT INTO public.star VALUES (8, '40 Eridani A', NULL, 'Eridanus', 11);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', '14 39.36', 'Centaurus', 11);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: galaxy galaxy_ra_2000_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_ra_2000_key UNIQUE (ra_2000);


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
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


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
-- Name: species species_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

