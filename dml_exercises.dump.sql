--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
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
-- Name: devices; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE devices (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE devices OWNER TO taylorpeat;

--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: taylorpeat
--

CREATE SEQUENCE devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE devices_id_seq OWNER TO taylorpeat;

--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taylorpeat
--

ALTER SEQUENCE devices_id_seq OWNED BY devices.id;


--
-- Name: parts; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE parts (
    id integer NOT NULL,
    part_number integer NOT NULL,
    device_id integer
);


ALTER TABLE parts OWNER TO taylorpeat;

--
-- Name: parts_id_seq; Type: SEQUENCE; Schema: public; Owner: taylorpeat
--

CREATE SEQUENCE parts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parts_id_seq OWNER TO taylorpeat;

--
-- Name: parts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taylorpeat
--

ALTER SEQUENCE parts_id_seq OWNED BY parts.id;


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY devices ALTER COLUMN id SET DEFAULT nextval('devices_id_seq'::regclass);


--
-- Name: parts id; Type: DEFAULT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY parts ALTER COLUMN id SET DEFAULT nextval('parts_id_seq'::regclass);


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

INSERT INTO devices VALUES (2, 'Gyroscope', '2017-07-11 00:26:14.820262');
INSERT INTO devices VALUES (3, 'Magnetometer', '2017-07-11 02:32:25.944536');


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taylorpeat
--

SELECT pg_catalog.setval('devices_id_seq', 3, true);


--
-- Data for Name: parts; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

INSERT INTO parts VALUES (4, 5, 2);
INSERT INTO parts VALUES (5, 3, 2);
INSERT INTO parts VALUES (6, 15, 2);
INSERT INTO parts VALUES (7, 315, 2);
INSERT INTO parts VALUES (10, 234, NULL);
INSERT INTO parts VALUES (11, 2344, NULL);
INSERT INTO parts VALUES (12, 44, NULL);
INSERT INTO parts VALUES (13, 42, 3);


--
-- Name: parts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taylorpeat
--

SELECT pg_catalog.setval('parts_id_seq', 13, true);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: parts parts_part_number_key; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY parts
    ADD CONSTRAINT parts_part_number_key UNIQUE (part_number);


--
-- Name: parts parts_pkey; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (id);


--
-- Name: parts parts_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY parts
    ADD CONSTRAINT parts_device_id_fkey FOREIGN KEY (device_id) REFERENCES devices(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: taylorpeat
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM taylorpeat;
GRANT ALL ON SCHEMA public TO taylorpeat;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

