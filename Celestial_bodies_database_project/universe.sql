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
-- Name: description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.description (
    description_id integer NOT NULL,
    descriptions text NOT NULL,
    radius_km numeric(15,2) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.description OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.description_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.description_description_id_seq OWNER TO freecodecamp;

--
-- Name: description_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.description_description_id_seq OWNED BY public.description.description_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type text NOT NULL,
    recessional_velocity integer NOT NULL,
    radius_km numeric(15,2) NOT NULL,
    number_of_stars integer NOT NULL
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
    name character varying(50) NOT NULL,
    distance_from_earth_km numeric(15,2) NOT NULL,
    escape_velocity numeric(6,2) NOT NULL,
    rotation_period_hr numeric(6,2),
    planet_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    planet_type text NOT NULL,
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth_km numeric(15,2) NOT NULL,
    star_id integer NOT NULL
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
    name character varying(50) NOT NULL,
    apparent_magnitude integer NOT NULL,
    distance_from_earth_km numeric(15,2) NOT NULL,
    temperature_k integer NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: description description_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description ALTER COLUMN description_id SET DEFAULT nextval('public.description_description_id_seq'::regclass);


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
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.description VALUES (1, 'A barred spiral galaxy with billions of stars.', 94607.00, 'Milky Way');
INSERT INTO public.description VALUES (2, 'The closest spiral galaxy to the Milky Way.', 22000.00, 'Andromeda');
INSERT INTO public.description VALUES (3, 'A small spiral galaxy in the Local Group.', 15000.00, 'Triangulum');
INSERT INTO public.description VALUES (4, 'A giant elliptical galaxy with a supermassive black hole.', 30000.00, 'Messier 87');
INSERT INTO public.description VALUES (5, 'A classic grand-design spiral galaxy.', 110000.00, 'Whirlpool');
INSERT INTO public.description VALUES (6, 'A bright elliptical galaxy with a prominent dust lane.', 50000.00, 'Sombrero');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 2000, 94607.00, 300);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2500, 120000.00, 500);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 1900, 50000.00, 100);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 3000, 3000.00, 900);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 2800, 10000.00, 450);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Elliptical', 2700, 15000.00, 350);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 384400.00, 2.38, 27.32, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 9377.00, 0.03, 7.66, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460.00, 0.02, 30.30, 2);
INSERT INTO public.moon VALUES (4, 'Io', 421700.00, 2.56, 1.77, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 670900.00, 2.02, 3.55, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070400.00, 2.74, 7.15, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 1882700.00, 2.44, 16.69, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 1221870.00, 2.64, 15.94, 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', 238037.00, 0.24, 1.37, 4);
INSERT INTO public.moon VALUES (10, 'Miranda', 129390.00, 0.18, 1.41, 5);
INSERT INTO public.moon VALUES (11, 'Ariel', 191020.00, 0.56, 2.52, 5);
INSERT INTO public.moon VALUES (12, 'Umbriel', 266300.00, 0.42, 4.14, 5);
INSERT INTO public.moon VALUES (13, 'Triton', 354759.00, 1.45, 5.88, 6);
INSERT INTO public.moon VALUES (14, 'Charon', 19571.00, 0.58, 6.39, 6);
INSERT INTO public.moon VALUES (15, 'Kepler-1625b-I', 19200.00, 5.40, NULL, 6);
INSERT INTO public.moon VALUES (16, 'Gliese 581g-I', 1540.00, 4.80, NULL, 8);
INSERT INTO public.moon VALUES (17, 'TOI-700d-I', 11000.00, 3.70, NULL, 10);
INSERT INTO public.moon VALUES (18, '55 Cancri e-I', 135000.00, 2.90, NULL, 11);
INSERT INTO public.moon VALUES (19, 'TRAPPIST-1d-I', 124000.00, 2.50, NULL, 9);
INSERT INTO public.moon VALUES (20, 'LHS-1140b-I', 144000.00, 3.10, NULL, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', true, true, 149597870.00, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', true, false, 227943824.00, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', true, false, 778340821.00, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas Giant', true, false, 1426666422.00, 1);
INSERT INTO public.planet VALUES (5, 'Neptune', 'Ice Giant', true, false, 4498396441.00, 1);
INSERT INTO public.planet VALUES (6, 'Kepler-22b', 'Exoplanet', true, false, 6000000.00, 4);
INSERT INTO public.planet VALUES (7, 'HD 209458b', 'Exoplanet', true, false, 150000.00, 2);
INSERT INTO public.planet VALUES (8, 'Gliese 581c', 'Exoplanet', true, false, 20000.00, 5);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1e', 'Exoplanet', true, false, 40000.00, 6);
INSERT INTO public.planet VALUES (10, 'TOI 700 d', 'Exoplanet', true, false, 100000.00, 3);
INSERT INTO public.planet VALUES (11, '55 Cancri e', 'Exoplanet', true, false, 12000.00, 4);
INSERT INTO public.planet VALUES (12, 'LHS 1140 b', 'Exoplanet', true, false, 14000.00, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', -26, 14959.00, 5778, 1);
INSERT INTO public.star VALUES (2, 'Sirius', -1, 8178.00, 9940, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 0, 5657.00, 3500, 1);
INSERT INTO public.star VALUES (4, 'Vega', 1, 250000.00, 9602, 2);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 11, 4000.00, 3042, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 0, 8600.00, 12130, 3);


--
-- Name: description_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.description_description_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: description description_descriptions_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_descriptions_key UNIQUE (descriptions);


--
-- Name: description description_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_name_key UNIQUE (name);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (description_id);


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
-- Name: moon moon_distance_from_earth_km_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_distance_from_earth_km_key UNIQUE (distance_from_earth_km);


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

