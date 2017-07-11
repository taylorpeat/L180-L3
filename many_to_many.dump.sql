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

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: taylorpeat
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_id_seq OWNER TO taylorpeat;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: books; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE books (
    id integer DEFAULT nextval('books_id_seq'::regclass) NOT NULL,
    title text NOT NULL,
    author character varying(32) NOT NULL
);


ALTER TABLE books OWNER TO taylorpeat;

--
-- Name: books_categories; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE books_categories (
    book_id integer,
    category_id integer
);


ALTER TABLE books_categories OWNER TO taylorpeat;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: taylorpeat
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO taylorpeat;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: taylorpeat
--

CREATE TABLE categories (
    id integer DEFAULT nextval('categories_id_seq'::regclass) NOT NULL,
    name character varying(32) NOT NULL
);


ALTER TABLE categories OWNER TO taylorpeat;

--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

COPY books (id, title, author) FROM stdin;
1	A Tale of Two Cities	Charles Dickens
2	Harry Potter	J. K. Rowling
3	Einstein: His Life and Universe	Walter Isaacson
4	Sally Ride: America's First Woman in Space	Lynn Sherr
5	Jane Eyre	Charlotte Bronte
6	Vij's: Elegant and Inspired Indian Cuisine	Meeru Dhalwala and Vikram Vij
\.


--
-- Data for Name: books_categories; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

COPY books_categories (book_id, category_id) FROM stdin;
1	2
1	4
2	2
2	3
3	1
3	5
3	6
4	5
4	1
4	7
5	2
5	4
6	8
6	1
6	9
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taylorpeat
--

SELECT pg_catalog.setval('books_id_seq', 6, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: taylorpeat
--

COPY categories (id, name) FROM stdin;
1	Nonfiction
2	Fiction
3	Fantasy
4	Classics
5	Biography
6	Physics
7	Space Exploration
8	Cookbook
9	South Asia
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taylorpeat
--

SELECT pg_catalog.setval('categories_id_seq', 9, true);


--
-- Name: books_categories books_categories_book_id_category_id_key; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY books_categories
    ADD CONSTRAINT books_categories_book_id_category_id_key UNIQUE (book_id, category_id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: books_categories books_categories_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY books_categories
    ADD CONSTRAINT books_categories_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(id);


--
-- Name: books_categories books_categories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: taylorpeat
--

ALTER TABLE ONLY books_categories
    ADD CONSTRAINT books_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES categories(id);


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

