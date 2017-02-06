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
-- Name: follower; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE follower (
    id integer NOT NULL,
    login_user integer,
    follow integer
);


ALTER TABLE follower OWNER TO postgres;

--
-- Name: follower_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE follower_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE follower_id_seq OWNER TO postgres;

--
-- Name: follower_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE follower_id_seq OWNED BY follower.id;


--
-- Name: registeruser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE registeruser (
    id integer NOT NULL,
    username text,
    email text,
    password character varying,
    image text
);


ALTER TABLE registeruser OWNER TO postgres;

--
-- Name: registeruser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE registeruser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registeruser_id_seq OWNER TO postgres;

--
-- Name: registeruser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE registeruser_id_seq OWNED BY registeruser.id;


--
-- Name: tweet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tweet (
    id integer NOT NULL,
    tweettxt text,
    "like" integer,
    created_at timestamp with time zone,
    user_id integer,
    post_image text
);


ALTER TABLE tweet OWNER TO postgres;

--
-- Name: tweet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tweet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tweet_id_seq OWNER TO postgres;

--
-- Name: tweet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tweet_id_seq OWNED BY tweet.id;


--
-- Name: follower id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY follower ALTER COLUMN id SET DEFAULT nextval('follower_id_seq'::regclass);


--
-- Name: registeruser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registeruser ALTER COLUMN id SET DEFAULT nextval('registeruser_id_seq'::regclass);


--
-- Name: tweet id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tweet ALTER COLUMN id SET DEFAULT nextval('tweet_id_seq'::regclass);


--
-- Data for Name: follower; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY follower (id, login_user, follow) FROM stdin;
\.


--
-- Name: follower_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('follower_id_seq', 1, false);


--
-- Data for Name: registeruser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY registeruser (id, username, email, password, image) FROM stdin;
\.


--
-- Name: registeruser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('registeruser_id_seq', 1, false);


--
-- Data for Name: tweet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tweet (id, tweettxt, "like", created_at, user_id, post_image) FROM stdin;
\.


--
-- Name: tweet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tweet_id_seq', 1, false);


--
-- Name: follower follower_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY follower
    ADD CONSTRAINT follower_pkey PRIMARY KEY (id);


--
-- Name: registeruser registeruser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY registeruser
    ADD CONSTRAINT registeruser_pkey PRIMARY KEY (id);


--
-- Name: tweet tweet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tweet
    ADD CONSTRAINT tweet_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

