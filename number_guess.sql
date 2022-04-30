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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (2, 0, 0);
INSERT INTO public.games VALUES (3, 0, 0);
INSERT INTO public.games VALUES (4, 0, 0);
INSERT INTO public.games VALUES (5, 0, 0);
INSERT INTO public.games VALUES (6, 0, 0);
INSERT INTO public.games VALUES (7, 0, 0);
INSERT INTO public.games VALUES (8, 0, 0);
INSERT INTO public.games VALUES (9, 0, 0);
INSERT INTO public.games VALUES (10, 0, 0);
INSERT INTO public.games VALUES (11, 0, 0);
INSERT INTO public.games VALUES (12, 0, 0);
INSERT INTO public.games VALUES (13, 0, 0);
INSERT INTO public.games VALUES (14, 0, 0);
INSERT INTO public.games VALUES (15, 0, 0);
INSERT INTO public.games VALUES (16, 0, 0);
INSERT INTO public.games VALUES (17, 0, 0);
INSERT INTO public.games VALUES (18, 0, 0);
INSERT INTO public.games VALUES (19, 2, 0);
INSERT INTO public.games VALUES (20, 1, 2);
INSERT INTO public.games VALUES (22, 2, 92);
INSERT INTO public.games VALUES (21, 5, 8);
INSERT INTO public.games VALUES (1, 3, 2);
INSERT INTO public.games VALUES (24, 2, 54);
INSERT INTO public.games VALUES (23, 5, 75);
INSERT INTO public.games VALUES (26, 2, 20);
INSERT INTO public.games VALUES (25, 5, 239);
INSERT INTO public.games VALUES (28, 2, 316);
INSERT INTO public.games VALUES (27, 5, 101);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'test');
INSERT INTO public.users VALUES (2, 'test2');
INSERT INTO public.users VALUES (3, 'user_1651337454369');
INSERT INTO public.users VALUES (4, 'user_1651337454368');
INSERT INTO public.users VALUES (5, 'user_1651337517051');
INSERT INTO public.users VALUES (6, 'user_1651337517050');
INSERT INTO public.users VALUES (7, 'user_1651337591133');
INSERT INTO public.users VALUES (8, 'user_1651337591132');
INSERT INTO public.users VALUES (9, 'test3');
INSERT INTO public.users VALUES (10, 'test4');
INSERT INTO public.users VALUES (11, 'test5');
INSERT INTO public.users VALUES (12, 'user_1651337720329');
INSERT INTO public.users VALUES (13, 'user_1651337720328');
INSERT INTO public.users VALUES (14, 'test7');
INSERT INTO public.users VALUES (15, 'test8');
INSERT INTO public.users VALUES (16, 'test9');
INSERT INTO public.users VALUES (17, 'test10');
INSERT INTO public.users VALUES (18, 'test11');
INSERT INTO public.users VALUES (19, 'test1');
INSERT INTO public.users VALUES (20, 'test13');
INSERT INTO public.users VALUES (21, 'user_1651343019167');
INSERT INTO public.users VALUES (22, 'user_1651343019166');
INSERT INTO public.users VALUES (23, 'user_1651343301034');
INSERT INTO public.users VALUES (24, 'user_1651343301033');
INSERT INTO public.users VALUES (25, 'user_1651343337020');
INSERT INTO public.users VALUES (26, 'user_1651343337019');
INSERT INTO public.users VALUES (27, 'user_1651344593259');
INSERT INTO public.users VALUES (28, 'user_1651344593258');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 28, true);


--
-- Name: games games_user_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_key UNIQUE (user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

