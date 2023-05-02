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
    name character varying(20) NOT NULL,
    cluster character varying(15),
    type character varying(15),
    size_in_parsecs numeric(3,1)
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
    name character varying(15) NOT NULL,
    empire character varying(15),
    populated boolean,
    rating integer,
    planet_id integer,
    notes text
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
    name character varying(15) NOT NULL,
    empire character varying(15),
    populated boolean,
    rating integer,
    notes text,
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
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying(15) NOT NULL,
    empire character varying(15),
    notes text,
    galaxy_id integer
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_space_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_space_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_space_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(15) NOT NULL,
    empire character varying(15),
    mass numeric(3,2),
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
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_space_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Yeats', 'Manwe', 'Elliptical', 45.2);
INSERT INTO public.galaxy VALUES (2, 'Spenser', 'Manwe', 'Irregular', 87.5);
INSERT INTO public.galaxy VALUES (3, 'Chaucer', 'Manwe', 'Elliptical', 27.9);
INSERT INTO public.galaxy VALUES (4, 'Shakespeare', 'Manwe', 'Spiral', 33.9);
INSERT INTO public.galaxy VALUES (5, 'Ovid', 'Melkor', 'Spiral', 5.4);
INSERT INTO public.galaxy VALUES (6, 'Coleridge', 'Melkor', 'Elliptical', 60.3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Sabaneyev', '', true, 4, 2, 'Independent moon, home of the Newt tribe');
INSERT INTO public.moon VALUES (2, 'Feinberg', '', false, 8, 2, 'Not a lot here, but it is pretty');
INSERT INTO public.moon VALUES (3, 'Bax', 'Cow', true, 8, 3, 'The north is fantastic, avoid the south');
INSERT INTO public.moon VALUES (4, 'Bliss', '', false, 4, 3, 'The red berries are edible');
INSERT INTO public.moon VALUES (5, 'Balakirev', 'Ant', true, 3, 4, 'Why doesnt my compass work?');
INSERT INTO public.moon VALUES (6, 'Borodin', 'Ant', true, 6, 4, 'Smells of oranges');
INSERT INTO public.moon VALUES (7, 'Mussorgsky', '', false, 1, 4, 'Cold and wet');
INSERT INTO public.moon VALUES (8, 'Telemann', '', false, 5, 5, 'Pretty but home to ferocious beasts that render it uninhabitable');
INSERT INTO public.moon VALUES (9, 'Corelli', 'Badger', true, 2, 5, 'Dull urban wasteland filled with dull urban people');
INSERT INTO public.moon VALUES (10, 'Grieg', 'Badger', true, 1, 6, 'Mining colony');
INSERT INTO public.moon VALUES (11, 'Ravel', '', false, 0, 7, 'Chunk of bare rock');
INSERT INTO public.moon VALUES (12, 'Enescu', '', true, 2, 7, 'Slum');
INSERT INTO public.moon VALUES (13, 'Czerny', '', false, 2, 8, 'Nothing to see here');
INSERT INTO public.moon VALUES (14, 'Hummel', '', true, 3, 8, 'Populated by humanoid elephants');
INSERT INTO public.moon VALUES (15, 'Ries', '', false, 7, 8, 'Jungle, no intelligent life');
INSERT INTO public.moon VALUES (16, 'Gernsheim', 'Owl', true, 8, 9, 'They make nice hats here');
INSERT INTO public.moon VALUES (17, 'Dohnanyi', 'Owl', true, 3, 9, 'Weirdos');
INSERT INTO public.moon VALUES (18, 'Taneyev', '', false, NULL, 9, 'Mostly harmless');
INSERT INTO public.moon VALUES (19, 'Wagner', 'Vole', true, 4, 10, 'Giant Butlins');
INSERT INTO public.moon VALUES (20, 'Draeseke', 'Dormouse', true, 5, 10, 'One moon hardly constitutes an empire, but oh well');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Albinoni', 'Squirrel', true, 5, 'Mining colonies providing Squirrel empire with Titanium and Phosphorus', 1);
INSERT INTO public.planet VALUES (2, 'Scriabin', 'Squirrel', true, 8, 'Main homeland of the Squirrel people', 1);
INSERT INTO public.planet VALUES (3, 'Stanford', 'Horse', true, 8, 'Low gravity, bring a heavy coat', 2);
INSERT INTO public.planet VALUES (4, 'Rimsky_korsakov', 'Dog', true, 7, 'Dont drink the water', 3);
INSERT INTO public.planet VALUES (5, 'Bach', 'Badger', true, 9, 'Home planet of the Badgers, cultural hub of the Shakespeare galaxy', 4);
INSERT INTO public.planet VALUES (6, 'Chopin', 'Woodpecker', true, 4, 'Former colony of the Badger empire', 4);
INSERT INTO public.planet VALUES (7, 'Debussy', '', false, 9, 'Made of candyfloss', 5);
INSERT INTO public.planet VALUES (8, 'Beethoven', '', true, 8, 'Lovely quaint civilization, nice architecture', 6);
INSERT INTO public.planet VALUES (9, 'Brahms', 'Owl', true, 10, 'Like Earth, only without them', 7);
INSERT INTO public.planet VALUES (10, 'Liszt', 'Vole', true, 7, 'Home of the flying donkey', 7);
INSERT INTO public.planet VALUES (11, 'Prokofiev', NULL, false, NULL, NULL, 2);
INSERT INTO public.planet VALUES (12, 'Reger', NULL, false, NULL, NULL, 5);


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES (1, 'Deep Space 1', 'Independent', 'A hive of scum and villainy', 2);
INSERT INTO public.space_station VALUES (2, 'Enterprise', 'Independent', 'Overpriced shopping center', 4);
INSERT INTO public.space_station VALUES (3, 'Voyager', 'Independent', 'Why is it called Voyager when it doesnt move?', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Frodo', 'Squirrel', 2.53, 1);
INSERT INTO public.star VALUES (2, 'Samwise', 'Contested', 0.87, 1);
INSERT INTO public.star VALUES (3, 'Gandalf', 'Contested', 8.70, 3);
INSERT INTO public.star VALUES (4, 'Aragorn', 'Contested', 1.27, 4);
INSERT INTO public.star VALUES (5, 'Boromir', 'Weasel', 3.14, 4);
INSERT INTO public.star VALUES (6, 'Legolas', '', 9.52, 5);
INSERT INTO public.star VALUES (7, 'Gimli', 'Contested', 1.62, 6);


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
-- Name: space_station_space_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_space_station_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: space_station space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_name_key UNIQUE (name);


--
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


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
-- Name: space_station space_station_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

