--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-03-18 00:47:26

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 24770)
-- Name: categoriesanimal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoriesanimal (
    id integer NOT NULL,
    nomcategorie text
);


ALTER TABLE public.categoriesanimal OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24775)
-- Name: CategoriesAnimal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categoriesanimal ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."CategoriesAnimal_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 24776)
-- Name: especeanimal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especeanimal (
    id integer NOT NULL,
    poidsmoyen integer NOT NULL,
    taille integer,
    image text,
    nomespece text,
    couleur text
);


ALTER TABLE public.especeanimal OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24781)
-- Name: EspeceAnimal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.especeanimal ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."EspeceAnimal_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 213 (class 1259 OID 24782)
-- Name: photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.photos (
    id integer NOT NULL,
    idespeceanimal integer NOT NULL,
    iso integer,
    lienfichier text,
    description text,
    camera text,
    objectif text,
    ouverture text,
    vitesse text,
    longitude numeric,
    latitude numeric,
    idsortie integer
);


ALTER TABLE public.photos OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 24787)
-- Name: Photos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.photos ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Photos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 24788)
-- Name: sorties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sorties (
    id integer NOT NULL,
    idutilisateur text NOT NULL,
    date date NOT NULL,
    description text,
    longitude numeric,
    latitude numeric,
    prive boolean NOT NULL
);


ALTER TABLE public.sorties OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24793)
-- Name: Sorties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.sorties ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Sorties_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 24794)
-- Name: associationcategorieespece; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.associationcategorieespece (
    idcategorie integer NOT NULL,
    idespece integer NOT NULL
);


ALTER TABLE public.associationcategorieespece OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24797)
-- Name: associationespecesortie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.associationespecesortie (
    idsortie integer NOT NULL,
    idespece integer NOT NULL
);


ALTER TABLE public.associationespecesortie OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24800)
-- Name: utilisateurs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateurs (
    id text NOT NULL,
    isadmin boolean NOT NULL,
    email text NOT NULL,
    pseudo text NOT NULL
);


ALTER TABLE public.utilisateurs OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24805)
-- Name: utilisateurs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilisateurs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilisateurs_id_seq OWNER TO postgres;

--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 220
-- Name: utilisateurs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilisateurs_id_seq OWNED BY public.utilisateurs.id;


--
-- TOC entry 3359 (class 0 OID 24794)
-- Dependencies: 217
-- Data for Name: associationcategorieespece; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (3, 4);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (4, 4);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (5, 4);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (2, 6);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (5, 6);


--
-- TOC entry 3360 (class 0 OID 24797)
-- Dependencies: 218
-- Data for Name: associationespecesortie; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3351 (class 0 OID 24770)
-- Dependencies: 209
-- Data for Name: categoriesanimal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (3, 'poisson');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (4, 'insecte');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (5, 'reptile');


--
-- TOC entry 3353 (class 0 OID 24776)
-- Dependencies: 211
-- Data for Name: especeanimal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (2, 150, 250, 'la giraffe', 'giraffe', 'jaune et noire');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (4, 14, 50, './45485', 'chat', 'noir et blanc');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (6, 1, 10, './48542', 'lézar', 'vertc');


--
-- TOC entry 3355 (class 0 OID 24782)
-- Dependencies: 213
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3357 (class 0 OID 24788)
-- Dependencies: 215
-- Data for Name: sorties; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3361 (class 0 OID 24800)
-- Dependencies: 219
-- Data for Name: utilisateurs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.utilisateurs (id, isadmin, email, pseudo) VALUES ('eiC2vq8z9sW3KlAvV5IRdz1nU2F2', false, 'etienne1.tillier@gmail.com', 'etienne66');


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 210
-- Name: CategoriesAnimal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CategoriesAnimal_id_seq"', 5, true);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 212
-- Name: EspeceAnimal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."EspeceAnimal_id_seq"', 6, true);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 214
-- Name: Photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Photos_id_seq"', 12, true);


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 216
-- Name: Sorties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Sorties_id_seq"', 16, true);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 220
-- Name: utilisateurs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilisateurs_id_seq', 13, true);


--
-- TOC entry 3203 (class 2606 OID 24808)
-- Name: associationespecesortie AssociationEspeceSortie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associationespecesortie
    ADD CONSTRAINT "AssociationEspeceSortie_pkey" PRIMARY KEY (idsortie, idespece);


--
-- TOC entry 3193 (class 2606 OID 24810)
-- Name: categoriesanimal CategoriesAnimal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoriesanimal
    ADD CONSTRAINT "CategoriesAnimal_pkey" PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 24812)
-- Name: especeanimal EspeceAnimal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especeanimal
    ADD CONSTRAINT "EspeceAnimal_pkey" PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 24814)
-- Name: photos id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT id PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3201 (class 2606 OID 24816)
-- Name: associationcategorieespece pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associationcategorieespece
    ADD CONSTRAINT pk PRIMARY KEY (idcategorie, idespece);


--
-- TOC entry 3199 (class 2606 OID 24818)
-- Name: sorties pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sorties
    ADD CONSTRAINT pkey PRIMARY KEY (id) INCLUDE (id);


--
-- TOC entry 3205 (class 2606 OID 24820)
-- Name: utilisateurs utilisateurs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateurs
    ADD CONSTRAINT utilisateurs_pkey PRIMARY KEY (id);


--
-- TOC entry 3209 (class 2606 OID 24821)
-- Name: associationcategorieespece idEspece; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associationcategorieespece
    ADD CONSTRAINT "idEspece" FOREIGN KEY (idespece) REFERENCES public.especeanimal(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3210 (class 2606 OID 24826)
-- Name: associationespecesortie idEspece; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associationespecesortie
    ADD CONSTRAINT "idEspece" FOREIGN KEY (idespece) REFERENCES public.especeanimal(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3211 (class 2606 OID 24831)
-- Name: associationespecesortie idSortie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associationespecesortie
    ADD CONSTRAINT "idSortie" FOREIGN KEY (idsortie) REFERENCES public.sorties(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3206 (class 2606 OID 24836)
-- Name: photos photoEspeceAnimal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT "photoEspeceAnimal" FOREIGN KEY (idespeceanimal) REFERENCES public.especeanimal(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3207 (class 2606 OID 24841)
-- Name: photos photoSortie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT "photoSortie" FOREIGN KEY (idsortie) REFERENCES public.sorties(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3208 (class 2606 OID 24846)
-- Name: sorties utilisateur; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sorties
    ADD CONSTRAINT utilisateur FOREIGN KEY (idutilisateur) REFERENCES public.utilisateurs(id) ON DELETE CASCADE;


-- Completed on 2022-03-18 00:47:26

--
-- PostgreSQL database dump complete
--

