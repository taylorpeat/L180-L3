--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: directors; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE directors (
    id integer NOT NULL,
    name text NOT NULL,
    CONSTRAINT valid_name CHECK (((length(name) >= 1) AND ("position"(name, ' '::text) > 0)))
);


ALTER TABLE directors OWNER TO taylorpeat;

--
-- Name: directors_id_seq; Type: SEQUENCE; Schema: public; Owner: taylorpeat
--

CREATE SEQUENCE directors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE directors_id_seq OWNER TO taylorpeat;

--
-- Name: directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taylorpeat
--

ALTER SEQUENCE directors_id_seq OWNED BY directors.id;


--
-- Name: films; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE films (
    title character varying(255) NOT NULL,
    year integer NOT NULL,
    genre character varying(100) NOT NULL,
    duration integer NOT NULL,
    id integer NOT NULL,
    CONSTRAINT title_length CHECK ((length((title)::text) >= 1)),
    CONSTRAINT year_range CHECK (((year >= 1900) AND (year <= 2100)))
);


ALTER TABLE films OWNER TO taylorpeat;

--
-- Name: films_directors; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE films_directors (
    film_id integer,
    director_id integer
);


ALTER TABLE films_directors OWNER TO taylorpeat;

--
-- Name: films_id_seq; Type: SEQUENCE; Schema: public; Owner: taylorpeat
--

CREATE SEQUENCE films_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE films_id_seq OWNER TO taylorpeat;

--
-- Name: films_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taylorpeat
--

ALTER SEQUENCE films_id_seq OWNED BY films.id;


--
-- Name: directors id; Type: DEFAULT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY directors ALTER COLUMN id SET DEFAULT nextval('directors_id_seq'::regclass);


--
-- Name: films id; Type: DEFAULT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY films ALTER COLUMN id SET DEFAULT nextval('films_id_seq'::regclass);


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

COPY directors (id, name) FROM stdin;
1	John McTiernan
2	Michael Curtiz
3	Francis Ford Coppola
4	Michael Anderson
5	Tomas Alfredson
6	Mike Nichols
7	Sidney Lumet
8	Penelope Spheeris
9	Joel Coen
10	Ethan Coen
11	Frank Miller
12	Roberto Rodriguez
\.


--
-- Name: directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taylorpeat
--

SELECT pg_catalog.setval('directors_id_seq', 12, true);


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

COPY films (title, year, genre, duration, id) FROM stdin;
Die Hard	1988	action	132	1
Casablanca	1942	drama	102	2
The Conversation	1974	thriller	113	3
1984	1956	scifi	90	4
Tinker Tailor Soldier Spy	2011	espionage	127	5
The Birdcage	1996	comedy	118	6
The Godfather	1972	crime	175	7
12 Angry Men	1957	drama	96	8
Wayne's World	1992	comedy	95	9
Let the Right One In	2008	horror	114	10
Fargo	1996	comedy	98	11
No Country for Old Men	2007	western	122	12
Sin City	2005	crime	124	13
Spy Kids	2001	scifi	88	14
\.


--
-- Data for Name: films_directors; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

COPY films_directors (film_id, director_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	3
8	7
9	8
10	4
11	9
12	9
12	10
13	11
13	12
14	12
\.


--
-- Name: films_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taylorpeat
--

SELECT pg_catalog.setval('films_id_seq', 14, true);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id);


--
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);


--
-- Name: films title_unique; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY films
    ADD CONSTRAINT title_unique UNIQUE (title);


--
-- Name: films_directors films_directors_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY films_directors
    ADD CONSTRAINT films_directors_director_id_fkey FOREIGN KEY (director_id) REFERENCES directors(id);


--
-- Name: films_directors films_directors_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY films_directors
    ADD CONSTRAINT films_directors_film_id_fkey FOREIGN KEY (film_id) REFERENCES films(id);


--
-- PostgreSQL database dump complete
--

