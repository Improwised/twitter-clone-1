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
-- Name: follower; Type: TABLE; Schema: public; Owner: jatin
--

CREATE TABLE follower (
    id integer NOT NULL,
    login_user integer,
    follow integer
);


ALTER TABLE follower OWNER TO jatin;

--
-- Name: follower_id_seq; Type: SEQUENCE; Schema: public; Owner: jatin
--

CREATE SEQUENCE follower_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE follower_id_seq OWNER TO jatin;

--
-- Name: follower_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jatin
--

ALTER SEQUENCE follower_id_seq OWNED BY follower.id;


--
-- Name: registeruser; Type: TABLE; Schema: public; Owner: jatin
--

CREATE TABLE registeruser (
    id integer NOT NULL,
    username text,
    password character varying,
    email text,
    image text
);


ALTER TABLE registeruser OWNER TO jatin;

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

ALTER SEQUENCE register_user_id_seq OWNED BY registeruser.id;


--
-- Name: tweet; Type: TABLE; Schema: public; Owner: jatin
--

CREATE TABLE tweet (
    id integer NOT NULL,
    tweettxt text,
    "like" integer,
    created_at timestamp with time zone DEFAULT now(),
    user_id integer,
    post_image text
);


ALTER TABLE tweet OWNER TO jatin;

--
-- Name: untitled_table_id_seq; Type: SEQUENCE; Schema: public; Owner: jatin
--

CREATE SEQUENCE untitled_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE untitled_table_id_seq OWNER TO jatin;

--
-- Name: untitled_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jatin
--

ALTER SEQUENCE untitled_table_id_seq OWNED BY tweet.id;


--
-- Name: follower id; Type: DEFAULT; Schema: public; Owner: jatin
--

ALTER TABLE ONLY follower ALTER COLUMN id SET DEFAULT nextval('follower_id_seq'::regclass);


--
-- Name: registeruser id; Type: DEFAULT; Schema: public; Owner: jatin
--

ALTER TABLE ONLY registeruser ALTER COLUMN id SET DEFAULT nextval('register_user_id_seq'::regclass);


--
-- Name: tweet id; Type: DEFAULT; Schema: public; Owner: jatin
--

ALTER TABLE ONLY tweet ALTER COLUMN id SET DEFAULT nextval('untitled_table_id_seq'::regclass);


--
-- Data for Name: follower; Type: TABLE DATA; Schema: public; Owner: jatin
--

COPY follower (id, login_user, follow) FROM stdin;
\.


--
-- Name: follower_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jatin
--

SELECT pg_catalog.setval('follower_id_seq', 152, true);


--
-- Name: register_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jatin
--

SELECT pg_catalog.setval('register_user_id_seq', 67, true);


--
-- Data for Name: registeruser; Type: TABLE DATA; Schema: public; Owner: jatin
--

COPY registeruser (id, username, password, email, image) FROM stdin;
\.


--
-- Data for Name: tweet; Type: TABLE DATA; Schema: public; Owner: jatin
--

COPY tweet (id, tweettxt, "like", created_at, user_id, post_image) FROM stdin;
\.


--
-- Name: untitled_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jatin
--

SELECT pg_catalog.setval('untitled_table_id_seq', 248, true);


--
-- Name: follower follower_pkey; Type: CONSTRAINT; Schema: public; Owner: jatin
--

ALTER TABLE ONLY follower
    ADD CONSTRAINT follower_pkey PRIMARY KEY (id);


--
-- Name: registeruser register_user_pkey; Type: CONSTRAINT; Schema: public; Owner: jatin
--

ALTER TABLE ONLY registeruser
    ADD CONSTRAINT register_user_pkey PRIMARY KEY (id);


--
-- Name: tweet untitled_table_pkey; Type: CONSTRAINT; Schema: public; Owner: jatin
--

ALTER TABLE ONLY tweet
    ADD CONSTRAINT untitled_table_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

