--
-- PostgreSQL database dump
--

\restrict rr1pc92aIdajX2KYoMPTZ9dXXOn99cawX1RaCelaU80MYcXo0l4vSSB1FdBlagt

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-05-21 10:38:00

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
-- TOC entry 2 (class 3079 OID 17555)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 5967 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 18666)
-- Name: kecamatan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kecamatan (
    id_kecamatan integer NOT NULL,
    nama_kecamatan character varying(100),
    geom_polygon public.geometry(Polygon,4326) NOT NULL
);


ALTER TABLE public.kecamatan OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 18665)
-- Name: kecamatan_id_kecamatan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kecamatan_id_kecamatan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kecamatan_id_kecamatan_seq OWNER TO postgres;

--
-- TOC entry 5968 (class 0 OID 0)
-- Dependencies: 229
-- Name: kecamatan_id_kecamatan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kecamatan_id_kecamatan_seq OWNED BY public.kecamatan.id_kecamatan;


--
-- TOC entry 226 (class 1259 OID 18644)
-- Name: rute_akdp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rute_akdp (
    id_rute integer NOT NULL,
    nama_trayek character varying(100),
    geometry public.geometry(LineString,4326) NOT NULL
);


ALTER TABLE public.rute_akdp OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 18643)
-- Name: rute_akdp_id_rute_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rute_akdp_id_rute_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rute_akdp_id_rute_seq OWNER TO postgres;

--
-- TOC entry 5969 (class 0 OID 0)
-- Dependencies: 225
-- Name: rute_akdp_id_rute_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rute_akdp_id_rute_seq OWNED BY public.rute_akdp.id_rute;


--
-- TOC entry 232 (class 1259 OID 18687)
-- Name: rute_titik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rute_titik (
    id_rute_titik integer NOT NULL,
    id_rute integer,
    id_titik integer,
    urutan integer
);


ALTER TABLE public.rute_titik OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 18686)
-- Name: rute_titik_id_rute_titik_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rute_titik_id_rute_titik_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rute_titik_id_rute_titik_seq OWNER TO postgres;

--
-- TOC entry 5970 (class 0 OID 0)
-- Dependencies: 231
-- Name: rute_titik_id_rute_titik_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rute_titik_id_rute_titik_seq OWNED BY public.rute_titik.id_rute_titik;


--
-- TOC entry 228 (class 1259 OID 18655)
-- Name: titik_transportasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titik_transportasi (
    id_titik integer NOT NULL,
    nama_titik character varying(100),
    geom_point public.geometry(Point,4326) NOT NULL
);


ALTER TABLE public.titik_transportasi OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 18654)
-- Name: titik_transportasi_id_titik_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.titik_transportasi_id_titik_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.titik_transportasi_id_titik_seq OWNER TO postgres;

--
-- TOC entry 5971 (class 0 OID 0)
-- Dependencies: 227
-- Name: titik_transportasi_id_titik_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.titik_transportasi_id_titik_seq OWNED BY public.titik_transportasi.id_titik;


--
-- TOC entry 5786 (class 2604 OID 18669)
-- Name: kecamatan id_kecamatan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kecamatan ALTER COLUMN id_kecamatan SET DEFAULT nextval('public.kecamatan_id_kecamatan_seq'::regclass);


--
-- TOC entry 5784 (class 2604 OID 18647)
-- Name: rute_akdp id_rute; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rute_akdp ALTER COLUMN id_rute SET DEFAULT nextval('public.rute_akdp_id_rute_seq'::regclass);


--
-- TOC entry 5787 (class 2604 OID 18690)
-- Name: rute_titik id_rute_titik; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rute_titik ALTER COLUMN id_rute_titik SET DEFAULT nextval('public.rute_titik_id_rute_titik_seq'::regclass);


--
-- TOC entry 5785 (class 2604 OID 18658)
-- Name: titik_transportasi id_titik; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titik_transportasi ALTER COLUMN id_titik SET DEFAULT nextval('public.titik_transportasi_id_titik_seq'::regclass);


--
-- TOC entry 5959 (class 0 OID 18666)
-- Dependencies: 230
-- Data for Name: kecamatan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kecamatan (id_kecamatan, nama_kecamatan, geom_polygon) FROM stdin;
\.


--
-- TOC entry 5955 (class 0 OID 18644)
-- Dependencies: 226
-- Data for Name: rute_akdp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rute_akdp (id_rute, nama_trayek, geometry) FROM stdin;
1	Trayek Stasiun - Pasar	0102000020E6100000020000008B6CE7FBA9F95B40273108AC1C1A20C07D3F355EBAF95B40B4C876BE9F1A20C0
2	Trayek Gayatri - Ngunut	0102000020E6100000020000006F1283C0CAF95B404260E5D0221B20C052B81E85EBF95B405C8FC2F5281C20C0
3	Trayek Rejotangan - Campurdarat	0102000020E610000002000000448B6CE7FBF95B40E9263108AC1C20C0355EBA490CFA5B4077BE9F1A2F1D20C0
4	Trayek Bandung - Besuki	0102000020E610000002000000273108AC1CFA5B4004560E2DB21D20C01904560E2DFA5B4091ED7C3F351E20C0
5	Trayek Pakel - Sumbergempol	0102000020E6100000020000000AD7A3703DFA5B401F85EB51B81E20C0FCA9F1D24DFA5B40AC1C5A643B1F20C0
\.


--
-- TOC entry 5961 (class 0 OID 18687)
-- Dependencies: 232
-- Data for Name: rute_titik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rute_titik (id_rute_titik, id_rute, id_titik, urutan) FROM stdin;
\.


--
-- TOC entry 5783 (class 0 OID 17874)
-- Dependencies: 221
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 5957 (class 0 OID 18655)
-- Dependencies: 228
-- Data for Name: titik_transportasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.titik_transportasi (id_titik, nama_titik, geom_point) FROM stdin;
1	Halte Stasiun Utama	0101000020E61000008B6CE7FBA9F95B40273108AC1C1A20C0
2	Halte Pasar Wage	0101000020E61000007D3F355EBAF95B40B4C876BE9F1A20C0
3	Halte Terminal Gayatri	0101000020E61000006F1283C0CAF95B404260E5D0221B20C0
4	Halte Kauman	0101000020E610000060E5D022DBF95B40CFF753E3A51B20C0
5	Halte Ngunut	0101000020E610000052B81E85EBF95B405C8FC2F5281C20C0
6	Halte Rejotangan	0101000020E6100000448B6CE7FBF95B40E9263108AC1C20C0
7	Halte Campurdarat	0101000020E6100000355EBA490CFA5B4077BE9F1A2F1D20C0
8	Halte Bandung	0101000020E6100000273108AC1CFA5B4004560E2DB21D20C0
9	Halte Besuki	0101000020E61000001904560E2DFA5B4091ED7C3F351E20C0
10	Halte Pakel	0101000020E61000000AD7A3703DFA5B401F85EB51B81E20C0
11	Halte Sumbergempol	0101000020E6100000FCA9F1D24DFA5B40AC1C5A643B1F20C0
12	Halte Boyolangu	0101000020E6100000EE7C3F355EFA5B4039B4C876BE1F20C0
13	Halte Tulungagung Kota	0101000020E6100000DF4F8D976EFA5B40C74B3789412020C0
14	Halte Kedungwaru	0101000020E6100000D122DBF97EFA5B4054E3A59BC42020C0
15	Halte Karangrejo	0101000020E6100000C3F5285C8FFA5B40E17A14AE472120C0
16	Halte Sendang	0101000020E6100000B4C876BE9FFA5B406F1283C0CA2120C0
17	Halte Kalidawir	0101000020E6100000A69BC420B0FA5B40FCA9F1D24D2220C0
18	Halte Pucanglaban	0101000020E6100000986E1283C0FA5B40894160E5D02220C0
19	Halte Tanggunggunung	0101000020E6100000894160E5D0FA5B4017D9CEF7532320C0
20	Halte Gondang	0101000020E61000007B14AE47E1FA5B40A4703D0AD72320C0
\.


--
-- TOC entry 5972 (class 0 OID 0)
-- Dependencies: 229
-- Name: kecamatan_id_kecamatan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kecamatan_id_kecamatan_seq', 1, false);


--
-- TOC entry 5973 (class 0 OID 0)
-- Dependencies: 225
-- Name: rute_akdp_id_rute_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rute_akdp_id_rute_seq', 5, true);


--
-- TOC entry 5974 (class 0 OID 0)
-- Dependencies: 231
-- Name: rute_titik_id_rute_titik_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rute_titik_id_rute_titik_seq', 1, false);


--
-- TOC entry 5975 (class 0 OID 0)
-- Dependencies: 227
-- Name: titik_transportasi_id_titik_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.titik_transportasi_id_titik_seq', 20, true);


--
-- TOC entry 5799 (class 2606 OID 18675)
-- Name: kecamatan kecamatan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kecamatan
    ADD CONSTRAINT kecamatan_pkey PRIMARY KEY (id_kecamatan);


--
-- TOC entry 5793 (class 2606 OID 18653)
-- Name: rute_akdp rute_akdp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rute_akdp
    ADD CONSTRAINT rute_akdp_pkey PRIMARY KEY (id_rute);


--
-- TOC entry 5801 (class 2606 OID 18693)
-- Name: rute_titik rute_titik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rute_titik
    ADD CONSTRAINT rute_titik_pkey PRIMARY KEY (id_rute_titik);


--
-- TOC entry 5796 (class 2606 OID 18664)
-- Name: titik_transportasi titik_transportasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titik_transportasi
    ADD CONSTRAINT titik_transportasi_pkey PRIMARY KEY (id_titik);


--
-- TOC entry 5797 (class 1259 OID 18678)
-- Name: idx_kecamatan_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_kecamatan_geom ON public.kecamatan USING gist (geom_polygon);


--
-- TOC entry 5791 (class 1259 OID 18676)
-- Name: idx_rute_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_rute_geom ON public.rute_akdp USING gist (geometry);


--
-- TOC entry 5794 (class 1259 OID 18677)
-- Name: idx_titik_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_titik_geom ON public.titik_transportasi USING gist (geom_point);


-- Completed on 2026-05-21 10:38:01

--
-- PostgreSQL database dump complete
--

\unrestrict rr1pc92aIdajX2KYoMPTZ9dXXOn99cawX1RaCelaU80MYcXo0l4vSSB1FdBlagt

