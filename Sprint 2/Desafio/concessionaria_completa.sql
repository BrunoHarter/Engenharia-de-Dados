--
-- PostgreSQL database dump
--

\restrict lehZ8ZxwH0cPfYuoQNfcZULLLKcYcbiLFGdH722LTRcc5FHGDuiEFIW8NlubPs8

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2025-12-22 09:56:34

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 24648)
-- Name: carro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carro (
    idcarro integer NOT NULL,
    kmcarro integer,
    classicarro character varying(50),
    marcacarro character varying(40),
    modelocarro character varying(80),
    anocarro integer,
    idcombustivel integer
);


ALTER TABLE public.carro OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24636)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    idcliente integer NOT NULL,
    nomecliente character varying(100),
    cidadecliente character varying(40),
    estadocliente character varying(40),
    paiscliente character varying(40)
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24642)
-- Name: combustivel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.combustivel (
    idcombustivel integer NOT NULL,
    tipocombustivel character varying(20)
);


ALTER TABLE public.combustivel OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24693)
-- Name: dim_carro; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.dim_carro AS
 SELECT DISTINCT c.idcarro,
    c.classicarro,
    c.marcacarro,
    c.modelocarro,
    c.anocarro,
    comb.tipocombustivel
   FROM (public.carro c
     JOIN public.combustivel comb ON ((comb.idcombustivel = c.idcombustivel)));


ALTER VIEW public.dim_carro OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24689)
-- Name: dim_cliente; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.dim_cliente AS
 SELECT DISTINCT idcliente,
    nomecliente,
    cidadecliente,
    estadocliente,
    paiscliente
   FROM public.cliente;


ALTER VIEW public.dim_cliente OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24659)
-- Name: vendedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendedor (
    idvendedor integer NOT NULL,
    nomevendedor character varying(45),
    sexovendedor smallint,
    estadovendedor character varying(40)
);


ALTER TABLE public.vendedor OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24697)
-- Name: dim_vendedor; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.dim_vendedor AS
 SELECT DISTINCT idvendedor,
    nomevendedor,
    sexovendedor,
    estadovendedor
   FROM public.vendedor;


ALTER VIEW public.dim_vendedor OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24665)
-- Name: locacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locacao (
    idlocacao integer NOT NULL,
    idcliente integer NOT NULL,
    idcarro integer NOT NULL,
    idvendedor integer NOT NULL,
    datalocacao date,
    horalocacao time without time zone,
    qtddiaria integer,
    vlrdiaria numeric(18,2),
    dataentrega date,
    horaentrega time without time zone
);


ALTER TABLE public.locacao OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24701)
-- Name: fato_locacao; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.fato_locacao AS
 SELECT idlocacao,
    idcliente,
    idcarro,
    idvendedor,
    datalocacao,
    dataentrega,
    qtddiaria,
    vlrdiaria,
    ((qtddiaria)::numeric * vlrdiaria) AS valor_total
   FROM public.locacao l;


ALTER VIEW public.fato_locacao OWNER TO postgres;

--
-- TOC entry 4953 (class 0 OID 24648)
-- Dependencies: 221
-- Data for Name: carro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carro (idcarro, kmcarro, classicarro, marcacarro, modelocarro, anocarro, idcombustivel) FROM stdin;
\.


--
-- TOC entry 4951 (class 0 OID 24636)
-- Dependencies: 219
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (idcliente, nomecliente, cidadecliente, estadocliente, paiscliente) FROM stdin;
\.


--
-- TOC entry 4952 (class 0 OID 24642)
-- Dependencies: 220
-- Data for Name: combustivel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.combustivel (idcombustivel, tipocombustivel) FROM stdin;
\.


--
-- TOC entry 4955 (class 0 OID 24665)
-- Dependencies: 223
-- Data for Name: locacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locacao (idlocacao, idcliente, idcarro, idvendedor, datalocacao, horalocacao, qtddiaria, vlrdiaria, dataentrega, horaentrega) FROM stdin;
\.


--
-- TOC entry 4954 (class 0 OID 24659)
-- Dependencies: 222
-- Data for Name: vendedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendedor (idvendedor, nomevendedor, sexovendedor, estadovendedor) FROM stdin;
\.


--
-- TOC entry 4791 (class 2606 OID 24653)
-- Name: carro carro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carro
    ADD CONSTRAINT carro_pkey PRIMARY KEY (idcarro);


--
-- TOC entry 4787 (class 2606 OID 24641)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);


--
-- TOC entry 4789 (class 2606 OID 24647)
-- Name: combustivel combustivel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combustivel
    ADD CONSTRAINT combustivel_pkey PRIMARY KEY (idcombustivel);


--
-- TOC entry 4795 (class 2606 OID 24673)
-- Name: locacao locacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT locacao_pkey PRIMARY KEY (idlocacao);


--
-- TOC entry 4793 (class 2606 OID 24664)
-- Name: vendedor vendedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendedor
    ADD CONSTRAINT vendedor_pkey PRIMARY KEY (idvendedor);


--
-- TOC entry 4796 (class 2606 OID 24654)
-- Name: carro carro_idcombustivel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carro
    ADD CONSTRAINT carro_idcombustivel_fkey FOREIGN KEY (idcombustivel) REFERENCES public.combustivel(idcombustivel);


--
-- TOC entry 4797 (class 2606 OID 24679)
-- Name: locacao locacao_idcarro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT locacao_idcarro_fkey FOREIGN KEY (idcarro) REFERENCES public.carro(idcarro);


--
-- TOC entry 4798 (class 2606 OID 24674)
-- Name: locacao locacao_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT locacao_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);


--
-- TOC entry 4799 (class 2606 OID 24684)
-- Name: locacao locacao_idvendedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locacao
    ADD CONSTRAINT locacao_idvendedor_fkey FOREIGN KEY (idvendedor) REFERENCES public.vendedor(idvendedor);


-- Completed on 2025-12-22 09:56:34

--
-- PostgreSQL database dump complete
--

\unrestrict lehZ8ZxwH0cPfYuoQNfcZULLLKcYcbiLFGdH722LTRcc5FHGDuiEFIW8NlubPs8

