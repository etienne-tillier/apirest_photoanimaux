--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-03-29 16:25:26

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
    poidsmoyen numeric NOT NULL,
    taille numeric NOT NULL,
    image text NOT NULL,
    nomespece text NOT NULL,
    couleur text NOT NULL
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
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 220
-- Name: utilisateurs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilisateurs_id_seq OWNED BY public.utilisateurs.id;


--
-- TOC entry 3359 (class 0 OID 24794)
-- Dependencies: 217
-- Data for Name: associationcategorieespece; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (8, 47);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (9, 47);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (10, 48);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (11, 49);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (10, 49);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (12, 49);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (13, 50);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (10, 50);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (10, 51);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (14, 51);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (10, 52);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (12, 52);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (15, 52);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (14, 53);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (10, 53);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (8, 54);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (16, 55);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (8, 55);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (8, 56);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (17, 56);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (9, 56);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (18, 56);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (8, 57);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (19, 57);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (20, 58);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (8, 58);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (9, 58);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (10, 59);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (21, 59);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (22, 59);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (23, 60);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (10, 60);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (24, 60);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (26, 61);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (25, 61);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (10, 61);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (13, 62);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (10, 62);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (27, 63);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (8, 63);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (28, 64);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (10, 64);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (15, 64);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (12, 64);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (21, 64);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (23, 65);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (10, 65);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (10, 66);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (8, 67);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (9, 67);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (26, 67);
INSERT INTO public.associationcategorieespece (idcategorie, idespece) VALUES (18, 67);


--
-- TOC entry 3360 (class 0 OID 24797)
-- Dependencies: 218
-- Data for Name: associationespecesortie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.associationespecesortie (idsortie, idespece) VALUES (73, 65);
INSERT INTO public.associationespecesortie (idsortie, idespece) VALUES (74, 49);
INSERT INTO public.associationespecesortie (idsortie, idespece) VALUES (74, 52);
INSERT INTO public.associationespecesortie (idsortie, idespece) VALUES (75, 51);
INSERT INTO public.associationespecesortie (idsortie, idespece) VALUES (76, 56);
INSERT INTO public.associationespecesortie (idsortie, idespece) VALUES (77, 63);
INSERT INTO public.associationespecesortie (idsortie, idespece) VALUES (78, 67);
INSERT INTO public.associationespecesortie (idsortie, idespece) VALUES (78, 60);
INSERT INTO public.associationespecesortie (idsortie, idespece) VALUES (79, 61);
INSERT INTO public.associationespecesortie (idsortie, idespece) VALUES (79, 65);


--
-- TOC entry 3351 (class 0 OID 24770)
-- Dependencies: 209
-- Data for Name: categoriesanimal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (8, 'Oiseaux');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (9, 'Rapaces');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (10, 'Mamifères');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (12, 'Caprinés');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (13, 'Rongeurs');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (14, 'Cervidés');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (15, 'Bovidés');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (16, 'Corvidés');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (17, 'Vautours');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (18, 'Accipitridés');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (19, 'Ardeidae');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (20, 'Strigidés');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (21, 'Herbivores');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (22, 'Léporidés');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (23, 'Canidés');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (25, 'Félins');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (26, 'Carnivores');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (27, 'Alcedinidae');
INSERT INTO public.categoriesanimal (id, nomcategorie) OVERRIDING SYSTEM VALUE VALUES (28, 'Ovins');


--
-- TOC entry 3353 (class 0 OID 24776)
-- Dependencies: 211
-- Data for Name: especeanimal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (47, 5, 210, 'images/especeAnimaux/aigle royal.jpg', 'Aigle royal', 'noir et brun');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (48, 12, 70, 'images/especeAnimaux/blaireau.jpg', 'Blaireau', 'brun foncé,  noir et blanc');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (49, 70, 150, 'images/especeAnimaux/bouquetin.jpg', 'Bouquetin', 'brun');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (50, 20, 100, 'images/especeAnimaux/castor.jpg', 'Castor', 'brun foncé');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (51, 180, 140, 'images/especeAnimaux/cerf.jpg', 'Cerf élaphe', 'brun-roux, gris-brun');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (52, 32, 80, 'images/especeAnimaux/chamoix.jpg', 'Chamois', 'noir brun foncé, beige');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (53, 20, 60, 'images/especeAnimaux/chevreuil.jpg', 'Chevreuil', 'brun, gris');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (54, 1, 60, 'images/especeAnimaux/coq bruyere.jpg', 'Coq de bruyère', 'noir, brun, blanc, gris, rouge');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (55, 1.5, 130, 'images/especeAnimaux/corbeau.jpg', 'Grand corbeau', 'noir');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (56, 6, 300, 'images/especeAnimaux/gypaete.jpg', 'Gypaète barbu', 'roux orangé, blanc, noir');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (57, 2, 180, 'images/especeAnimaux/héron cendré.jpg', 'Héron cendré', 'gris, blanc');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (58, 0.3, 90, 'images/especeAnimaux/hibouxmoyen duc.jpg', 'Hibou moyen-duc', 'brun, noir, gris');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (59, 5, 60, 'images/especeAnimaux/lièvre.jpg', 'Lièvre', 'brun, brun-roux, blanc');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (60, 35, 80, 'images/especeAnimaux/loup.jpg', 'Loup gris commun', 'gris, noir, blanc');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (61, 25, 70, 'images/especeAnimaux/lynx.jpg', 'Lynx boréal', 'brun clair, noir, blanc');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (62, 7, 60, 'images/especeAnimaux/marmotte.jpg', 'Marmotte', 'brun, noir, marron');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (63, 0.035, 16, 'images/especeAnimaux/martin pecheur.jpg', 'Martin-pêcheur d''Europe', 'bleu, roux, blanc');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (64, 40, 70, 'images/especeAnimaux/mouflon.jpg', 'Mouflon', 'brun foncé');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (65, 10, 40, 'images/especeAnimaux/renard.jpg', 'Renard', 'brun, gris, roux');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (66, 150, 100, 'images/especeAnimaux/sanglier.jpg', 'Sanglier', 'gris-brun');
INSERT INTO public.especeanimal (id, poidsmoyen, taille, image, nomespece, couleur) OVERRIDING SYSTEM VALUE VALUES (67, 9, 260, 'images/especeAnimaux/vautour fauve.jpg', 'Vautour fauve', 'brun, noir, blanc');


--
-- TOC entry 3355 (class 0 OID 24782)
-- Dependencies: 213
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (27, 65, 200, 'images/photos/eiC2vq8z9sW3KlAvV5IRdz1nU2F2/73-renard1.jpg', 'Il était vraiment devant moi au moment de cette photo. 20m je dirais.', 'Nikon D90', '300mm', 'f4', '400', 10, 10, 73);
INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (28, 52, 700, 'images/photos/ouJyMUv9PVdshiyqx6J4gQUtAal1/74-chamois3.jpg', 'Un des deux chamois que j''ai pu photographier', 'Nikon D4S', '400mm', 'f8', '800', 10, 10, 74);
INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (29, 49, 400, 'images/photos/ouJyMUv9PVdshiyqx6J4gQUtAal1/74-bouquetin1.jpg', 'Magnifique bouquetin', 'Nikon D4S', '400mm', 'f7', '600', 10, 10, 74);
INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (30, 51, 1000, 'images/photos/ouJyMUv9PVdshiyqx6J4gQUtAal1/75-cerf1.jpg', 'Il ne m''a pas vu, j''ai pas bougé', 'Nikon D4S', '400mm', 'f4', '500', 10, 10, 75);
INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (31, 56, 300, 'images/photos/RdkJhEhLnEOcvbVoHFJZFRiVCPW2/76-gypaete1.jpg', 'Très curieux, il est passé très près', 'Nikon D90', '300mm', 'f4', '2000', 10, 10, 76);
INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (32, 56, 200, 'images/photos/RdkJhEhLnEOcvbVoHFJZFRiVCPW2/76-gypaete2.jpg', 'J''ai aussi eu la chance de le voir se poser', 'Nikon D90', '300mm', 'f7', '400', 10, 10, 76);
INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (33, 63, 400, 'images/photos/RdkJhEhLnEOcvbVoHFJZFRiVCPW2/77-martin pecheur.jpg', 'Le martin sur sa branche comme à son habitude', 'Nikon D4S', '400mm', 'f7', '800', 10, 10, 77);
INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (34, 63, 200, 'images/photos/RdkJhEhLnEOcvbVoHFJZFRiVCPW2/77-martinpecheur.jpg', 'En train de pêcher..', 'Nikon D4S', '400mm', 'f4', '800', 10, 10, 77);
INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (35, 67, 400, 'images/photos/RdkJhEhLnEOcvbVoHFJZFRiVCPW2/78-vautour1.jpg', 'Il devait y avoir une carcasse pas très loin', 'Nikon D90', '500mm', 'f4', '1500', 10, 10, 78);
INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (36, 60, 200, 'images/photos/RdkJhEhLnEOcvbVoHFJZFRiVCPW2/78-loups2.jpg', 'Encore une belle photo du loup ! ', 'Nikon D90', '300mm', 'f4', '500', 10, 10, 78);
INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (37, 60, 400, 'images/photos/RdkJhEhLnEOcvbVoHFJZFRiVCPW2/78-louip1.jpeg', 'Grande surprise de voir le loup ici', 'Nikon D90', '300mm', 'f7', '600', 10, 10, 78);
INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (38, 67, 200, 'images/photos/RdkJhEhLnEOcvbVoHFJZFRiVCPW2/78-vautour3.jpg', 'Beau spécimen', 'Nikon D90', '500mm', 'f4', '1400', 10, 10, 78);
INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (39, 67, 400, 'images/photos/RdkJhEhLnEOcvbVoHFJZFRiVCPW2/78-vautour2.jpg', 'Au top celui-ci', 'Nikon D90', '500mm', 'f4', '1700', 10, 10, 78);
INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (40, 61, 400, 'images/photos/jPIj2beVUcVwCxN4aDFgSE1fxsm1/79-lynx2.jpg', 'Il est resté un peu avec nous sans nous voir', 'Nikon D4S', '300mm', 'f11', '800', 10, 10, 79);
INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (41, 61, 800, 'images/photos/jPIj2beVUcVwCxN4aDFgSE1fxsm1/79-lynx1.jpg', 'Première rencontre avec le lynx', 'Nikon D4S', '300mm', 'f4', '500', 10, 10, 79);
INSERT INTO public.photos (id, idespeceanimal, iso, lienfichier, description, camera, objectif, ouverture, vitesse, longitude, latitude, idsortie) OVERRIDING SYSTEM VALUE VALUES (42, 65, 600, 'images/photos/jPIj2beVUcVwCxN4aDFgSE1fxsm1/79-renard3.jpg', 'Un renard est venu à nous sur le chemin du retour', 'Nikon D4S', '300mm', 'f4', '500', 10, 10, 79);


--
-- TOC entry 3357 (class 0 OID 24788)
-- Dependencies: 215
-- Data for Name: sorties; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sorties (id, idutilisateur, date, description, longitude, latitude, prive) OVERRIDING SYSTEM VALUE VALUES (77, 'RdkJhEhLnEOcvbVoHFJZFRiVCPW2', '2022-03-10', 'Belle sortie', 4.01, 43.59, false);
INSERT INTO public.sorties (id, idutilisateur, date, description, longitude, latitude, prive) OVERRIDING SYSTEM VALUE VALUES (78, 'RdkJhEhLnEOcvbVoHFJZFRiVCPW2', '2022-03-17', 'On allait pour prendre des photos des vautours, et on a finalement vu un loup', 3.07, 44.05, false);
INSERT INTO public.sorties (id, idutilisateur, date, description, longitude, latitude, prive) OVERRIDING SYSTEM VALUE VALUES (79, 'jPIj2beVUcVwCxN4aDFgSE1fxsm1', '2022-03-17', 'Incroyable d''avoir vu le lynx. On a attendu 5 heures pour le voir.', 6.77, 47.79, false);
INSERT INTO public.sorties (id, idutilisateur, date, description, longitude, latitude, prive) OVERRIDING SYSTEM VALUE VALUES (73, 'eiC2vq8z9sW3KlAvV5IRdz1nU2F2', '2022-03-17', 'Belle rencontre avec un renard', 3, 47.5, false);
INSERT INTO public.sorties (id, idutilisateur, date, description, longitude, latitude, prive) OVERRIDING SYSTEM VALUE VALUES (74, 'ouJyMUv9PVdshiyqx6J4gQUtAal1', '2022-03-07', 'Sortie en montagne dans les alpes. J''ai approché deux chamois sans qu''ils me voient pour pouvoir les photographier. Un bouquetin est aussi venu par la suite !', 6.69, 45.31, false);
INSERT INTO public.sorties (id, idutilisateur, date, description, longitude, latitude, prive) OVERRIDING SYSTEM VALUE VALUES (75, 'ouJyMUv9PVdshiyqx6J4gQUtAal1', '2022-03-09', 'Paysages magnifiques, les cerfs étaient au rendez-vous !', 6.05, 45.80, false);
INSERT INTO public.sorties (id, idutilisateur, date, description, longitude, latitude, prive) OVERRIDING SYSTEM VALUE VALUES (76, 'RdkJhEhLnEOcvbVoHFJZFRiVCPW2', '2022-03-04', 'Sortie au caillou, le gypaète au rendez-vous comme d''habitude', 6.53, 45.28, false);


--
-- TOC entry 3361 (class 0 OID 24800)
-- Dependencies: 219
-- Data for Name: utilisateurs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.utilisateurs (id, isadmin, email, pseudo) VALUES ('eiC2vq8z9sW3KlAvV5IRdz1nU2F2', true, 'etienne1.tillier@gmail.com', 'etienne66');
INSERT INTO public.utilisateurs (id, isadmin, email, pseudo) VALUES ('jPIj2beVUcVwCxN4aDFgSE1fxsm1', false, 'etienne.tillier@gmail.com', 'nonadmin');
INSERT INTO public.utilisateurs (id, isadmin, email, pseudo) VALUES ('ouJyMUv9PVdshiyqx6J4gQUtAal1', false, 'testnonadmin@gmail.com', 'testnonadmin');
INSERT INTO public.utilisateurs (id, isadmin, email, pseudo) VALUES ('RdkJhEhLnEOcvbVoHFJZFRiVCPW2', true, 'testadmin@gmail.com', 'testadmin');


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 210
-- Name: CategoriesAnimal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CategoriesAnimal_id_seq"', 28, true);


--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 212
-- Name: EspeceAnimal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."EspeceAnimal_id_seq"', 67, true);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 214
-- Name: Photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Photos_id_seq"', 42, true);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 216
-- Name: Sorties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Sorties_id_seq"', 79, true);


--
-- TOC entry 3373 (class 0 OID 0)
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


-- Completed on 2022-03-29 16:25:26

--
-- PostgreSQL database dump complete
--

