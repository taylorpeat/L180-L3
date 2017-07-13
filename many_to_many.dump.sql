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
-- Name: customers; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE customers (
    id integer NOT NULL,
    name text NOT NULL,
    payment_token character(8),
    CONSTRAINT customers_payment_token_check CHECK ((payment_token ~ '^[A-Z]{8}$'::text))
);


ALTER TABLE customers OWNER TO taylorpeat;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: taylorpeat
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_id_seq OWNER TO taylorpeat;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taylorpeat
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: customers_services; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE customers_services (
    customer_id integer,
    service_id integer
);


ALTER TABLE customers_services OWNER TO taylorpeat;

--
-- Name: services; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE services (
    id integer NOT NULL,
    description text NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE services OWNER TO taylorpeat;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: taylorpeat
--

CREATE SEQUENCE services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE services_id_seq OWNER TO taylorpeat;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taylorpeat
--

ALTER SEQUENCE services_id_seq OWNED BY services.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY services ALTER COLUMN id SET DEFAULT nextval('services_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

COPY customers (id, name, payment_token) FROM stdin;
1	Pat Johnson	XHGOAHEQ
2	Nancy Monreal	JKWQPJKL
3	Lynn Blake	KLZXWEEE
5	Scott Lakso	UUEAPQPS
6	Jim Pornot	XKJEYAZA
7	John Doe	EYODHLCN
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taylorpeat
--

SELECT pg_catalog.setval('customers_id_seq', 7, true);


--
-- Data for Name: customers_services; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

COPY customers_services (customer_id, service_id) FROM stdin;
1	1
1	2
1	3
3	1
3	2
3	3
3	4
3	5
5	1
5	2
5	6
6	1
6	6
7	1
7	2
7	3
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

COPY services (id, description, price) FROM stdin;
1	Unix Hosting	5.95
2	DNS	4.95
3	Whois Registration	1.95
4	High Bandwidth	15.00
5	Business Support	250.00
6	Dedicated Hosting	50.00
8	One-to-One Training	999.00
\.


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taylorpeat
--

SELECT pg_catalog.setval('services_id_seq', 8, true);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: customers_services customers_services_customer_id_services_id_key; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY customers_services
    ADD CONSTRAINT customers_services_customer_id_services_id_key UNIQUE (customer_id, service_id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: customers_services customers_services_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY customers_services
    ADD CONSTRAINT customers_services_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE;


--
-- Name: customers_services customers_services_services_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY customers_services
    ADD CONSTRAINT customers_services_services_id_fkey FOREIGN KEY (service_id) REFERENCES services(id);


--
-- PostgreSQL database dump complete
--

