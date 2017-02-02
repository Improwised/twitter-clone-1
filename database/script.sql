--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

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
-- Name: register_user; Type: TABLE; Schema: public; Owner: jatin
--

CREATE TABLE register_user (
    id integer NOT NULL,
    username text,
    password character varying NOT NULL,
    email text NOT NULL
);


ALTER TABLE register_user OWNER TO jatin;

--
-- Name: register_user_id_seq; Type: SEQUENCE; Schema: public; Owner: jatin
--

CREATE SEQUENCE register_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE register_user_id_seq OWNER TO jatin;

--
-- Name: register_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jatin
--

ALTER SEQUENCE register_user_id_seq OWNED BY register_user.id;


--
-- Name: register_user id; Type: DEFAULT; Schema: public; Owner: jatin
--

ALTER TABLE ONLY register_user ALTER COLUMN id SET DEFAULT nextval('register_user_id_seq'::regclass);


--
-- Data for Name: register_user; Type: TABLE DATA; Schema: public; Owner: jatin
--

COPY register_user (id, username, password, email) FROM stdin;
\.


--
-- Name: register_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jatin
--

SELECT pg_catalog.setval('register_user_id_seq', 1, false);


--
-- Name: register_user register_user_pkey; Type: CONSTRAINT; Schema: public; Owner: jatin
--

ALTER TABLE ONLY register_user
    ADD CONSTRAINT register_user_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

