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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size numeric NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    int_val_1 integer NOT NULL,
    int_val_2 integer NOT NULL,
    distance numeric(2,1) NOT NULL,
    description text NOT NULL,
    solar_system boolean NOT NULL,
    spiral boolean NOT NULL,
    number_of_stars integer
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
    int_val_1 integer NOT NULL,
    int_val_2 integer NOT NULL,
    distance numeric(2,1) NOT NULL,
    description text NOT NULL,
    solar_system boolean NOT NULL,
    spiral boolean NOT NULL,
    planet_id integer,
    size integer
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
    int_val_1 integer NOT NULL,
    int_val_2 integer NOT NULL,
    distance numeric(2,1) NOT NULL,
    description text NOT NULL,
    solar_system boolean NOT NULL,
    spiral boolean NOT NULL,
    star_id integer,
    size integer
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
    int_val_2 integer NOT NULL,
    int_val_1 integer NOT NULL,
    distance numeric(2,1) NOT NULL,
    description text NOT NULL,
    solar_system boolean NOT NULL,
    spiral boolean NOT NULL,
    galaxy_id integer,
    size integer
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, '1ES 2344+514', 1);
INSERT INTO public.black_hole VALUES (2, 'TON 618', 2);
INSERT INTO public.black_hole VALUES (3, '3C 371', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 1, 2, 0.0, 'home galaxy', true, false, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 2, 2.2, 'the closest big galaxy', false, false, NULL);
INSERT INTO public.galaxy VALUES (3, 'Antennae', 1, 2, 3.3, 'bizarre', false, false, NULL);
INSERT INTO public.galaxy VALUES (4, 'Backward', 1, 2, 2.2, 'rotates backwards', false, false, NULL);
INSERT INTO public.galaxy VALUES (5, 'Black eye', 1, 2, 3.3, 'has a spectacular dark band of absorbing dust in front of the galaxs bright nucleus', false, false, NULL);
INSERT INTO public.galaxy VALUES (6, 'Bodes', 1, 2, 2.2, 'named for Johann Elert Bode', false, false, NULL);
INSERT INTO public.galaxy VALUES (7, 'Butterfly', 1, 2, 3.3, 'looks are similar to a butterfly', false, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 1, 2, 3.3, 'famous earth companion', true, false, 1, NULL);
INSERT INTO public.moon VALUES (6, 'Phobos', 1, 2, 3.3, 'Phobos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (7, 'Deimos', 1, 2, 3.3, 'Deimos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (8, 'Phobos', 1, 2, 3.3, 'Phobos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (9, 'Deimos', 1, 2, 3.3, 'Deimos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (10, 'Phobos', 1, 2, 3.3, 'Phobos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (11, 'Deimos', 1, 2, 3.3, 'Deimos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (12, 'Phobos', 1, 2, 3.3, 'Phobos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (13, 'Deimos', 1, 2, 3.3, 'Deimos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (14, 'Phobos', 1, 2, 3.3, 'Phobos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (15, 'Deimos', 1, 2, 3.3, 'Deimos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (16, 'Phobos', 1, 2, 3.3, 'Phobos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (17, 'Deimos', 1, 2, 3.3, 'Deimos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (18, 'Phobos', 1, 2, 3.3, 'Phobos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (19, 'Deimos', 1, 2, 3.3, 'Deimos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (20, 'Phobos', 1, 2, 3.3, 'Phobos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (21, 'Deimos', 1, 2, 3.3, 'Deimos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (22, 'Phobos', 1, 2, 3.3, 'Phobos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (23, 'Deimos', 1, 2, 3.3, 'Deimos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (24, 'Phobos', 1, 2, 3.3, 'Phobos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (25, 'Deimos', 1, 2, 3.3, 'Deimos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (26, 'Phobos', 1, 2, 3.3, 'Phobos', true, false, 2, NULL);
INSERT INTO public.moon VALUES (27, 'Deimos', 1, 2, 3.3, 'Deimos', true, false, 2, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 2, 2.2, 'blue planet', true, false, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 2, 2.2, 'first planet', true, false, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 2, 3.3, 'second planet', true, false, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 2, 2.2, 'fourth planet', true, false, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, 3.3, 'fifth planet', true, false, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2, 2.2, 'sixth planet', true, false, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 2, 3.3, 'seventh planet', true, false, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 2, 2.2, 'eight planet', true, false, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 2, 3.3, 'ninth planet', true, false, 1, NULL);
INSERT INTO public.planet VALUES (10, 'Blue Ekzo Planet', 1, 2, 2.2, 'suitable for vacations', true, false, 1, NULL);
INSERT INTO public.planet VALUES (11, 'Red Ekzo Planet', 1, 2, 3.3, 'suitable for vacations', true, false, 1, NULL);
INSERT INTO public.planet VALUES (12, 'Green Ekzo Planet', 1, 2, 2.2, 'suitable for vacations', true, false, 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The sun', 2, 1, 0.0, 'solar system', true, false, 1, NULL);
INSERT INTO public.star VALUES (2, 'Vega', 2, 1, 2.2, 'Rapidly rotating pole-on star', false, false, 1, NULL);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 2, 1, 3.3, 'closest star to our sun', false, false, 1, NULL);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 2, 1, 2.2, 'centaurus constellation', false, false, 1, NULL);
INSERT INTO public.star VALUES (5, 'Barnards', 2, 1, 3.3, 'Ophiuchus constellation', false, false, 1, NULL);
INSERT INTO public.star VALUES (6, 'Luhman', 2, 1, 2.2, 'Carina constellation', false, false, 1, NULL);
INSERT INTO public.star VALUES (7, 'Wolf 359', 2, 1, 3.3, 'Leo constellation', false, false, 1, NULL);


--
-- Name: black_hole_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: black_hole black_hole_size_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_size_key UNIQUE (size);


--
-- Name: galaxy galaxy_number_of_stars_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_number_of_stars_key UNIQUE (number_of_stars);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_size_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_size_key UNIQUE (size);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_size_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_size_key UNIQUE (size);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_size_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_size_key UNIQUE (size);


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

