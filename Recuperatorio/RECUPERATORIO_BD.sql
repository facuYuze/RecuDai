--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.0

-- Started on 2024-11-27 12:10:24

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4802 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16400)
-- Name: preguntas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.preguntas (
    id integer NOT NULL,
    pregunta text NOT NULL,
    opcion1 text NOT NULL,
    opcion2 text NOT NULL,
    opcion3 text NOT NULL,
    opcion4 text NOT NULL,
    respuesta_correcta text NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now()
);


ALTER TABLE public.preguntas OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: preguntas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.preguntas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.preguntas_id_seq OWNER TO postgres;

--
-- TOC entry 4803 (class 0 OID 0)
-- Dependencies: 215
-- Name: preguntas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.preguntas_id_seq OWNED BY public.preguntas.id;


--
-- TOC entry 218 (class 1259 OID 16410)
-- Name: respuestas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.respuestas (
    id integer NOT NULL,
    user_id integer NOT NULL,
    pregunta_id integer NOT NULL,
    respuesta_seleccionada text NOT NULL,
    es_correcta boolean NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT now()
);


ALTER TABLE public.respuestas OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16409)
-- Name: respuestas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.respuestas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.respuestas_id_seq OWNER TO postgres;

--
-- TOC entry 4804 (class 0 OID 0)
-- Dependencies: 217
-- Name: respuestas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.respuestas_id_seq OWNED BY public.respuestas.id;


--
-- TOC entry 4639 (class 2604 OID 16403)
-- Name: preguntas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preguntas ALTER COLUMN id SET DEFAULT nextval('public.preguntas_id_seq'::regclass);


--
-- TOC entry 4641 (class 2604 OID 16413)
-- Name: respuestas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respuestas ALTER COLUMN id SET DEFAULT nextval('public.respuestas_id_seq'::regclass);


--
-- TOC entry 4794 (class 0 OID 16400)
-- Dependencies: 216
-- Data for Name: preguntas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.preguntas VALUES (1, '¿Cuál es el país famoso por su Torre Eiffel?', 'España', 'Italia', 'Francia', 'Alemania', 'Francia', '2024-11-27 11:41:22.728676');
INSERT INTO public.preguntas VALUES (2, '¿Cuántas patas tiene una araña?', '6', '8', '10', '4', '8', '2024-11-27 11:41:22.728676');
INSERT INTO public.preguntas VALUES (3, '¿Qué mineral es el más abundante en los huesos humanos?', 'Hierro', 'Calcio', 'Potasio', 'Sodio', 'Calcio', '2024-11-27 11:42:55.375232');
INSERT INTO public.preguntas VALUES (4, '¿Qué océano es el más grande del mundo?', 'Atlántico', 'Pacífico', 'Índico', 'Ártico', 'Pacífico', '2024-11-27 11:42:55.375232');
INSERT INTO public.preguntas VALUES (5, '¿Quién escribió "Romeo y Julieta"?', 'William Shakespeare', 'Gabriel García Márquez', 'Charles Dickens', 'J.K. Rowling', 'William Shakespeare', '2024-11-27 11:42:55.375232');
INSERT INTO public.preguntas VALUES (6, '¿Qué número sigue en la secuencia 2, 4, 6, 8...?', '9', '10', '11', '12', '10', '2024-11-27 11:42:55.375232');
INSERT INTO public.preguntas VALUES (7, '¿Qué gas se encuentra en mayor proporción en el aire?', 'Oxígeno', 'Nitrógeno', 'Dióxido de carbono', 'Helio', 'Nitrógeno', '2024-11-27 11:42:55.375232');
INSERT INTO public.preguntas VALUES (8, '¿Qué continente tiene más países?', 'Asia', 'África', 'Europa', 'América', 'África', '2024-11-27 11:42:55.375232');
INSERT INTO public.preguntas VALUES (9, '¿Cuál es el género musical asociado a Ludwig van Beethoven?', 'Jazz', 'Clásica', 'Rock', 'Pop', 'Clásica', '2024-11-27 11:42:55.375232');
INSERT INTO public.preguntas VALUES (10, '¿En qué deporte se utiliza una raqueta y una pelota?', 'Fútbol', 'Tenis', 'Natación', 'Ciclismo', 'Tenis', '2024-11-27 11:42:55.375232');
INSERT INTO public.preguntas VALUES (11, '¿Qué animal es conocido como el "rey de la selva"?', 'Tigre', 'León', 'Elefante', 'Cocodrilo', 'León', '2024-11-27 11:42:55.375232');
INSERT INTO public.preguntas VALUES (12, '¿Qué instrumento mide la temperatura?', 'Barómetro', 'Termómetro', 'Higrómetro', 'Altímetro', 'Termómetro', '2024-11-27 11:42:55.375232');





--
-- TOC entry 4796 (class 0 OID 16410)
-- Dependencies: 218
-- Data for Name: respuestas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4805 (class 0 OID 0)
-- Dependencies: 215
-- Name: preguntas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.preguntas_id_seq', 12, true);


--
-- TOC entry 4806 (class 0 OID 0)
-- Dependencies: 217
-- Name: respuestas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.respuestas_id_seq', 1, false);


--
-- TOC entry 4645 (class 2606 OID 16408)
-- Name: preguntas preguntas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preguntas
    ADD CONSTRAINT preguntas_pkey PRIMARY KEY (id);


--
-- TOC entry 4648 (class 2606 OID 16418)
-- Name: respuestas respuestas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respuestas
    ADD CONSTRAINT respuestas_pkey PRIMARY KEY (id);


--
-- TOC entry 4643 (class 1259 OID 16424)
-- Name: idx_preguntas_fecha_creacion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_preguntas_fecha_creacion ON public.preguntas USING btree (fecha_creacion);


--
-- TOC entry 4646 (class 1259 OID 16425)
-- Name: idx_respuestas_fecha_creacion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_respuestas_fecha_creacion ON public.respuestas USING btree (fecha_creacion);


--
-- TOC entry 4649 (class 2606 OID 16419)
-- Name: respuestas fk_pregunta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respuestas
    ADD CONSTRAINT fk_pregunta FOREIGN KEY (pregunta_id) REFERENCES public.preguntas(id) ON DELETE CASCADE;


-- Completed on 2024-11-27 12:10:24

--
-- PostgreSQL database dump complete
--

