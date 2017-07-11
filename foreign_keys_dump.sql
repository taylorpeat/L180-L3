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

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE orders (
    id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE orders OWNER TO taylorpeat;

--
-- Name: orderd_id_seq; Type: SEQUENCE; Schema: public; Owner: taylorpeat
--

CREATE SEQUENCE orderd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orderd_id_seq OWNER TO taylorpeat;

--
-- Name: orderd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taylorpeat
--

ALTER SEQUENCE orderd_id_seq OWNED BY orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE products (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE products OWNER TO taylorpeat;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: taylorpeat
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_id_seq OWNER TO taylorpeat;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taylorpeat
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE reviews (
    id integer NOT NULL,
    product_id integer NOT NULL,
    review text NOT NULL
);


ALTER TABLE reviews OWNER TO taylorpeat;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: taylorpeat
--

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_id_seq OWNER TO taylorpeat;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taylorpeat
--

ALTER SEQUENCE reviews_id_seq OWNED BY reviews.id;


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orderd_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);


--
-- Name: orderd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taylorpeat
--

SELECT pg_catalog.setval('orderd_id_seq', 4, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

INSERT INTO orders VALUES (1, 1, 10);
INSERT INTO orders VALUES (2, 1, 25);
INSERT INTO orders VALUES (3, 2, 15);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

INSERT INTO products VALUES (1, 'small bolt');
INSERT INTO products VALUES (2, 'large bolt');


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taylorpeat
--

SELECT pg_catalog.setval('products_id_seq', 2, true);


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

INSERT INTO reviews VALUES (1, 1, 'a little small');
INSERT INTO reviews VALUES (2, 1, 'very round!');
INSERT INTO reviews VALUES (3, 2, 'could have been smaller');


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taylorpeat
--

SELECT pg_catalog.setval('reviews_id_seq', 3, true);


--
-- Name: orders orderd_pkey; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orderd_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: orders orders_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: reviews reviews_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);


--
-- PostgreSQL database dump complete
--

