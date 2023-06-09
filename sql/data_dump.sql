--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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
-- Name: album; Type: TABLE; Schema: public; Owner: spotifaie_user
--

CREATE TABLE public.album (
    id_album integer NOT NULL,
    image_album character varying(200) NOT NULL,
    genre_album character varying(50) NOT NULL,
    date_album timestamp without time zone DEFAULT now() NOT NULL,
    titre_album character varying(150) NOT NULL,
    id_artiste integer NOT NULL
);


ALTER TABLE public.album OWNER TO spotifaie_user;

--
-- Name: album_id_album_seq; Type: SEQUENCE; Schema: public; Owner: spotifaie_user
--

CREATE SEQUENCE public.album_id_album_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.album_id_album_seq OWNER TO spotifaie_user;

--
-- Name: album_id_album_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spotifaie_user
--

ALTER SEQUENCE public.album_id_album_seq OWNED BY public.album.id_album;


--
-- Name: artiste; Type: TABLE; Schema: public; Owner: spotifaie_user
--

CREATE TABLE public.artiste (
    id_artiste integer NOT NULL,
    nom_artiste character varying(50) NOT NULL,
    type_artiste character varying(50) NOT NULL,
    image_artiste character varying(200)
);


ALTER TABLE public.artiste OWNER TO spotifaie_user;

--
-- Name: artiste_id_artiste_seq; Type: SEQUENCE; Schema: public; Owner: spotifaie_user
--

CREATE SEQUENCE public.artiste_id_artiste_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artiste_id_artiste_seq OWNER TO spotifaie_user;

--
-- Name: artiste_id_artiste_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spotifaie_user
--

ALTER SEQUENCE public.artiste_id_artiste_seq OWNED BY public.artiste.id_artiste;


--
-- Name: artiste_musique; Type: TABLE; Schema: public; Owner: spotifaie_user
--

CREATE TABLE public.artiste_musique (
    id_artiste integer NOT NULL,
    id_musique integer NOT NULL,
    date_ajout timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.artiste_musique OWNER TO spotifaie_user;

--
-- Name: file_attente; Type: TABLE; Schema: public; Owner: spotifaie_user
--

CREATE TABLE public.file_attente (
    id_musique integer NOT NULL,
    id_user integer NOT NULL,
    date_ajout timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.file_attente OWNER TO spotifaie_user;

--
-- Name: historique; Type: TABLE; Schema: public; Owner: spotifaie_user
--

CREATE TABLE public.historique (
    id_musique integer NOT NULL,
    id_user integer NOT NULL,
    date_ajout timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.historique OWNER TO spotifaie_user;

--
-- Name: like_musique; Type: TABLE; Schema: public; Owner: spotifaie_user
--

CREATE TABLE public.like_musique (
    id_musique integer NOT NULL,
    id_user integer NOT NULL,
    date_ajout timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.like_musique OWNER TO spotifaie_user;

--
-- Name: musique; Type: TABLE; Schema: public; Owner: spotifaie_user
--

CREATE TABLE public.musique (
    id_musique integer NOT NULL,
    titre_musique character varying(300) NOT NULL,
    temps_musique double precision NOT NULL,
    url_musique character(500),
    id_spotify character varying(50) NOT NULL,
    id_artiste_principale integer NOT NULL,
    id_album integer,
    nb_like integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.musique OWNER TO spotifaie_user;

--
-- Name: musique_id_musique_seq; Type: SEQUENCE; Schema: public; Owner: spotifaie_user
--

CREATE SEQUENCE public.musique_id_musique_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.musique_id_musique_seq OWNER TO spotifaie_user;

--
-- Name: musique_id_musique_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spotifaie_user
--

ALTER SEQUENCE public.musique_id_musique_seq OWNED BY public.musique.id_musique;


--
-- Name: playlist; Type: TABLE; Schema: public; Owner: spotifaie_user
--

CREATE TABLE public.playlist (
    id_playlist integer NOT NULL,
    titre_playlist character varying(50) NOT NULL,
    date_playlist timestamp without time zone DEFAULT now() NOT NULL,
    image_playlist character varying(200) DEFAULT NULL::character varying,
    public boolean DEFAULT true NOT NULL
);


ALTER TABLE public.playlist OWNER TO spotifaie_user;

--
-- Name: playlist_id_playlist_seq; Type: SEQUENCE; Schema: public; Owner: spotifaie_user
--

CREATE SEQUENCE public.playlist_id_playlist_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.playlist_id_playlist_seq OWNER TO spotifaie_user;

--
-- Name: playlist_id_playlist_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spotifaie_user
--

ALTER SEQUENCE public.playlist_id_playlist_seq OWNED BY public.playlist.id_playlist;


--
-- Name: playlist_musique; Type: TABLE; Schema: public; Owner: spotifaie_user
--

CREATE TABLE public.playlist_musique (
    id_musique integer NOT NULL,
    id_playlist integer NOT NULL,
    date_ajout date DEFAULT now() NOT NULL
);


ALTER TABLE public.playlist_musique OWNER TO spotifaie_user;

--
-- Name: user; Type: TABLE; Schema: public; Owner: spotifaie_user
--

CREATE TABLE public."user" (
    id_user integer NOT NULL,
    mail character varying(100) NOT NULL,
    date_naissance date NOT NULL,
    nom_user character varying(50) NOT NULL,
    prenom_user character varying(50) NOT NULL,
    motdepasse character varying(300) NOT NULL,
    image_user character(100) NOT NULL
);


ALTER TABLE public."user" OWNER TO spotifaie_user;

--
-- Name: user_id_user_seq; Type: SEQUENCE; Schema: public; Owner: spotifaie_user
--

CREATE SEQUENCE public.user_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_user_seq OWNER TO spotifaie_user;

--
-- Name: user_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spotifaie_user
--

ALTER SEQUENCE public.user_id_user_seq OWNED BY public."user".id_user;


--
-- Name: user_playlist; Type: TABLE; Schema: public; Owner: spotifaie_user
--

CREATE TABLE public.user_playlist (
    id_playlist integer NOT NULL,
    id_user integer NOT NULL,
    date_playlist timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.user_playlist OWNER TO spotifaie_user;

--
-- Name: album id_album; Type: DEFAULT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.album ALTER COLUMN id_album SET DEFAULT nextval('public.album_id_album_seq'::regclass);


--
-- Name: artiste id_artiste; Type: DEFAULT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.artiste ALTER COLUMN id_artiste SET DEFAULT nextval('public.artiste_id_artiste_seq'::regclass);


--
-- Name: musique id_musique; Type: DEFAULT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.musique ALTER COLUMN id_musique SET DEFAULT nextval('public.musique_id_musique_seq'::regclass);


--
-- Name: playlist id_playlist; Type: DEFAULT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.playlist ALTER COLUMN id_playlist SET DEFAULT nextval('public.playlist_id_playlist_seq'::regclass);


--
-- Name: user id_user; Type: DEFAULT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public."user" ALTER COLUMN id_user SET DEFAULT nextval('public.user_id_user_seq'::regclass);


--
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: spotifaie_user
--

COPY public.album (id_album, image_album, genre_album, date_album, titre_album, id_artiste) FROM stdin;
1	https://i.scdn.co/image/ab67616d0000b273ed4989dcb7cfb1887be9d250		2023-06-06 15:59:43.369303	The Very Best Of Ram Jam	1
2	https://i.scdn.co/image/ab67616d0000b27305c5be85b64eaff732f7cb0b		2023-06-06 15:59:56.447297	Out Of Our Heads	2
3	https://i.scdn.co/image/ab67616d0000b2730fe2ec86a0ec561ef2e2aae1		2023-06-06 15:59:58.571505	Tres Hombres (Expanded 2006 Remaster)	3
4	https://i.scdn.co/image/ab67616d0000b273bbf0146981704a073405b6c2		2023-06-06 16:00:00.721523	Aerosmith	4
5	https://i.scdn.co/image/ab67616d0000b27321ebf49b3292c3f0f575f0f5		2023-06-06 16:00:02.222825	Appetite For Destruction	5
6	https://i.scdn.co/image/ab67616d0000b273e175a19e530c898d167d39bf		2023-06-06 16:00:04.004852	Nevermind (Remastered)	6
7	https://i.scdn.co/image/ab67616d0000b2734384b6976cadaec272114022		2023-06-06 16:00:05.968676	Dynasty	7
8	https://i.scdn.co/image/ab67616d0000b2730b51f8d91f3a21e8426361ae		2023-06-06 16:00:07.600198	Back In Black	8
9	https://i.scdn.co/image/ab67616d0000b2739f39192f9f8ca1c90847b3e5		2023-06-06 16:00:09.277541	Willy And The Poor Boys (Expanded Edition)	9
10	https://i.scdn.co/image/ab67616d0000b273a7865e686c36a4adda6c9978		2023-06-06 16:00:11.706159	Born In The U.S.A.	10
11	https://i.scdn.co/image/ab67616d0000b27357df7ce0eac715cf70e519a7		2023-06-06 16:00:13.501687	Rumours	11
12	https://i.scdn.co/image/ab67616d0000b27320ee3e86e17f17239bef1f76		2023-06-06 16:00:15.324444	Elvis' Golden Records	12
13	https://i.scdn.co/image/ab67616d0000b273db687db0afb257abdee10816		2023-06-06 16:00:17.866674	Ramones (40th Anniversary Deluxe Edition; 2016 Remaster)	13
14	https://i.scdn.co/image/ab67616d0000b273d0f19de33459c832e50d6ecd		2023-06-06 16:00:26.606058	Never Mind The Bollocks, Here's The Sex Pistols	14
15	https://i.scdn.co/image/ab67616d0000b273ea07dca8b4ca808c1e5b17fb		2023-06-06 16:00:29.808383	Rebel Yell	15
16	https://i.scdn.co/image/ab67616d0000b273b414c63fb435b622238c15ed		2023-06-06 16:00:32.1513	1984 (Remastered)	16
17	https://i.scdn.co/image/ab67616d0000b273222cb38afc3b3b47d9df26aa		2023-06-06 16:00:34.077119	Hysteria (Super Deluxe)	17
18	https://i.scdn.co/image/ab67616d0000b273678a64aa6d061d9bdb38bf59		2023-06-06 16:00:48.652445	ZZCCMXTP	19
19	https://i.scdn.co/image/ab67616d0000b273765b01901c10003211f8554d		2023-06-06 16:01:20.919441	KMT	56
20	https://i.scdn.co/image/ab67616d0000b2733c9df4c3afb30980eec2674e		2023-06-06 16:01:23.738597	La Gaule, Vol.1	62
21	https://i.scdn.co/image/ab67616d0000b273a7d51f8ab02540c9304aaa17		2023-06-06 16:01:25.883408	NO LÈCHE 🚫👅 (feat. Favé, Kerchak & Leto)	56
22	https://i.scdn.co/image/ab67616d0000b2733bbe265a079a047a655036de		2023-06-06 16:01:26.43242	DIAMANT DU BLED	68
23	https://i.scdn.co/image/ab67616d0000b27313166278bd1fcda5f042f067		2023-06-06 16:01:28.668184	Pena Duro	69
24	https://i.scdn.co/image/ab67616d0000b273fbe613b1c15b681dc3e84dfe		2023-06-06 16:01:28.950333	Freestyle LVL UP 1	61
25	https://i.scdn.co/image/ab67616d0000b273390bfa914f9f7b04582aba5d		2023-06-06 16:01:29.347336	2069'	70
26	https://i.scdn.co/image/ab67616d0000b2731bbc72ff946f55d4d3188062		2023-06-06 16:01:31.101145	Mélo	60
27	https://i.scdn.co/image/ab67616d0000b273525d4ed76e5e9926add4ddf7		2023-06-06 16:01:33.857695	TOUTE LA JOURNÉE (feat. Tiakola)	68
28	https://i.scdn.co/image/ab67616d0000b27338a0c9e975d3aee9b44a6918		2023-06-06 16:01:34.253326	Carré	76
29	https://i.scdn.co/image/ab67616d0000b273455e89dbf3ce2e6d337be1d0		2023-06-06 16:01:37.435065	Liens du 100	75
30	https://i.scdn.co/image/ab67616d0000b27384f2454da0973c07a508b57e		2023-06-06 16:01:40.717807	LA RUE	81
31	https://i.scdn.co/image/ab67616d0000b27383a0df30f0edbc00c5fc0d2a		2023-06-06 16:01:41.094098	Finale - Nouvelle École	82
32	https://i.scdn.co/image/ab67616d0000b273a5b741e167ba462c7a10f513		2023-06-06 16:01:41.717816	OMERTA	83
33	https://i.scdn.co/image/ab67616d0000b2731918f9893ae98ff775e5131b		2023-06-06 16:01:46.342985	QUARTIERS NORD	64
34	https://i.scdn.co/image/ab67616d0000b27348f7c15d2c4dde71d11262e6		2023-06-06 16:01:49.602257	En temps réel	88
35	https://i.scdn.co/image/ab67616d0000b273555b1343592ff69545fb2f40		2023-06-06 16:01:53.710876	BRAVE	94
36	https://i.scdn.co/image/ab67616d0000b27325a85b09707f43e178738980		2023-06-06 16:01:56.419217	Yafama - Nouvelle École	96
37	https://i.scdn.co/image/ab67616d0000b2730568d301dec4dcf2ba9cc1b7		2023-06-06 16:01:56.831966	FADE UP	98
38	https://i.scdn.co/image/ab67616d0000b27326e85fce5be13ecf961e7908		2023-06-06 16:01:57.297422	AMF - Nouvelle École	100
39	https://i.scdn.co/image/ab67616d0000b273e07f763b3ac17f8a59aaf40d		2023-06-06 16:01:57.572783	AMBER	68
40	https://i.scdn.co/image/ab67616d0000b27323d7ec27cd876f0f12d6cf66		2023-06-06 16:01:57.894851	Urus	66
41	https://i.scdn.co/image/ab67616d0000b2736d81b7056b0aa3978c341b0e		2023-06-06 16:01:58.168005	Mentalité (Pt. 1)	101
42	https://i.scdn.co/image/ab67616d0000b2736d70a04b5fbec88db801822f		2023-06-06 16:01:59.28087	Sincèrement	74
43	https://i.scdn.co/image/ab67616d0000b2739d3e820b3bd7305215657906		2023-06-06 16:02:08.764632	Taulier	104
44	https://i.scdn.co/image/ab67616d0000b2735a09eb134f4d28030aad22f3		2023-06-06 16:02:11.822708	Jolie Go	110
45	https://i.scdn.co/image/ab67616d0000b273f123e039f29e747ae01e99a1		2023-06-06 16:02:12.134085	Autobahn	99
46	https://i.scdn.co/image/ab67616d0000b27347e2936e1fce8f4441447ac0		2023-06-06 16:02:14.350253	Carolina	61
47	https://i.scdn.co/image/ab67616d0000b273937ce99b134e3586d0bfdb19		2023-06-06 16:02:14.747543	Reinsertado	85
48	https://i.scdn.co/image/ab67616d0000b2735c5d0af166043ea21f1a82b7		2023-06-06 16:02:18.423019	Nous deux	75
49	https://i.scdn.co/image/ab67616d0000b273d80bbf9d8a5194d91185bdb7		2023-06-06 16:02:18.738786	Nocif	74
50	https://i.scdn.co/image/ab67616d0000b273a557147daf896f6c80b79d58		2023-06-06 16:02:19.050593	Saiyan	118
51	https://i.scdn.co/image/ab67616d0000b273b40c6c296952930237c28129		2023-06-06 16:02:33.474918	Babacar (Remasterisé en 2004)	119
52	https://i.scdn.co/image/ab67616d0000b273f9948ef140c5b2cb78b6c039		2023-06-06 16:02:34.865094	Fais-moi une place	120
53	https://i.scdn.co/image/ab67616d0000b273a33e2b9d221b420f2ab1d29f		2023-06-06 16:02:36.727869	D'Eux	121
54	https://i.scdn.co/image/ab67616d0000b273f657d2e6ee8f676801772695		2023-06-06 16:02:38.86113	Singulier 81 - 89	122
55	https://i.scdn.co/image/ab67616d0000b2732cbb7cbad0d269ca17272021		2023-06-06 16:02:43.370658	Samedi soir sur la terre (Remastered)	124
56	https://i.scdn.co/image/ab67616d0000b273952a5747dc31c01872531c0b		2023-06-06 16:02:45.005074	Ca ne tient pas debout (Remasterisé en 2002)	125
57	https://i.scdn.co/image/ab67616d0000b273012ad4c6c1f2f5c4f69eff07		2023-06-06 16:02:46.417771	Douce amère	126
58	https://i.scdn.co/image/ab67616d0000b2737cf9b36fabe38ccb3a5433c2		2023-06-06 16:02:47.372828	Amoureuse (Edition Deluxe)	127
59	https://i.scdn.co/image/ab67616d0000b273999c81ce1ebf4260ecad31c0		2023-06-06 16:02:55.302527	Sauver l'amour (Remastered)	129
60	https://i.scdn.co/image/ab67616d0000b2733a924523a064469c0e19625e		2023-06-06 16:02:56.674952	Le Meilleur De	130
61	https://i.scdn.co/image/ab67616d0000b273f9aeb6e0d2e24c2bbfcdbded		2023-06-06 16:02:59.303773	Club Music 80 (Le meilleur des années 80)	133
62	https://i.scdn.co/image/ab67616d0000b27342fb3255c200750eafaa1e87		2023-06-06 16:03:01.835395	Acoustique	135
63	https://i.scdn.co/image/ab67616d0000b273faa1c1a7a24c46aebf2b4883		2023-06-06 16:03:04.162098	Seul	140
64	https://i.scdn.co/image/ab67616d0000b273535411fade6b4edff148755d		2023-06-06 16:03:06.277318	La Derniere Séance	141
65	https://i.scdn.co/image/ab67616d0000b27317759af07a9a710e24ac6972		2023-06-06 16:03:08.125271	Toujours des fleurs	142
\.


--
-- Data for Name: artiste; Type: TABLE DATA; Schema: public; Owner: spotifaie_user
--

COPY public.artiste (id_artiste, nom_artiste, type_artiste, image_artiste) FROM stdin;
1	Ram Jam	artist	https://i.scdn.co/image/ab67616d0000b273fa5dcfc4b1b99a0598224758
2	The Rolling Stones	artist	https://i.scdn.co/image/ab6761610000e5ebd3cb15a8570cce5a63af63d8
3	ZZ Top	artist	https://i.scdn.co/image/ab6772690000c46ca56aa897505a21aebecf7ea3
4	Aerosmith	artist	https://i.scdn.co/image/ab6761610000e5ebc5733401b4689b2064458e7d
5	Guns N' Roses	artist	https://i.scdn.co/image/ab6761610000e5eb50defaf9fc059a1efc541f4c
6	Nirvana	artist	https://i.scdn.co/image/84282c28d851a700132356381fcfbadc67ff498b
7	KISS	artist	https://i.scdn.co/image/ab6761610000e5eb4e85269a1f35917eddeadefd
8	AC/DC	artist	https://i.scdn.co/image/ab6761610000e5ebc4c77549095c86acb4e77b37
9	Creedence Clearwater Revival	artist	\N
10	Bruce Springsteen	artist	https://i.scdn.co/image/ab6761610000e5ebf7cac48c6b587b927ba73f4e
11	Fleetwood Mac	artist	https://i.scdn.co/image/ab6761610000e5eb249d55f2d68a44637905c57e
12	Elvis Presley	artist	https://i.scdn.co/image/ab6761610000e5eb9a93e273380982dff84c0d7c
13	Ramones	artist	https://i.scdn.co/image/ab6761610000e5eb5b9f46a5c5bf8243179d56b0
14	Sex Pistols	artist	https://i.scdn.co/image/ab6761610000e5ebd3fa01fd4baad1158dd2fd8b
15	Billy Idol	artist	https://i.scdn.co/image/ab6761610000e5ebd42c6334786bfdea92beeb5d
16	Van Halen	artist	https://i.scdn.co/image/ab6761610000e5ebd8475001d2700686e1008dfb
17	Def Leppard	artist	https://i.scdn.co/image/ab6761610000e5eb695e45d9945ce1f8e5fa5c54
18	Stumpus Maximus And The Good Ol Boys	artist	\N
19	KronoMuzik	artist	https://i.scdn.co/image/ab6761610000e5eb0c6fc4b2937da5a4e2de28d4
20	ZZCCMXTP	artist	https://i.scdn.co/image/ab6761610000e5eb3c8baa7ffc49a4980ad3691f
21	Pandrezz	artist	https://i.scdn.co/image/ab6761610000e5eb1a1eda85c4f9443c91e0f307
22	Ronare	artist	https://i.scdn.co/image/ab6761610000e5eb794f4116da13b8fe458dc128
23	Clayton Pasoa	artist	\N
24	Denzel Bacardi	artist	\N
25	Di-Meh	artist	https://i.scdn.co/image/ab6761610000e5eb8fc299eb216c222109dfe06b
26	Sheldon	artist	https://i.scdn.co/image/ab6761610000e5ebf3d1653c9ef75f7741587c65
27	Flem	artist	https://i.scdn.co/image/ab67616d0000b273bd50cec53c3a6b69b1f9c136
28	PLEEG	artist	https://i.scdn.co/image/ab6761610000e5eb68713f4a4fea2be8f02c6e7f
29	Dawn Beats	artist	https://i.scdn.co/image/ab6761610000e5eb52929e65f7138240d7853afe
30	Charly Kid	artist	https://i.scdn.co/image/ab6761610000e5eb7b6078f887c6f75397fde64c
31	Le Règlement	artist	https://i.scdn.co/image/ab6761610000e5eb506e717a3c03d13edbd89d4b
32	Le chroniqueur sale	artist	https://i.scdn.co/image/ab6761610000e5ebbb42d60eab92d7513fd4d1ff
33	Antoine Daniel	artist	\N
34	Baghera Jones	artist	\N
35	Milo	artist	https://i.scdn.co/image/ab6761610000e5ebc5ed13c1d8da828f6ef25225
36	Ephès	artist	https://i.scdn.co/image/ab6761610000e5ebe8b77d532f459d9d29a5fd3a
37	Aline Griet	artist	\N
38	Sensei Kira	artist	\N
39	Alkpote	artist	https://i.scdn.co/image/ab6761610000e5ebac3fac4186f7e417a335161e
40	MisterMV	artist	https://i.scdn.co/image/ab67616d0000b273fd08081109d920e7aa807d37
41	Ocho	artist	https://i.scdn.co/image/ab6761610000e5ebcc0b9cb5c6c2d9ccca2fff16
42	SUPERFLAME	artist	\N
43	Tomo	artist	https://i.scdn.co/image/ab6761610000e5eb248f4f09911c20dadd413a48
44	Aboueb	artist	https://i.scdn.co/image/ab6761610000e5eb539849ba8fe07b6a63853e1e
45	Klemsis	artist	https://i.scdn.co/image/ab67616d0000b2735e8d2704a9ca68aab9dde20f
46	Sopico	artist	https://i.scdn.co/image/ab6761610000e5ebb21fb8e254917964576e9803
47	Roy Markson	artist	https://i.scdn.co/image/ab6761610000e5eb50b6f7c1cdd77ce113d1190d
48	Patrick Baud	artist	\N
49	Pélerine	artist	https://i.scdn.co/image/ab6761610000e5ebeda2020824cc42d46ee7dacf
50	Pv Nova	artist	https://i.scdn.co/image/ab6761610000e5eb4ff7894b7daa11c9073670e3
51	tices	artist	https://i.scdn.co/image/ab6761610000e5ebea6b24f4ea7eb5afeb0a4491
52	Luther	artist	https://i.scdn.co/image/ab6761610000e5ebd728ff97958f04b4d8ecc7d6
53	Mehdi Maizi	artist	\N
54	Zinée	artist	https://i.scdn.co/image/ab6761610000e5ebdfaf822026e3038a37636200
55	Epektase	artist	\N
56	Gazo	artist	https://i.scdn.co/image/ab6761610000e5ebdf33e5e2c98a63331d8dc3fd
57	Damso	artist	https://i.scdn.co/image/ab6761610000e5eb6d1dac9cd0d24eee082f5410
58	M Huncho	artist	https://i.scdn.co/image/ab6761610000e5eb2565e2b9a6311e6b80cf87f8
59	Skread	artist	https://i.scdn.co/image/ab6761610000e5eb3d8d4c4434db95f8532ee766
60	Tiakola	artist	https://i.scdn.co/image/ab6761610000e5eb626f5710c78cea23a437d73d
61	Ninho	artist	https://i.scdn.co/image/ab6761610000e5ebc968daf72ace243d8edcbfc4
62	GAULOIS	artist	https://i.scdn.co/image/ab6761610000e5eb659d3d12d7fd02e404147888
63	Franglish	artist	https://i.scdn.co/image/ab6761610000e5ebde784416af541663d702e461
64	Alonzo	artist	https://i.scdn.co/image/ab6761610000e5eb03a4b453c6c376b9ee3c29ed
65	Leto	artist	https://i.scdn.co/image/ab6761610000e5eb9be5715c092404ef66664a8f
66	Favé	artist	https://i.scdn.co/image/ab6761610000e5ebc0f84a77719f112d3d605a30
67	Kerchak	artist	https://i.scdn.co/image/ab6761610000e5ebe193424f0ccafc29fa507271
68	Zola	artist	https://i.scdn.co/image/ab6761610000e5ebbceb0b4fabbf8639d20ffc42
69	Kaaris	artist	https://i.scdn.co/image/ab6761610000e5eb3b06aa71e1dbdbe9c049582f
70	PLK	artist	https://i.scdn.co/image/ab6761610000e5ebeeb447e57bc8890be1f8715f
71	Dinos	artist	https://i.scdn.co/image/ab6761610000e5ebec87f79ebb6e54d7972949b0
72	Niska	artist	https://i.scdn.co/image/ab6761610000e5eb536e207c626c48b3c2419212
73	Rsko	artist	https://i.scdn.co/image/ab6761610000e5eb10490513b18735fa3af730ce
74	Hamza	artist	https://i.scdn.co/image/ab6761610000e5eb6657e5bf2af650f2f4e1a660
75	SDM	artist	https://i.scdn.co/image/ab6761610000e5ebbff42a7c8e790a52919fa7b9
76	Werenoi	artist	https://i.scdn.co/image/ab6761610000e5eb74208c78d1907b0ae97ef53b
77	Lacrim	artist	https://i.scdn.co/image/ab6761610000e5eb23b44d59f0e2c2914fee7d41
78	Green Montana	artist	https://i.scdn.co/image/ab6761610000e5ebf7abc1cb0844be3de53ce40f
79	Zed	artist	https://i.scdn.co/image/ab6761610000e5eb8200a8a172c6b7510d63ca47
80	Slkrack	artist	https://i.scdn.co/image/ab6761610000e5ebf8ba4452e8e0b8e44150f61a
81	No Limit	artist	https://i.scdn.co/image/ab6761610000e5eb04a6aa4f87ad010146669696
82	Dau	artist	https://i.scdn.co/image/ab6761610000e5eb96a7516a5b5f81a6afb345d8
83	Maes	artist	https://i.scdn.co/image/ab6761610000e5eb85d3fbe4d443ed6b78b73c79
84	Koba LaD	artist	https://i.scdn.co/image/ab6761610000e5ebcaf2416ef3892072fe428910
85	Morad	artist	https://i.scdn.co/image/ab6761610000e5eb78be1444357da95706de5d12
86	GIMS	artist	https://i.scdn.co/image/ab6761610000e5eb77144f838397a467e807df65
87	Kayna Samet	artist	https://i.scdn.co/image/ab6761610000e5eb1772aeec3e8bb8d1c50eace6
88	Naps	artist	https://i.scdn.co/image/ab6761610000e5eb4e51066b03059e52d12c7ee1
89	Skinny Flex	artist	https://i.scdn.co/image/ab6761610000e5ebf97339badf211546d22455f6
90	FAYV	artist	https://i.scdn.co/image/ab6761610000e5eb67f7bfde0e728c84983e95f3
91	Gambi	artist	https://i.scdn.co/image/ab6761610000e5eb4e9ffdb577e1e55accfa9b58
92	Kalif Hardcore	artist	https://i.scdn.co/image/ab6761610000e5ebf438aefebdfd99d881483e5c
93	Imen Es	artist	https://i.scdn.co/image/ab6761610000e5ebd1065304668ab95c865bfaef
94	Landy	artist	https://i.scdn.co/image/ab6761610000e5ebce210c2f8ef25e66bb106fba
95	Ronisia	artist	https://i.scdn.co/image/ab6761610000e5eb510bf2ddf4335c46f83ba89b
96	Yuz Boy	artist	https://i.scdn.co/image/ab6761610000e5ebf316a2d31d7adabaa000af11
97	Bassey Kone	artist	\N
98	ZEG P	artist	https://i.scdn.co/image/ab6761610000e5eb0199daf1a8b49d124fe91315
99	SCH	artist	https://i.scdn.co/image/ab6761610000e5ebeaa3e5f1530c3f89e1034694
100	Coelho	artist	https://i.scdn.co/image/ab6761610000e5ebe047cadd1cd56968944c44f4
101	RK	artist	https://i.scdn.co/image/ab6761610000e5ebe46ef84c146721ed78040925
102	Guy2Bezbar	artist	\N
103	Mig	artist	\N
104	Niro	artist	https://i.scdn.co/image/ab6761610000e5eb41fffa4f7944e1d392511500
105	ElGrandeToto	artist	https://i.scdn.co/image/ab6761610000e5eb5ea99b05e82a358bc048c9b8
106	Tayc	artist	https://i.scdn.co/image/ab6761610000e5ebeaca31624b77ae2746863964
107	TIG	artist	https://i.scdn.co/image/ab67616d0000b27378256cc9096547ac51ea79a5
108	Sofiane Pamart	artist	https://i.scdn.co/image/ab6761610000e5eb5570ab1c5d1d1f0c4dc07594
109	Alpha Wann	artist	https://i.scdn.co/image/ab6761610000e5ebd308bf91fbbf4c9cf8cecc05
110	Shay	artist	https://i.scdn.co/image/ab6761610000e5eb07186516298267cdc60dd5b3
111	So La Lune	artist	https://i.scdn.co/image/ab6761610000e5eb3eb1d0064adc81a1ac146871
112	REDVOLUTION	artist	https://i.scdn.co/image/ab6761610000e5eb8a932721a9722d6924bdfe80
113	Nicki Nicole	artist	https://i.scdn.co/image/ab6761610000e5eb0a6848fdccecdfb31702deb3
114	Eladio Carrion	artist	https://i.scdn.co/image/ab6761610000e5eb87ff3d09a0fdb1fbdaed417b
115	Beny Jr	artist	https://i.scdn.co/image/ab6761610000e5eb807f22297ee3cb75dff9370e
116	Jul	artist	https://i.scdn.co/image/ab6761610000e5eb1c81ee037386e46e8ed081f3
117	Rvfv	artist	https://i.scdn.co/image/ab6761610000e5eb5ce4467266f554d5bfbc8687
118	Heuss L'enfoiré	artist	\N
119	France Gall	artist	https://i.scdn.co/image/e9bb7a31f3253eceb77917a90dab1812982c3716
120	Julien Clerc	artist	https://i.scdn.co/image/ab6761610000e5eb0d7a8b5c6fa40e8f57922dd7
121	Céline Dion	artist	https://i.scdn.co/image/ab6761610000e5eb357f2a87bf92208767a48e7e
122	Jean-Jacques Goldman	artist	https://i.scdn.co/image/ab6761610000e5eb5b0234933d862408792e19a3
123	Sirima	artist	https://i.scdn.co/image/ab6761610000e5eb2c2326fd138105b722b63ab7
124	Francis Cabrel	artist	https://i.scdn.co/image/ab6761610000e5eb0c191bdfaf4114b569e57998
125	Michel Berger	artist	https://i.scdn.co/image/ab6761610000e5eb0ee846203ab5a01e80995fe9
126	Douce amère	artist	https://i.scdn.co/image/ab6761610000e5eb94c3ac8e2e526f54533de468
127	Véronique Sanson	artist	https://i.scdn.co/image/007e32eb29e599f7b64ae838e7535e6d56efc16d
128	Fanny Ardant	artist	https://i.scdn.co/image/ab67616d0000b2731fef301b09b04b314ab8311d
129	Daniel Balavoine	artist	https://i.scdn.co/image/ab6761610000e5ebd5042814e9493751fe84e522
130	Pierre Bachelet	artist	https://i.scdn.co/image/ab6761610000e5ebfd98d7f727ec81ace8be1669
131	Véronique Jannot	artist	https://i.scdn.co/image/ffba604d48617421b13e128b3bfddd8a2b04ede3
132	Florence Arthaud	artist	\N
133	Various Artists	artist	https://i.scdn.co/image/ab6761610000e5eb7462d94efa2db53abba8c003
134	Partenaire Particulier	artist	https://i.scdn.co/image/ab67616d0000b273bd656516296878641c69a7d3
135	Bernard Lavilliers	artist	https://i.scdn.co/image/ab6761610000e5eb87d6dab8501fb476394868b0
136	Catherine Ringer	artist	https://i.scdn.co/image/ab6761610000e5eb8c35630fb6a9dae2b330956c
137	Oxmo Puccino	artist	https://i.scdn.co/image/ab6761610000e5ebe558bce7bf8e5d031189b7d1
138	Jean-Louis Aubert	artist	https://i.scdn.co/image/ab6761610000e5eb2d25b8b7ad1e5fa9caea510c
139	Faada Freddy	artist	https://i.scdn.co/image/ab6761610000e5ebf16323779c6e741cc804747b
140	Garou	artist	https://i.scdn.co/image/ab6761610000e5ebe6941cec2d75ff094b84f222
141	Eddy Mitchell	artist	https://i.scdn.co/image/ab6761610000e5eb61c4398a42e0253b6d8229aa
142	Janie	artist	https://i.scdn.co/image/ab6761610000e5eb944c7ba282760010f12b4269
\.


--
-- Data for Name: artiste_musique; Type: TABLE DATA; Schema: public; Owner: spotifaie_user
--

COPY public.artiste_musique (id_artiste, id_musique, date_ajout) FROM stdin;
2	2	2023-06-06 15:59:56.668687
2	3	2023-06-06 15:59:56.813362
2	4	2023-06-06 15:59:57.027787
2	5	2023-06-06 15:59:57.180126
2	6	2023-06-06 15:59:57.316948
2	7	2023-06-06 15:59:57.448248
2	8	2023-06-06 15:59:57.580388
2	9	2023-06-06 15:59:57.738976
2	10	2023-06-06 15:59:57.879951
2	11	2023-06-06 15:59:58.018771
2	12	2023-06-06 15:59:58.165502
2	13	2023-06-06 15:59:58.339884
3	14	2023-06-06 15:59:58.73536
3	15	2023-06-06 15:59:58.893601
3	16	2023-06-06 15:59:59.060289
3	17	2023-06-06 15:59:59.197824
3	18	2023-06-06 15:59:59.33349
3	19	2023-06-06 15:59:59.47323
3	20	2023-06-06 15:59:59.613389
3	21	2023-06-06 15:59:59.803233
3	22	2023-06-06 15:59:59.963993
3	23	2023-06-06 16:00:00.11249
3	24	2023-06-06 16:00:00.271895
3	25	2023-06-06 16:00:00.415765
3	26	2023-06-06 16:00:00.553959
4	27	2023-06-06 16:00:00.849857
4	28	2023-06-06 16:00:01.041403
4	29	2023-06-06 16:00:01.181985
4	30	2023-06-06 16:00:01.323359
4	31	2023-06-06 16:00:01.462964
4	32	2023-06-06 16:00:01.668442
4	33	2023-06-06 16:00:01.837297
4	34	2023-06-06 16:00:01.9821
5	35	2023-06-06 16:00:02.385399
5	36	2023-06-06 16:00:02.532859
5	37	2023-06-06 16:00:02.651709
5	38	2023-06-06 16:00:02.793392
5	39	2023-06-06 16:00:02.922193
5	40	2023-06-06 16:00:03.115092
5	41	2023-06-06 16:00:03.233411
5	42	2023-06-06 16:00:03.356425
5	43	2023-06-06 16:00:03.478635
5	44	2023-06-06 16:00:03.610422
5	45	2023-06-06 16:00:03.732768
5	46	2023-06-06 16:00:03.856175
6	47	2023-06-06 16:00:04.12318
6	48	2023-06-06 16:00:04.29193
6	49	2023-06-06 16:00:04.417226
6	50	2023-06-06 16:00:04.563219
6	51	2023-06-06 16:00:04.709064
6	52	2023-06-06 16:00:04.825921
6	53	2023-06-06 16:00:04.997912
6	54	2023-06-06 16:00:05.127757
6	55	2023-06-06 16:00:05.278015
6	56	2023-06-06 16:00:05.405508
6	57	2023-06-06 16:00:05.533893
6	58	2023-06-06 16:00:05.670665
6	59	2023-06-06 16:00:05.800664
7	60	2023-06-06 16:00:06.113906
7	61	2023-06-06 16:00:06.264271
7	62	2023-06-06 16:00:06.502691
7	63	2023-06-06 16:00:06.666799
7	64	2023-06-06 16:00:06.813078
7	65	2023-06-06 16:00:06.944314
7	66	2023-06-06 16:00:07.101507
7	67	2023-06-06 16:00:07.24224
7	68	2023-06-06 16:00:07.416713
8	69	2023-06-06 16:00:07.776645
8	70	2023-06-06 16:00:07.916368
8	71	2023-06-06 16:00:08.046267
8	72	2023-06-06 16:00:08.299394
8	73	2023-06-06 16:00:08.427737
8	74	2023-06-06 16:00:08.561156
8	75	2023-06-06 16:00:08.691572
8	76	2023-06-06 16:00:08.845382
8	77	2023-06-06 16:00:08.987798
8	78	2023-06-06 16:00:09.137134
10	79	2023-06-06 16:00:11.843712
10	80	2023-06-06 16:00:11.957677
10	81	2023-06-06 16:00:12.099754
10	82	2023-06-06 16:00:12.222829
10	83	2023-06-06 16:00:12.36303
10	84	2023-06-06 16:00:12.490726
10	85	2023-06-06 16:00:12.627181
10	86	2023-06-06 16:00:12.755386
10	87	2023-06-06 16:00:12.911592
10	88	2023-06-06 16:00:13.035886
10	89	2023-06-06 16:00:13.172526
10	90	2023-06-06 16:00:13.305707
11	91	2023-06-06 16:00:13.642816
11	92	2023-06-06 16:00:13.793891
11	93	2023-06-06 16:00:13.936567
11	94	2023-06-06 16:00:14.073916
11	95	2023-06-06 16:00:14.232767
11	96	2023-06-06 16:00:14.368372
11	97	2023-06-06 16:00:14.523511
11	98	2023-06-06 16:00:14.678296
11	99	2023-06-06 16:00:14.83628
11	100	2023-06-06 16:00:14.987644
11	101	2023-06-06 16:00:15.134502
12	102	2023-06-06 16:00:15.49816
12	103	2023-06-06 16:00:15.639876
12	104	2023-06-06 16:00:15.773541
12	105	2023-06-06 16:00:15.910449
12	106	2023-06-06 16:00:16.064433
12	107	2023-06-06 16:00:16.21076
12	108	2023-06-06 16:00:16.350347
12	109	2023-06-06 16:00:16.529391
12	110	2023-06-06 16:00:16.773813
12	111	2023-06-06 16:00:16.912998
12	112	2023-06-06 16:00:17.064878
12	113	2023-06-06 16:00:17.218948
12	114	2023-06-06 16:00:17.40566
12	115	2023-06-06 16:00:17.565711
13	116	2023-06-06 16:00:18.003452
13	117	2023-06-06 16:00:18.136439
13	118	2023-06-06 16:00:18.287239
13	119	2023-06-06 16:00:18.43738
13	120	2023-06-06 16:00:18.598348
13	121	2023-06-06 16:00:18.753822
13	122	2023-06-06 16:00:18.940031
13	123	2023-06-06 16:00:19.073123
13	124	2023-06-06 16:00:19.230942
13	125	2023-06-06 16:00:19.361065
13	126	2023-06-06 16:00:19.492691
13	127	2023-06-06 16:00:19.622749
13	128	2023-06-06 16:00:19.769077
13	129	2023-06-06 16:00:19.914482
13	130	2023-06-06 16:00:20.06012
13	131	2023-06-06 16:00:20.181221
13	132	2023-06-06 16:00:20.313555
13	133	2023-06-06 16:00:20.444936
13	134	2023-06-06 16:00:20.582572
13	135	2023-06-06 16:00:20.738245
13	136	2023-06-06 16:00:20.893824
13	137	2023-06-06 16:00:21.030474
13	138	2023-06-06 16:00:21.194874
13	139	2023-06-06 16:00:21.345269
13	140	2023-06-06 16:00:21.47998
13	141	2023-06-06 16:00:21.646038
13	142	2023-06-06 16:00:21.771766
13	143	2023-06-06 16:00:21.893531
13	144	2023-06-06 16:00:22.032791
13	145	2023-06-06 16:00:22.161237
13	146	2023-06-06 16:00:22.290618
13	147	2023-06-06 16:00:22.455121
13	148	2023-06-06 16:00:22.611721
13	149	2023-06-06 16:00:22.73571
13	150	2023-06-06 16:00:23.269489
13	151	2023-06-06 16:00:23.402691
13	152	2023-06-06 16:00:23.535683
13	153	2023-06-06 16:00:23.701094
13	154	2023-06-06 16:00:23.820206
13	155	2023-06-06 16:00:23.946949
13	156	2023-06-06 16:00:24.075238
13	157	2023-06-06 16:00:24.223649
13	158	2023-06-06 16:00:24.362919
13	159	2023-06-06 16:00:24.562894
13	160	2023-06-06 16:00:24.694484
13	161	2023-06-06 16:00:25.349037
13	162	2023-06-06 16:00:26.017517
13	163	2023-06-06 16:00:26.161119
13	164	2023-06-06 16:00:26.296693
13	165	2023-06-06 16:00:26.454173
14	166	2023-06-06 16:00:27.22845
14	167	2023-06-06 16:00:27.337203
14	168	2023-06-06 16:00:27.49268
14	169	2023-06-06 16:00:27.626198
14	170	2023-06-06 16:00:27.741093
14	171	2023-06-06 16:00:28.362386
14	172	2023-06-06 16:00:28.994646
14	173	2023-06-06 16:00:29.139535
14	174	2023-06-06 16:00:29.255052
14	175	2023-06-06 16:00:29.378831
14	176	2023-06-06 16:00:29.525043
14	177	2023-06-06 16:00:29.658846
15	178	2023-06-06 16:00:29.958753
15	179	2023-06-06 16:00:30.095958
15	180	2023-06-06 16:00:30.216689
15	181	2023-06-06 16:00:30.347826
15	182	2023-06-06 16:00:30.462953
15	183	2023-06-06 16:00:30.585272
15	184	2023-06-06 16:00:31.211616
15	185	2023-06-06 16:00:31.847936
15	186	2023-06-06 16:00:31.974253
16	187	2023-06-06 16:00:32.771668
16	188	2023-06-06 16:00:32.89482
16	189	2023-06-06 16:00:33.051947
16	190	2023-06-06 16:00:33.19071
16	191	2023-06-06 16:00:33.302488
16	192	2023-06-06 16:00:33.419989
16	193	2023-06-06 16:00:33.564333
16	194	2023-06-06 16:00:33.677175
16	195	2023-06-06 16:00:33.792302
17	196	2023-06-06 16:00:34.220485
17	197	2023-06-06 16:00:34.872396
17	198	2023-06-06 16:00:34.997263
17	199	2023-06-06 16:00:35.627156
17	200	2023-06-06 16:00:35.744388
17	201	2023-06-06 16:00:35.894256
17	202	2023-06-06 16:00:36.027645
17	203	2023-06-06 16:00:36.189434
17	204	2023-06-06 16:00:36.336367
17	205	2023-06-06 16:00:36.529293
17	206	2023-06-06 16:00:36.654953
17	207	2023-06-06 16:00:36.76861
17	208	2023-06-06 16:00:36.895142
17	209	2023-06-06 16:00:37.009447
17	210	2023-06-06 16:00:37.124741
17	211	2023-06-06 16:00:37.295892
17	212	2023-06-06 16:00:37.417777
17	213	2023-06-06 16:00:37.527007
17	214	2023-06-06 16:00:37.644286
17	215	2023-06-06 16:00:37.771204
17	216	2023-06-06 16:00:37.936668
17	217	2023-06-06 16:00:38.0562
18	218	2023-06-06 16:00:38.227628
17	219	2023-06-06 16:00:38.346649
17	220	2023-06-06 16:00:38.497688
17	221	2023-06-06 16:00:38.621833
17	222	2023-06-06 16:00:38.75098
17	223	2023-06-06 16:00:38.867773
17	224	2023-06-06 16:00:39.036889
17	225	2023-06-06 16:00:39.175074
17	226	2023-06-06 16:00:39.297857
17	227	2023-06-06 16:00:39.439776
17	228	2023-06-06 16:00:39.566447
17	229	2023-06-06 16:00:39.695355
17	230	2023-06-06 16:00:40.334787
17	231	2023-06-06 16:00:40.47145
17	232	2023-06-06 16:00:40.618088
17	233	2023-06-06 16:00:40.748762
17	234	2023-06-06 16:00:40.883912
19	235	2023-06-06 16:00:48.7972
20	235	2023-06-06 16:00:48.856721
21	235	2023-06-06 16:00:48.923131
22	235	2023-06-06 16:00:48.981407
19	236	2023-06-06 16:00:49.289128
20	236	2023-06-06 16:00:49.346577
21	236	2023-06-06 16:00:49.399395
22	236	2023-06-06 16:00:49.45078
23	236	2023-06-06 16:00:49.507338
24	236	2023-06-06 16:00:49.564758
19	237	2023-06-06 16:00:49.705867
25	237	2023-06-06 16:00:49.762913
20	237	2023-06-06 16:00:49.81141
21	237	2023-06-06 16:00:49.863311
26	237	2023-06-06 16:00:49.917833
27	237	2023-06-06 16:00:49.975379
22	237	2023-06-06 16:00:50.023863
20	238	2023-06-06 16:00:50.149714
19	238	2023-06-06 16:00:50.207117
28	238	2023-06-06 16:00:50.266142
21	238	2023-06-06 16:00:50.323744
22	238	2023-06-06 16:00:50.38059
29	238	2023-06-06 16:00:50.440755
19	239	2023-06-06 16:00:51.065292
20	239	2023-06-06 16:00:51.114144
30	239	2023-06-06 16:00:51.217364
21	239	2023-06-06 16:00:51.273444
31	239	2023-06-06 16:00:51.344716
32	239	2023-06-06 16:00:51.41257
22	239	2023-06-06 16:00:51.470493
20	240	2023-06-06 16:00:51.61809
19	240	2023-06-06 16:00:51.673776
21	240	2023-06-06 16:00:51.732498
22	240	2023-06-06 16:00:51.780982
19	241	2023-06-06 16:00:52.412777
20	241	2023-06-06 16:00:52.459416
21	241	2023-06-06 16:00:52.517618
22	241	2023-06-06 16:00:52.570128
19	242	2023-06-06 16:00:52.69324
20	242	2023-06-06 16:00:52.740065
33	242	2023-06-06 16:00:52.793394
21	242	2023-06-06 16:00:52.843048
22	242	2023-06-06 16:00:52.899662
34	242	2023-06-06 16:00:52.966592
35	242	2023-06-06 16:00:53.01817
36	242	2023-06-06 16:00:53.078982
20	243	2023-06-06 16:00:53.207488
19	243	2023-06-06 16:00:53.26389
37	243	2023-06-06 16:00:53.326105
21	243	2023-06-06 16:00:53.399456
22	243	2023-06-06 16:00:53.450026
19	244	2023-06-06 16:00:53.580204
20	244	2023-06-06 16:00:53.640687
38	244	2023-06-06 16:00:53.701106
21	244	2023-06-06 16:00:53.752841
22	244	2023-06-06 16:00:53.803304
39	245	2023-06-06 16:00:53.998716
19	245	2023-06-06 16:00:54.045608
20	245	2023-06-06 16:00:54.100773
21	245	2023-06-06 16:00:54.168066
22	245	2023-06-06 16:00:54.225299
19	246	2023-06-06 16:00:54.381728
20	246	2023-06-06 16:00:54.443602
40	246	2023-06-06 16:00:54.504738
21	246	2023-06-06 16:00:54.560193
22	246	2023-06-06 16:00:54.61839
19	247	2023-06-06 16:00:54.733986
20	247	2023-06-06 16:00:54.786952
41	247	2023-06-06 16:00:54.846909
21	247	2023-06-06 16:00:54.901768
22	247	2023-06-06 16:00:54.955192
42	247	2023-06-06 16:00:55.030207
19	248	2023-06-06 16:00:55.647104
20	248	2023-06-06 16:00:55.699239
43	248	2023-06-06 16:00:55.757198
21	248	2023-06-06 16:00:55.80944
22	248	2023-06-06 16:00:55.877839
44	248	2023-06-06 16:00:55.941801
45	248	2023-06-06 16:00:55.997143
46	249	2023-06-06 16:00:56.694296
19	249	2023-06-06 16:00:56.752073
20	249	2023-06-06 16:00:56.799397
22	249	2023-06-06 16:00:56.848394
21	249	2023-06-06 16:00:56.9036
29	249	2023-06-06 16:00:56.956064
47	250	2023-06-06 16:00:57.152438
19	250	2023-06-06 16:00:57.202344
20	250	2023-06-06 16:00:57.253574
21	250	2023-06-06 16:00:57.313689
22	250	2023-06-06 16:00:57.385243
48	250	2023-06-06 16:00:57.43959
20	251	2023-06-06 16:00:57.666628
19	251	2023-06-06 16:00:57.714686
49	251	2023-06-06 16:00:57.775873
21	251	2023-06-06 16:00:57.826579
50	251	2023-06-06 16:00:57.8958
22	251	2023-06-06 16:00:57.946071
51	251	2023-06-06 16:00:58.002394
19	252	2023-06-06 16:00:58.127292
20	252	2023-06-06 16:00:58.185816
52	252	2023-06-06 16:00:58.241994
21	252	2023-06-06 16:00:58.291685
22	252	2023-06-06 16:00:58.347872
19	253	2023-06-06 16:00:58.500631
20	253	2023-06-06 16:00:58.578386
21	253	2023-06-06 16:00:58.630039
22	253	2023-06-06 16:00:58.701001
19	254	2023-06-06 16:00:59.168028
20	254	2023-06-06 16:00:59.225652
53	254	2023-06-06 16:00:59.310414
21	254	2023-06-06 16:00:59.365577
22	254	2023-06-06 16:00:59.415341
20	255	2023-06-06 16:00:59.568952
19	255	2023-06-06 16:00:59.632873
21	255	2023-06-06 16:00:59.692293
22	255	2023-06-06 16:00:59.756
54	256	2023-06-06 16:00:59.915558
19	256	2023-06-06 16:00:59.949133
20	256	2023-06-06 16:00:59.983455
55	256	2023-06-06 16:01:00.027014
21	256	2023-06-06 16:01:00.060121
22	256	2023-06-06 16:01:00.091721
56	257	2023-06-06 16:01:21.04916
56	258	2023-06-06 16:01:21.195193
57	258	2023-06-06 16:01:21.286658
56	259	2023-06-06 16:01:21.409837
56	260	2023-06-06 16:01:21.538011
56	261	2023-06-06 16:01:21.774334
56	262	2023-06-06 16:01:21.913526
58	262	2023-06-06 16:01:21.983433
56	263	2023-06-06 16:01:22.113585
59	263	2023-06-06 16:01:22.200103
56	264	2023-06-06 16:01:22.415271
56	265	2023-06-06 16:01:22.553113
56	266	2023-06-06 16:01:22.687604
56	267	2023-06-06 16:01:22.844439
56	268	2023-06-06 16:01:22.978685
56	269	2023-06-06 16:01:23.122012
56	270	2023-06-06 16:01:23.257095
60	270	2023-06-06 16:01:23.333743
56	271	2023-06-06 16:01:23.466977
61	271	2023-06-06 16:01:23.531865
62	272	2023-06-06 16:01:23.867037
62	273	2023-06-06 16:01:23.982431
62	274	2023-06-06 16:01:24.100867
61	274	2023-06-06 16:01:24.161216
62	275	2023-06-06 16:01:24.301763
62	276	2023-06-06 16:01:24.427896
63	276	2023-06-06 16:01:24.493021
62	277	2023-06-06 16:01:24.624781
64	277	2023-06-06 16:01:24.696062
62	278	2023-06-06 16:01:24.831169
62	279	2023-06-06 16:01:24.961153
62	280	2023-06-06 16:01:25.082145
62	281	2023-06-06 16:01:25.204987
62	282	2023-06-06 16:01:25.327061
62	283	2023-06-06 16:01:25.447255
65	283	2023-06-06 16:01:25.509117
62	284	2023-06-06 16:01:25.624953
62	285	2023-06-06 16:01:25.753576
56	286	2023-06-06 16:01:26.038204
66	286	2023-06-06 16:01:26.104366
67	286	2023-06-06 16:01:26.174
65	286	2023-06-06 16:01:26.229333
68	287	2023-06-06 16:01:26.561667
68	288	2023-06-06 16:01:26.681565
68	289	2023-06-06 16:01:26.801356
57	289	2023-06-06 16:01:26.857735
68	290	2023-06-06 16:01:26.971372
68	291	2023-06-06 16:01:27.097048
68	292	2023-06-06 16:01:27.217314
68	293	2023-06-06 16:01:27.338528
68	294	2023-06-06 16:01:27.476847
60	294	2023-06-06 16:01:27.535945
68	295	2023-06-06 16:01:27.669124
68	296	2023-06-06 16:01:27.861989
68	297	2023-06-06 16:01:27.988771
68	298	2023-06-06 16:01:28.121331
68	299	2023-06-06 16:01:28.239305
68	300	2023-06-06 16:01:28.380584
68	301	2023-06-06 16:01:28.543961
69	302	2023-06-06 16:01:28.815211
61	303	2023-06-06 16:01:29.149643
70	304	2023-06-06 16:01:29.50628
70	305	2023-06-06 16:01:29.675077
70	306	2023-06-06 16:01:29.815569
71	306	2023-06-06 16:01:29.87895
70	307	2023-06-06 16:01:30.017931
70	308	2023-06-06 16:01:30.14436
70	309	2023-06-06 16:01:30.289104
67	309	2023-06-06 16:01:30.36226
70	310	2023-06-06 16:01:30.509027
70	311	2023-06-06 16:01:30.639802
70	312	2023-06-06 16:01:30.772293
70	313	2023-06-06 16:01:30.908459
60	314	2023-06-06 16:01:31.227349
60	315	2023-06-06 16:01:31.482377
60	316	2023-06-06 16:01:31.604058
60	317	2023-06-06 16:01:31.901773
60	318	2023-06-06 16:01:32.024319
60	319	2023-06-06 16:01:32.183667
72	319	2023-06-06 16:01:32.275103
56	319	2023-06-06 16:01:32.324532
60	320	2023-06-06 16:01:32.470791
60	321	2023-06-06 16:01:32.593115
60	322	2023-06-06 16:01:32.707035
73	322	2023-06-06 16:01:32.777881
60	323	2023-06-06 16:01:32.903762
60	324	2023-06-06 16:01:33.016916
60	325	2023-06-06 16:01:33.133163
60	326	2023-06-06 16:01:33.24767
74	326	2023-06-06 16:01:33.301687
60	327	2023-06-06 16:01:33.419689
75	327	2023-06-06 16:01:33.47558
60	328	2023-06-06 16:01:33.624777
60	329	2023-06-06 16:01:33.742592
68	330	2023-06-06 16:01:33.981889
60	330	2023-06-06 16:01:34.035116
76	331	2023-06-06 16:01:34.366833
76	332	2023-06-06 16:01:34.72576
76	333	2023-06-06 16:01:34.853629
61	333	2023-06-06 16:01:34.910926
76	334	2023-06-06 16:01:35.092359
76	335	2023-06-06 16:01:35.228754
76	336	2023-06-06 16:01:35.350099
76	337	2023-06-06 16:01:35.588443
76	338	2023-06-06 16:01:35.713614
60	338	2023-06-06 16:01:35.76463
76	339	2023-06-06 16:01:35.901224
76	340	2023-06-06 16:01:36.021841
76	341	2023-06-06 16:01:36.150068
76	342	2023-06-06 16:01:36.287265
77	342	2023-06-06 16:01:36.349664
76	343	2023-06-06 16:01:36.511252
76	344	2023-06-06 16:01:36.698725
70	344	2023-06-06 16:01:36.753482
76	345	2023-06-06 16:01:36.902703
76	346	2023-06-06 16:01:37.019631
76	347	2023-06-06 16:01:37.136777
76	348	2023-06-06 16:01:37.257958
75	349	2023-06-06 16:01:37.557969
75	350	2023-06-06 16:01:37.69704
75	351	2023-06-06 16:01:37.822083
75	352	2023-06-06 16:01:37.944985
78	352	2023-06-06 16:01:38.001497
75	353	2023-06-06 16:01:38.114618
75	354	2023-06-06 16:01:38.309601
75	355	2023-06-06 16:01:38.613735
72	355	2023-06-06 16:01:38.67013
75	356	2023-06-06 16:01:39.010071
75	357	2023-06-06 16:01:39.136089
75	358	2023-06-06 16:01:39.268205
79	358	2023-06-06 16:01:39.338104
80	358	2023-06-06 16:01:39.441923
75	359	2023-06-06 16:01:40.024624
75	360	2023-06-06 16:01:40.151776
60	360	2023-06-06 16:01:40.202112
75	361	2023-06-06 16:01:40.314703
75	362	2023-06-06 16:01:40.456928
75	363	2023-06-06 16:01:40.601159
81	364	2023-06-06 16:01:40.837067
56	364	2023-06-06 16:01:40.886607
57	364	2023-06-06 16:01:40.94915
82	365	2023-06-06 16:01:41.510807
83	366	2023-06-06 16:01:41.869594
83	367	2023-06-06 16:01:41.999338
83	368	2023-06-06 16:01:42.117905
83	369	2023-06-06 16:01:42.534612
83	370	2023-06-06 16:01:43.051057
83	371	2023-06-06 16:01:43.190702
83	372	2023-06-06 16:01:43.345919
83	373	2023-06-06 16:01:43.469351
56	373	2023-06-06 16:01:43.51669
83	374	2023-06-06 16:01:43.651747
84	374	2023-06-06 16:01:43.707485
83	375	2023-06-06 16:01:43.89549
83	376	2023-06-06 16:01:44.274964
72	376	2023-06-06 16:01:44.326748
83	377	2023-06-06 16:01:44.449455
83	378	2023-06-06 16:01:44.580762
85	378	2023-06-06 16:01:44.699645
83	379	2023-06-06 16:01:45.013815
83	380	2023-06-06 16:01:45.174896
86	380	2023-06-06 16:01:45.239312
83	381	2023-06-06 16:01:45.368275
83	382	2023-06-06 16:01:45.512763
87	382	2023-06-06 16:01:45.585965
83	383	2023-06-06 16:01:45.727305
83	384	2023-06-06 16:01:45.984799
83	385	2023-06-06 16:01:46.177431
64	386	2023-06-06 16:01:46.513333
64	387	2023-06-06 16:01:46.667407
64	388	2023-06-06 16:01:46.793659
64	389	2023-06-06 16:01:46.959459
64	390	2023-06-06 16:01:47.103374
64	391	2023-06-06 16:01:47.245314
64	392	2023-06-06 16:01:47.378635
64	393	2023-06-06 16:01:47.524603
64	394	2023-06-06 16:01:47.647744
61	394	2023-06-06 16:01:47.743436
88	394	2023-06-06 16:01:47.829993
64	395	2023-06-06 16:01:47.968008
89	395	2023-06-06 16:01:48.031485
64	396	2023-06-06 16:01:48.167553
90	396	2023-06-06 16:01:48.233127
64	397	2023-06-06 16:01:48.374094
64	398	2023-06-06 16:01:48.508732
64	399	2023-06-06 16:01:48.65277
64	400	2023-06-06 16:01:49.051275
64	401	2023-06-06 16:01:49.178876
64	402	2023-06-06 16:01:49.313213
88	403	2023-06-06 16:01:49.739161
88	404	2023-06-06 16:01:49.869703
56	404	2023-06-06 16:01:49.936798
61	404	2023-06-06 16:01:49.995151
88	405	2023-06-06 16:01:50.130105
88	406	2023-06-06 16:01:50.270975
91	406	2023-06-06 16:01:50.331299
88	407	2023-06-06 16:01:50.55338
88	408	2023-06-06 16:01:50.685078
88	409	2023-06-06 16:01:50.923021
88	410	2023-06-06 16:01:51.081894
84	410	2023-06-06 16:01:51.13383
83	410	2023-06-06 16:01:51.184776
88	411	2023-06-06 16:01:51.547545
88	412	2023-06-06 16:01:51.703149
88	413	2023-06-06 16:01:51.828474
92	413	2023-06-06 16:01:51.889545
88	414	2023-06-06 16:01:52.036152
88	415	2023-06-06 16:01:52.157575
93	415	2023-06-06 16:01:52.214762
88	416	2023-06-06 16:01:52.351229
88	417	2023-06-06 16:01:52.488918
88	418	2023-06-06 16:01:52.605844
88	419	2023-06-06 16:01:52.748151
88	420	2023-06-06 16:01:52.900116
88	421	2023-06-06 16:01:53.029385
88	422	2023-06-06 16:01:53.160142
92	422	2023-06-06 16:01:53.215053
88	423	2023-06-06 16:01:53.393733
88	424	2023-06-06 16:01:53.517529
94	425	2023-06-06 16:01:53.846149
94	426	2023-06-06 16:01:54.09758
94	427	2023-06-06 16:01:54.256307
94	428	2023-06-06 16:01:54.378677
56	428	2023-06-06 16:01:54.433403
94	429	2023-06-06 16:01:54.552113
94	430	2023-06-06 16:01:54.665267
65	430	2023-06-06 16:01:54.720918
73	430	2023-06-06 16:01:54.779563
94	431	2023-06-06 16:01:54.899704
94	432	2023-06-06 16:01:55.178765
94	433	2023-06-06 16:01:55.309369
75	433	2023-06-06 16:01:55.368537
94	434	2023-06-06 16:01:55.49184
94	435	2023-06-06 16:01:55.641087
95	435	2023-06-06 16:01:55.705291
94	436	2023-06-06 16:01:55.822979
94	437	2023-06-06 16:01:56.027501
94	438	2023-06-06 16:01:56.155443
94	439	2023-06-06 16:01:56.304132
96	440	2023-06-06 16:01:56.633003
97	440	2023-06-06 16:01:56.691074
98	441	2023-06-06 16:01:56.963234
74	441	2023-06-06 16:01:57.025902
99	441	2023-06-06 16:01:57.131139
100	442	2023-06-06 16:01:57.420979
68	443	2023-06-06 16:01:57.768445
66	444	2023-06-06 16:01:58.02013
101	445	2023-06-06 16:01:58.302867
101	446	2023-06-06 16:01:58.464432
84	446	2023-06-06 16:01:58.523239
101	447	2023-06-06 16:01:58.683236
101	448	2023-06-06 16:01:58.824296
102	448	2023-06-06 16:01:58.871599
103	448	2023-06-06 16:01:58.913078
104	449	2023-06-06 16:02:08.910136
104	450	2023-06-06 16:02:09.057708
104	451	2023-06-06 16:02:09.178146
104	452	2023-06-06 16:02:09.464783
105	452	2023-06-06 16:02:09.538292
104	453	2023-06-06 16:02:09.671308
104	454	2023-06-06 16:02:09.813987
106	454	2023-06-06 16:02:09.877243
104	455	2023-06-06 16:02:10.012255
104	456	2023-06-06 16:02:10.161917
107	456	2023-06-06 16:02:10.218593
104	457	2023-06-06 16:02:10.388913
104	458	2023-06-06 16:02:10.50592
104	459	2023-06-06 16:02:10.626178
72	459	2023-06-06 16:02:10.721991
104	460	2023-06-06 16:02:10.85728
104	461	2023-06-06 16:02:10.979739
108	461	2023-06-06 16:02:11.045574
104	462	2023-06-06 16:02:11.175504
109	462	2023-06-06 16:02:11.241103
104	463	2023-06-06 16:02:11.389485
104	464	2023-06-06 16:02:11.54461
104	465	2023-06-06 16:02:11.698763
110	466	2023-06-06 16:02:11.95595
99	467	2023-06-06 16:02:12.280666
99	468	2023-06-06 16:02:12.428218
99	469	2023-06-06 16:02:12.559995
99	470	2023-06-06 16:02:12.692992
71	470	2023-06-06 16:02:12.750793
99	471	2023-06-06 16:02:12.8961
99	472	2023-06-06 16:02:13.038416
99	473	2023-06-06 16:02:13.173797
99	474	2023-06-06 16:02:13.304707
111	474	2023-06-06 16:02:13.370839
99	475	2023-06-06 16:02:13.526332
99	476	2023-06-06 16:02:13.666922
99	477	2023-06-06 16:02:13.815685
99	478	2023-06-06 16:02:13.954067
99	479	2023-06-06 16:02:14.099228
99	480	2023-06-06 16:02:14.225351
61	481	2023-06-06 16:02:14.509666
112	481	2023-06-06 16:02:14.592276
85	482	2023-06-06 16:02:14.875131
85	483	2023-06-06 16:02:15.032961
113	483	2023-06-06 16:02:15.099724
85	484	2023-06-06 16:02:15.25949
85	485	2023-06-06 16:02:15.409381
85	486	2023-06-06 16:02:15.548358
114	486	2023-06-06 16:02:15.609651
115	486	2023-06-06 16:02:15.678055
85	487	2023-06-06 16:02:15.874792
85	488	2023-06-06 16:02:16.007218
85	489	2023-06-06 16:02:16.142094
85	490	2023-06-06 16:02:16.276309
61	490	2023-06-06 16:02:16.369118
85	491	2023-06-06 16:02:16.534736
85	492	2023-06-06 16:02:16.667003
116	492	2023-06-06 16:02:16.740793
85	493	2023-06-06 16:02:16.88809
85	494	2023-06-06 16:02:17.046429
105	494	2023-06-06 16:02:17.363792
85	495	2023-06-06 16:02:17.497504
117	495	2023-06-06 16:02:17.562715
85	496	2023-06-06 16:02:17.727683
85	497	2023-06-06 16:02:17.879014
85	498	2023-06-06 16:02:18.013745
85	499	2023-06-06 16:02:18.153371
85	500	2023-06-06 16:02:18.297126
75	501	2023-06-06 16:02:18.565636
74	502	2023-06-06 16:02:18.875154
57	502	2023-06-06 16:02:18.936383
119	503	2023-06-06 16:02:33.607045
119	504	2023-06-06 16:02:33.747934
119	505	2023-06-06 16:02:33.87782
119	506	2023-06-06 16:02:33.993351
119	507	2023-06-06 16:02:34.113986
119	508	2023-06-06 16:02:34.233088
119	509	2023-06-06 16:02:34.36451
119	510	2023-06-06 16:02:34.485132
119	511	2023-06-06 16:02:34.704031
120	512	2023-06-06 16:02:35.021079
120	513	2023-06-06 16:02:35.156084
120	514	2023-06-06 16:02:35.289951
120	515	2023-06-06 16:02:35.409928
120	516	2023-06-06 16:02:35.5483
120	517	2023-06-06 16:02:35.702124
120	518	2023-06-06 16:02:35.82539
120	519	2023-06-06 16:02:35.951995
120	520	2023-06-06 16:02:36.123842
120	521	2023-06-06 16:02:36.286572
120	522	2023-06-06 16:02:36.41728
120	523	2023-06-06 16:02:36.543961
121	524	2023-06-06 16:02:36.871636
121	525	2023-06-06 16:02:37.034013
121	526	2023-06-06 16:02:37.19246
121	527	2023-06-06 16:02:37.334801
121	528	2023-06-06 16:02:37.495008
121	529	2023-06-06 16:02:37.658642
121	530	2023-06-06 16:02:37.80688
121	531	2023-06-06 16:02:37.954253
121	532	2023-06-06 16:02:38.115276
122	532	2023-06-06 16:02:38.193707
121	533	2023-06-06 16:02:38.346736
121	534	2023-06-06 16:02:38.483088
121	535	2023-06-06 16:02:38.618217
122	536	2023-06-06 16:02:38.989235
122	537	2023-06-06 16:02:39.120488
122	538	2023-06-06 16:02:39.264603
122	539	2023-06-06 16:02:39.392013
122	540	2023-06-06 16:02:39.5329
122	541	2023-06-06 16:02:40.086841
122	542	2023-06-06 16:02:40.224449
122	543	2023-06-06 16:02:40.434365
122	544	2023-06-06 16:02:40.587333
122	545	2023-06-06 16:02:40.718716
122	546	2023-06-06 16:02:40.849828
122	547	2023-06-06 16:02:40.971668
122	548	2023-06-06 16:02:41.100433
122	549	2023-06-06 16:02:41.262845
122	550	2023-06-06 16:02:41.734867
122	551	2023-06-06 16:02:41.866246
122	552	2023-06-06 16:02:42.005542
123	552	2023-06-06 16:02:42.06288
122	553	2023-06-06 16:02:42.187241
122	554	2023-06-06 16:02:42.319628
122	555	2023-06-06 16:02:42.477583
122	556	2023-06-06 16:02:42.649944
122	557	2023-06-06 16:02:42.796361
122	558	2023-06-06 16:02:42.944826
122	559	2023-06-06 16:02:43.074822
122	560	2023-06-06 16:02:43.209941
124	561	2023-06-06 16:02:43.508371
124	562	2023-06-06 16:02:43.638314
124	563	2023-06-06 16:02:43.877594
124	564	2023-06-06 16:02:44.017992
124	565	2023-06-06 16:02:44.147737
124	566	2023-06-06 16:02:44.301889
124	567	2023-06-06 16:02:44.427587
124	568	2023-06-06 16:02:44.572435
124	569	2023-06-06 16:02:44.731526
124	570	2023-06-06 16:02:44.853808
125	571	2023-06-06 16:02:45.128458
125	572	2023-06-06 16:02:45.309188
125	573	2023-06-06 16:02:45.464928
125	574	2023-06-06 16:02:45.600952
125	575	2023-06-06 16:02:45.740545
125	576	2023-06-06 16:02:45.878267
125	577	2023-06-06 16:02:45.995478
125	578	2023-06-06 16:02:46.130567
125	579	2023-06-06 16:02:46.26462
126	580	2023-06-06 16:02:46.546074
126	581	2023-06-06 16:02:46.690763
126	582	2023-06-06 16:02:46.829121
126	583	2023-06-06 16:02:46.999025
126	584	2023-06-06 16:02:47.156904
127	585	2023-06-06 16:02:47.49984
127	586	2023-06-06 16:02:47.622593
127	587	2023-06-06 16:02:47.75298
127	588	2023-06-06 16:02:47.884
127	589	2023-06-06 16:02:48.034449
127	590	2023-06-06 16:02:48.175035
127	591	2023-06-06 16:02:48.594309
127	592	2023-06-06 16:02:49.135483
127	593	2023-06-06 16:02:49.525666
127	594	2023-06-06 16:02:49.826013
127	595	2023-06-06 16:02:50.146186
127	596	2023-06-06 16:02:50.466767
127	597	2023-06-06 16:02:50.766941
128	597	2023-06-06 16:02:50.930131
127	598	2023-06-06 16:02:51.216212
127	599	2023-06-06 16:02:51.517275
127	600	2023-06-06 16:02:51.849688
127	601	2023-06-06 16:02:52.10263
127	602	2023-06-06 16:02:52.231897
127	603	2023-06-06 16:02:52.391663
127	604	2023-06-06 16:02:52.523339
127	605	2023-06-06 16:02:52.653249
127	606	2023-06-06 16:02:52.767384
127	607	2023-06-06 16:02:52.911632
127	608	2023-06-06 16:02:53.058668
127	609	2023-06-06 16:02:53.207748
127	610	2023-06-06 16:02:53.330252
127	611	2023-06-06 16:02:53.446159
127	612	2023-06-06 16:02:53.579788
127	613	2023-06-06 16:02:53.716762
127	614	2023-06-06 16:02:53.884179
127	615	2023-06-06 16:02:54.027042
127	616	2023-06-06 16:02:54.162024
127	617	2023-06-06 16:02:54.323686
127	618	2023-06-06 16:02:54.45374
127	619	2023-06-06 16:02:54.578007
127	620	2023-06-06 16:02:54.711635
127	621	2023-06-06 16:02:54.858955
127	622	2023-06-06 16:02:55.007725
127	623	2023-06-06 16:02:55.129266
129	624	2023-06-06 16:02:55.419778
129	625	2023-06-06 16:02:55.569747
129	626	2023-06-06 16:02:55.697701
129	627	2023-06-06 16:02:55.824886
129	628	2023-06-06 16:02:55.978866
129	629	2023-06-06 16:02:56.109125
129	630	2023-06-06 16:02:56.2266
129	631	2023-06-06 16:02:56.353623
129	632	2023-06-06 16:02:56.493276
130	633	2023-06-06 16:02:56.792724
131	633	2023-06-06 16:02:56.860203
130	634	2023-06-06 16:02:57.095534
130	635	2023-06-06 16:02:57.250628
130	636	2023-06-06 16:02:57.381092
132	636	2023-06-06 16:02:57.447417
130	637	2023-06-06 16:02:57.574435
130	638	2023-06-06 16:02:57.692663
130	639	2023-06-06 16:02:57.812782
130	640	2023-06-06 16:02:57.934151
130	641	2023-06-06 16:02:58.053413
130	642	2023-06-06 16:02:58.210448
130	643	2023-06-06 16:02:58.352517
130	644	2023-06-06 16:02:58.48929
130	645	2023-06-06 16:02:58.652797
130	646	2023-06-06 16:02:58.769209
130	647	2023-06-06 16:02:58.896032
130	648	2023-06-06 16:02:59.020956
130	649	2023-06-06 16:02:59.156344
134	650	2023-06-06 16:02:59.487047
135	651	2023-06-06 16:03:01.970503
135	652	2023-06-06 16:03:02.100931
135	653	2023-06-06 16:03:02.265303
135	654	2023-06-06 16:03:02.393086
136	654	2023-06-06 16:03:02.461879
135	655	2023-06-06 16:03:02.596853
135	656	2023-06-06 16:03:02.724988
135	657	2023-06-06 16:03:02.850503
137	657	2023-06-06 16:03:02.91021
135	658	2023-06-06 16:03:03.04686
135	659	2023-06-06 16:03:03.177777
135	660	2023-06-06 16:03:03.316706
135	661	2023-06-06 16:03:03.446527
138	661	2023-06-06 16:03:03.507865
135	662	2023-06-06 16:03:03.638351
135	663	2023-06-06 16:03:03.819962
135	664	2023-06-06 16:03:03.934277
139	664	2023-06-06 16:03:03.998327
140	665	2023-06-06 16:03:04.307789
140	666	2023-06-06 16:03:04.432917
140	667	2023-06-06 16:03:04.563258
140	668	2023-06-06 16:03:04.683004
140	669	2023-06-06 16:03:04.864009
121	669	2023-06-06 16:03:04.927304
140	670	2023-06-06 16:03:05.045052
140	671	2023-06-06 16:03:05.182505
140	672	2023-06-06 16:03:05.330057
140	673	2023-06-06 16:03:05.446913
140	674	2023-06-06 16:03:05.560519
140	675	2023-06-06 16:03:05.684898
140	676	2023-06-06 16:03:05.83872
140	677	2023-06-06 16:03:05.966005
140	678	2023-06-06 16:03:06.095283
141	679	2023-06-06 16:03:06.421489
141	680	2023-06-06 16:03:06.558779
141	681	2023-06-06 16:03:06.73989
141	682	2023-06-06 16:03:06.875447
141	683	2023-06-06 16:03:06.993676
141	684	2023-06-06 16:03:07.154609
141	685	2023-06-06 16:03:07.27664
141	686	2023-06-06 16:03:07.393208
141	687	2023-06-06 16:03:07.546685
141	688	2023-06-06 16:03:07.676673
141	689	2023-06-06 16:03:07.793273
141	690	2023-06-06 16:03:07.972343
142	691	2023-06-06 16:03:08.249843
142	692	2023-06-06 16:03:08.371658
142	693	2023-06-06 16:03:08.502637
142	694	2023-06-06 16:03:08.621406
142	695	2023-06-06 16:03:08.74127
142	696	2023-06-06 16:03:08.897114
142	697	2023-06-06 16:03:09.013801
142	698	2023-06-06 16:03:09.140613
\.


--
-- Data for Name: file_attente; Type: TABLE DATA; Schema: public; Owner: spotifaie_user
--

COPY public.file_attente (id_musique, id_user, date_ajout) FROM stdin;
237	1	2023-06-06 16:17:00.039142
238	1	2023-06-06 16:17:00.068212
239	1	2023-06-06 16:17:00.098116
240	1	2023-06-06 16:17:00.127732
241	1	2023-06-06 16:17:00.158217
242	1	2023-06-06 16:17:00.187978
243	1	2023-06-06 16:17:00.209335
244	1	2023-06-06 16:17:00.237363
245	1	2023-06-06 16:17:00.258226
246	1	2023-06-06 16:17:00.278591
247	1	2023-06-06 16:17:00.30476
248	1	2023-06-06 16:17:00.333982
249	1	2023-06-06 16:17:00.361045
250	1	2023-06-06 16:17:00.38164
251	1	2023-06-06 16:17:00.409325
252	1	2023-06-06 16:17:00.438368
253	1	2023-06-06 16:17:00.467084
254	1	2023-06-06 16:17:00.496633
256	1	2023-06-06 16:17:00.526012
\.


--
-- Data for Name: historique; Type: TABLE DATA; Schema: public; Owner: spotifaie_user
--

COPY public.historique (id_musique, id_user, date_ajout) FROM stdin;
279	1	2023-06-06 16:03:39.976608
176	1	2023-06-06 16:03:44.595451
232	1	2023-06-06 16:03:54
466	1	2023-06-06 16:04:09.511301
156	1	2023-06-06 16:07:20.196224
540	1	2023-06-06 16:09:49.08561
208	1	2023-06-06 16:12:15.432796
403	1	2023-06-06 16:15:02.090986
404	1	2023-06-06 16:16:29
508	1	2023-06-06 16:16:47
1	1	2023-06-06 16:16:50
236	1	2023-06-06 17:08:58
260	1	2023-06-06 18:08:24
\.


--
-- Data for Name: like_musique; Type: TABLE DATA; Schema: public; Owner: spotifaie_user
--

COPY public.like_musique (id_musique, id_user, date_ajout) FROM stdin;
\.


--
-- Data for Name: musique; Type: TABLE DATA; Schema: public; Owner: spotifaie_user
--

COPY public.musique (id_musique, titre_musique, temps_musique, url_musique, id_spotify, id_artiste_principale, id_album, nb_like) FROM stdin;
1	Black Betty	237893	https://r2.ackimixs.xyz/1.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	2ZOTtG7v1OrSNs6EINIGb4	1	1	0
2	Mercy Mercy - Remastered 2002	164706	https://r2.ackimixs.xyz/2.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	1XYnzNHGG50lDNHVotRkyX	2	2	0
3	Hitch Hike - Remastered 2002	145640	https://r2.ackimixs.xyz/3.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	46kq7eoX26e9MdhDwDmcye	2	2	0
4	The Last Time - Mono Version	221493	https://r2.ackimixs.xyz/4.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	7foiOmd1Je7Z0D3TaZCDro	2	2	0
5	That's How Strong My Love Is - Remastered 2002	145226	https://r2.ackimixs.xyz/5.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	0mxvBDxJNhrMEsfzAaegBJ	2	2	0
6	Good Times - Remastered 2002	118293	https://r2.ackimixs.xyz/6.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	6g9SQevPDTmGe5kFY3JrGc	2	2	0
7	I'm Alright - Live	143586	https://r2.ackimixs.xyz/7.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	48qISZnlpVboOBRAiaudbS	2	2	0
8	(I Can't Get No) Satisfaction - Mono Version	222813	https://r2.ackimixs.xyz/8.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	2PzU4IB8Dr6mxV3lHuaG34	2	2	0
9	Cry To Me - Remastered 2002	189013	https://r2.ackimixs.xyz/9.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       	73PU7Mr8JSuiX0PTYTLQuP	2	2	0
10	The Under Assistant West Coast Promotion Man - Edit / Mono Version	187346	https://r2.ackimixs.xyz/10.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	5LPXMGOugWXduwFMglL4ra	2	2	0
11	Play With Fire - Mono Version	133320	https://r2.ackimixs.xyz/11.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	30V02AmDYMRvrHE4L8cZAo	2	2	0
12	The Spider And The Fly - Remastered 2002	218026	https://r2.ackimixs.xyz/12.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	0UeKMKb98sqhKhbKYdCxf4	2	2	0
13	One More Try - Remastered 2002	118013	https://r2.ackimixs.xyz/13.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	31cv3fhKrFy6UTrWIY5mSD	2	2	0
14	Waitin' for the Bus - 2006 Remaster	173266	https://r2.ackimixs.xyz/14.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2s0XwRidJ0uVeXThGbeCCk	3	3	0
15	Jesus Just Left Chicago - 2006 Remaster	210253	https://r2.ackimixs.xyz/15.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	4tYjuquiKvx2Pq6usRTVWB	3	3	0
16	Beer Drinkers & Hell Raisers - 2006 Remaster	205546	https://r2.ackimixs.xyz/16.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2ap1hCe7wyOWkMJsnIn0V1	3	3	0
17	Master of Sparks - 2006 Remaster	209786	https://r2.ackimixs.xyz/17.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	5QlRoZ3eJRwFOK8xBQf44y	3	3	0
18	Hot, Blue and Righteous - 2006 Remaster	197520	https://r2.ackimixs.xyz/18.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	0tH43q9uOXKh1shZCs53DP	3	3	0
19	Move Me on Down the Line - 2005 Remaster	151680	https://r2.ackimixs.xyz/19.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2afW0UsI1mU9mREstUTwu6	3	3	0
20	Precious and Grace - 2005 Remaster	189666	https://r2.ackimixs.xyz/20.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2RkypFpFvnvkjKVjBPVXEs	3	3	0
21	La Grange - 2005 Remaster	230480	https://r2.ackimixs.xyz/21.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	70YvYr2hGlS01bKRIho1HM	3	3	0
22	Sheik - 2005 Remaster	246600	https://r2.ackimixs.xyz/22.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	4Cf26EZzXjLYa0fDeH3wDa	3	3	0
23	Have You Heard? - 2005 Remaster	194013	https://r2.ackimixs.xyz/23.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	6QdCUpQjspiOX0otKX9hAk	3	3	0
24	Waitin' for the Bus - Live	161986	https://r2.ackimixs.xyz/24.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	3DVKx3fOPPN3nmfHTFsCiG	3	3	0
25	Jesus Just Left Chicago - Live	243280	https://r2.ackimixs.xyz/25.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2jiOTXpEelz627pqJQclEl	3	3	0
26	La Grange - Live	284040	https://r2.ackimixs.xyz/26.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	4uc1in0E5mXcfBmIsVWhXW	3	3	0
27	Make It	220544	https://r2.ackimixs.xyz/27.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	27wIGYEnb2I2oS9Wl6QdVY	4	4	0
28	Somebody	225734	https://r2.ackimixs.xyz/28.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	08Al2vMprW1D9Os6JsCLRi	4	4	0
29	Dream On	267596	https://r2.ackimixs.xyz/29.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	1xsYj84j7hUDDnTTerGWlH	4	4	0
30	One Way Street	422607	https://r2.ackimixs.xyz/30.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	06ql7n0Wz0QLSFb9hWF3v1	4	4	0
31	Mama Kin	269190	https://r2.ackimixs.xyz/31.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	6Qs5u9Tqh1rm1ljdr1ckhw	4	4	0
32	Write Me a Letter	252508	https://r2.ackimixs.xyz/32.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	7l8oh4RE488NccC90SvZch	4	4	0
33	Movin' Out	302717	https://r2.ackimixs.xyz/33.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	6eyV4wJIXK1rVaClWBt8Dx	4	4	0
34	Walkin' The Dog	193514	https://r2.ackimixs.xyz/34.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	0AgJGo7JNWYBeHqbdzCXC0	4	4	0
35	Welcome To The Jungle	273480	https://r2.ackimixs.xyz/35.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	0G21yYKMZoHa30cYVi1iA8	5	5	0
36	It's So Easy	202693	https://r2.ackimixs.xyz/36.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	58YL9Jo1T0wyijCOZWRmyL	5	5	0
37	Nightrain	268213	https://r2.ackimixs.xyz/37.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	7CBFRsUz1pz1cS12soVhih	5	5	0
38	Out Ta Get Me	263573	https://r2.ackimixs.xyz/38.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	62pJJQjiTaTsFYFjDIYjYU	5	5	0
39	Mr. Brownstone	228586	https://r2.ackimixs.xyz/39.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	65G4Ib3w7tgLjUkO5GseN0	5	5	0
40	Paradise City	405600	https://r2.ackimixs.xyz/40.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	6eN1f9KNmiWEhpE2RhQqB5	5	5	0
41	My Michelle	219933	https://r2.ackimixs.xyz/41.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	1NQPc9znr56Ci6f02HoLpg	5	5	0
42	Think About You	231560	https://r2.ackimixs.xyz/42.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	4WPyOlL7E6ckUcCUzIKNJe	5	5	0
43	Sweet Child O' Mine	356066	https://r2.ackimixs.xyz/43.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	7snQQk1zcKl8gZ92AnueZW	5	5	0
44	You're Crazy	197013	https://r2.ackimixs.xyz/44.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	4WWUSzyxCUengfmWvKCdhR	5	5	0
45	Anything Goes	206173	https://r2.ackimixs.xyz/45.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	4x1iqAZIrfetO4o45KHhcC	5	5	0
46	Rocket Queen	373266	https://r2.ackimixs.xyz/46.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	0xaNdYwK8ZF3cHSjraQGC0	5	5	0
47	Smells Like Teen Spirit	301920	https://r2.ackimixs.xyz/47.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	5ghIJDpPoe3CfHMGu71E6T	6	6	0
48	In Bloom	255080	https://r2.ackimixs.xyz/48.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	30HCB1FoE77IfGRyNv4eFq	6	6	0
49	Come As You Are	218920	https://r2.ackimixs.xyz/49.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	4P5KoWXOxwuobLmHXLMobV	6	6	0
50	Breed	184040	https://r2.ackimixs.xyz/50.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	5mJGLBNJM0GULqAoL5mb9C	6	6	0
51	Lithium	257053	https://r2.ackimixs.xyz/51.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2YodwKJnbPyNKe8XXSE9V7	6	6	0
52	Polly	173853	https://r2.ackimixs.xyz/52.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	3tlXDvaNrrOmdvG0XVUOcv	6	6	0
53	Territorial Pissings	142946	https://r2.ackimixs.xyz/53.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2jmVGWe4MYY1zAAzpFHHcC	6	6	0
54	Drain You	223880	https://r2.ackimixs.xyz/54.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	5Ddlk6C2JVxb1SReZ6O1wk	6	6	0
55	Lounge Act	156426	https://r2.ackimixs.xyz/55.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	7glld4kxYHp61zIPtSVHNk	6	6	0
56	Stay Away	211440	https://r2.ackimixs.xyz/56.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	4l012k8ZcAdVbUvZ4kae5Q	6	6	0
57	On A Plain	194426	https://r2.ackimixs.xyz/57.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	651koV4RRMMX6NDbW1ElwP	6	6	0
58	Something In The Way	232146	https://r2.ackimixs.xyz/58.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	1nFtiJxYdhtFfFtfXBv06s	6	6	0
59	Endless, Nameless	403293	https://r2.ackimixs.xyz/59.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	0vNHCXmNzVa8h54SE3JDm7	6	6	0
60	I Was Made For Lovin' You	271240	https://r2.ackimixs.xyz/60.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	07q0QVgO56EorrSGHC48y3	7	7	0
61	2,000 Man	295386	https://r2.ackimixs.xyz/61.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	3TjM3SIVQksTj3pNVUZPv8	7	7	0
62	Sure Know Something	241506	https://r2.ackimixs.xyz/62.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	1HBDWCrQVjrALiOA5rILnE	7	7	0
63	Dirty Livin'	267933	https://r2.ackimixs.xyz/63.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	159RwMV9yxgOBk0aXhs3sq	7	7	0
64	Charisma	265933	https://r2.ackimixs.xyz/64.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	6afDASlKWMARNxYSrCAAf8	7	7	0
65	Magic Touch	282226	https://r2.ackimixs.xyz/65.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	3gAnPHRoANSRwp1gwv5p2m	7	7	0
66	Hard Times	211240	https://r2.ackimixs.xyz/66.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	3sy8VUikaAQv1SKPK2EsMi	7	7	0
67	X-Ray Eyes	226333	https://r2.ackimixs.xyz/67.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	4E5ombPeNdVQFgGFDb0Bhs	7	7	0
68	Save Your Love	280666	https://r2.ackimixs.xyz/68.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	1RUQIkl3vHaOUPKC885STa	7	7	0
69	Hells Bells	312293	https://r2.ackimixs.xyz/69.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	69QHm3pustz01CJRwdo20z	8	8	0
70	Shoot to Thrill	317426	https://r2.ackimixs.xyz/70.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	0C80GCp0mMuBzLf3EAXqxv	8	8	0
71	What Do You Do for Money Honey	215533	https://r2.ackimixs.xyz/71.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	6Th6ND8RQPywiyelecP5Lf	8	8	0
72	Givin the Dog a Bone	211760	https://r2.ackimixs.xyz/72.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	6rAy2MsMUabbqu2VygrblP	8	8	0
73	Let Me Put My Love Into You	255266	https://r2.ackimixs.xyz/73.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	5XeMsYb1rWxQL1bUUaZajn	8	8	0
74	Back In Black	255493	https://r2.ackimixs.xyz/74.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	08mG3Y1vljYA6bvDt4Wqkj	8	8	0
75	You Shook Me All Night Long	210173	https://r2.ackimixs.xyz/75.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2SiXAy7TuUkycRVbbWDEpo	8	8	0
76	Have a Drink on Me	238466	https://r2.ackimixs.xyz/76.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	4dDurgTN3eGyU0ghzFJ0T1	8	8	0
77	Shake a Leg	245666	https://r2.ackimixs.xyz/77.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2MCUmp0I98gsJBmey7DfZS	8	8	0
78	Rock and Roll Ain't Noise Pollution	266040	https://r2.ackimixs.xyz/78.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	6J17MkMmuzBiIOjRH6MOBZ	8	8	0
79	Born in the U.S.A.	278680	https://r2.ackimixs.xyz/79.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	0dOg1ySSI7NkpAe89Zo0b9	10	10	0
80	Cover Me	205986	https://r2.ackimixs.xyz/80.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	4U7NhC2rQTAhH7dw7H0goB	10	10	0
81	Darlington County	288026	https://r2.ackimixs.xyz/81.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	3O5RCjnjWlF0CYkcvJaGVm	10	10	0
82	Working on the Highway	192266	https://r2.ackimixs.xyz/82.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	1n16ZEz2uuWO1Dx01dVWua	10	10	0
83	Downbound Train	215426	https://r2.ackimixs.xyz/83.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	4a0oZYU2ntSUof4lkm2PCl	10	10	0
84	I'm On Fire	155880	https://r2.ackimixs.xyz/84.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	3PzsbWSQdLCKDLxn7YZfkM	10	10	0
85	No Surrender	240146	https://r2.ackimixs.xyz/85.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2zMlWt4aYreVczVERFK94w	10	10	0
86	Bobby Jean	226720	https://r2.ackimixs.xyz/86.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2KPzDsCtQtIM0Lkh3RacRC	10	10	0
87	I'm Goin' Down	209040	https://r2.ackimixs.xyz/87.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	0VkDedVtP7TQDlaCMq9QVx	10	10	0
88	Glory Days	254733	https://r2.ackimixs.xyz/88.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2Y90nL1ohB4sgYELDs7uNx	10	10	0
89	Dancing In the Dark	241306	https://r2.ackimixs.xyz/89.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	7FwBtcecmlpc1sLySPXeGE	10	10	0
90	My Hometown	279666	https://r2.ackimixs.xyz/90.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	6dahFmHrgncgVJjsI1ws7e	10	10	0
91	Second Hand News - 2004 Remaster	176306	https://r2.ackimixs.xyz/91.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	0hlniElQOr5tvSKBaSpAQi	11	11	0
92	Dreams - 2004 Remaster	257800	https://r2.ackimixs.xyz/92.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	5TDZyWDfbQFQJabbPwImVY	11	11	0
93	Never Going Back Again - 2004 Remaster	134400	https://r2.ackimixs.xyz/93.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2TJqhMuTx2eMun7MMQVIFy	11	11	0
94	Don't Stop - 2004 Remaster	193346	https://r2.ackimixs.xyz/94.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	4bEb3KE4mSKlTFjtWJQBqO	11	11	0
95	Go Your Own Way - 2004 Remaster	223613	https://r2.ackimixs.xyz/95.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	07GvNcU1WdyZJq3XxP0kZa	11	11	0
96	Songbird - 2004 Remaster	200813	https://r2.ackimixs.xyz/96.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	2JoUtztTqCN4ZhmbRDGPIL	11	11	0
97	The Chain - 2004 Remaster	269813	https://r2.ackimixs.xyz/97.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	7Dm3dV3WPNdTgxoNY7YFnc	11	11	0
98	You Make Loving Fun - 2004 Remaster	213693	https://r2.ackimixs.xyz/98.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	28H3wOEKsaEa8NBEYCLl4j	11	11	0
99	I Don't Want to Know - 2004 Remaster	196853	https://r2.ackimixs.xyz/99.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      	6mGTiazKYI1BHT2uc9wTUL	11	11	0
100	Oh Daddy - 2004 Remaster	236240	https://r2.ackimixs.xyz/100.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3D8bcwMmgPR5ZnpL52rY1q	11	11	0
101	Gold Dust Woman - 2004 Remaster	295626	https://r2.ackimixs.xyz/101.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2w3ScXudq4aD3K5HFO5xvx	11	11	0
102	Hound Dog	136026	https://r2.ackimixs.xyz/102.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	64Ny7djQ6rNJspquof2KoX	12	12	0
103	Loving You	133880	https://r2.ackimixs.xyz/103.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1WQVOt3KHGxE9ZB0b1TZy4	12	12	0
104	All Shook Up	117080	https://r2.ackimixs.xyz/104.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5ueyLj6e6oVaTY0KQ6yLaA	12	12	0
105	Heartbreak Hotel	127560	https://r2.ackimixs.xyz/105.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6xNwKNYZcvgV3XTIwsgNio	12	12	0
106	Jailhouse Rock	146480	https://r2.ackimixs.xyz/106.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4gphxUgq0JSFv2BCLhNDiE	12	12	0
107	Love Me	163786	https://r2.ackimixs.xyz/107.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3aTbL1KUMcMWrylyOAOcB2	12	12	0
108	Too Much	152786	https://r2.ackimixs.xyz/108.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5MCLmWJgzC3wTptkENyntW	12	12	0
109	Don't Be Cruel	122893	https://r2.ackimixs.xyz/109.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	01u6AEzGbGbQyYVdxajxqk	12	12	0
110	That's When Your Heartaches Begin	201760	https://r2.ackimixs.xyz/110.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	74u4y5uFhWbKtCIzFIkTQi	12	12	0
111	(Let Me Be Your) Teddy Bear	107186	https://r2.ackimixs.xyz/111.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4qfseGEjfvaXs6veGjPU2z	12	12	0
112	Love Me Tender - From the 20th Century-Fox CinemaScope Production, "Love Me Tender"	161360	https://r2.ackimixs.xyz/112.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4GAhAw0RCzNVP976NRMOqO	12	12	0
113	Treat Me Nice	131480	https://r2.ackimixs.xyz/113.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6PjTKlBclT9fmXBJSnl2l4	12	12	0
114	Any Way You Want Me (That's How I Will Be)	133840	https://r2.ackimixs.xyz/114.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	139zPoDyCUktM8HH6qeYXE	12	12	0
115	I Want You, I Need You, I Love You	159920	https://r2.ackimixs.xyz/115.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	60tEaPHRJLnMzbyOPTeh3A	12	12	0
116	Blitzkrieg Bop - 2016 Remaster	134466	https://r2.ackimixs.xyz/116.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4KcH1ZRV2W1q7Flq0QqC76	13	13	0
117	Beat on the Brat - 2016 Remaster	151960	https://r2.ackimixs.xyz/117.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	55mKuESqpfgqe0kooIkTH2	13	13	0
118	Judy Is a Punk - 2016 Remaster	92480	https://r2.ackimixs.xyz/118.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0vGCxnTwYZFtOAW3oz28kd	13	13	0
119	I Wanna Be Your Boyfriend - 2016 Remaster	144306	https://r2.ackimixs.xyz/119.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	70U8S3FnHJlwPuid3D2A5d	13	13	0
120	Chain Saw - 2016 Remaster	116413	https://r2.ackimixs.xyz/120.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0qh1urPOJNYPrBQREE5lLS	13	13	0
121	Now I Wanna Sniff Some Glue - 2016 Remaster	95973	https://r2.ackimixs.xyz/121.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1KWWXe7kMpVptnBsdiiyVb	13	13	0
122	I Don't Wanna Go Down to the Basement - 2016 Remaster	160946	https://r2.ackimixs.xyz/122.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6WPZnQd1Ic50z5RzKWhZKT	13	13	0
123	Loudmouth - 2016 Remaster	135066	https://r2.ackimixs.xyz/123.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	18hdp5HzsWTsl6NjsPhnpB	13	13	0
124	Havana Affair - 2016 Remaster	117066	https://r2.ackimixs.xyz/124.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2A0zKcpBgK7v9G2gsimPIY	13	13	0
125	Listen to My Heart - 2016 Remaster	118653	https://r2.ackimixs.xyz/125.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6XelYgwWSqRpwMs15BgGYM	13	13	0
126	53rd & 3rd - 2016 Remaster	141333	https://r2.ackimixs.xyz/126.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1KsSlsvm2hjzB1WWkryxIj	13	13	0
127	Let's Dance - 2016 Remaster	111866	https://r2.ackimixs.xyz/127.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5wPUGMFkGjNQH9W3FkgkGt	13	13	0
128	I Don't Wanna Walk Around with You - 2016 Remaster	102813	https://r2.ackimixs.xyz/128.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1PjbjMEDnpGMDnyqoGCCfD	13	13	0
129	Today Your Love, Tomorrow the World - 2016 Remaster	132666	https://r2.ackimixs.xyz/129.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7BmrfUmiDAPHGZCuPCD1F7	13	13	0
130	Blitzkrieg Bop - 40th Anniversary Mono Mix	132520	https://r2.ackimixs.xyz/130.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5u8JQ4bEIV7vJt5ngcIVXv	13	13	0
131	Beat on the Brat - 40th Anniversary Mono Mix	151640	https://r2.ackimixs.xyz/131.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0LokziWZAfmiRMuiN8WQM9	13	13	0
132	Judy Is a Punk - 40th Anniversary Mono Mix	91760	https://r2.ackimixs.xyz/132.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5ByzOSn3xMsSRmTZnVvoNm	13	13	0
133	I Wanna Be Your Boyfriend - 40th Anniversary Mono Mix	144880	https://r2.ackimixs.xyz/133.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0IJvpf1bf5EDSVGCM7JJau	13	13	0
134	Chain Saw - 40th Anniversary Mono Mix	113866	https://r2.ackimixs.xyz/134.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1UwrzBEROcIYXjclkEzkGL	13	13	0
135	Now I Wanna Sniff Some Glue - 40th Anniversary Mono Mix	95213	https://r2.ackimixs.xyz/135.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6HxJ1s6LaWVzSlmFwiAeeT	13	13	0
136	I Don't Wanna Go Down to the Basement - 40th Anniversary Mono Mix	157066	https://r2.ackimixs.xyz/136.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4fntsGIulk4nMxW64TT5Mv	13	13	0
137	Loudmouth - 40th Anniversary Mono Mix	133853	https://r2.ackimixs.xyz/137.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6bQG2UdMrrgBezrAejUD9y	13	13	0
138	Havana Affair - 40th Anniversary Mono Mix	116560	https://r2.ackimixs.xyz/138.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6qWS5egulbj8R6s7hGTH7o	13	13	0
139	Listen to My Heart - 40th Anniversary Mono Mix	116120	https://r2.ackimixs.xyz/139.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0txPPnwEAiizBH3mQK1enW	13	13	0
140	53rd & 3rd - 40th Anniversary Mono Mix	138733	https://r2.ackimixs.xyz/140.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5R1TkRZpJIGdLjcl71ttlJ	13	13	0
141	Let's Dance - 40th Anniversary Mono Mix	111133	https://r2.ackimixs.xyz/141.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3GUiiHHP7q8erikeS3akVE	13	13	0
142	I Don't Wanna Walk Around with You - 40th Anniversary Mono Mix	104920	https://r2.ackimixs.xyz/142.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1fCRcL3uSYGTFWcggZPBXx	13	13	0
143	Today Your Love, Tomorrow the World - 40th Anniversary Mono Mix	130266	https://r2.ackimixs.xyz/143.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0m5RKjczdG4TXSEaDEzVgF	13	13	0
144	Blitzkrieg Bop - Single Version	132800	https://r2.ackimixs.xyz/144.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5eKIGC6kIEfKfzTzet3sOl	13	13	0
145	Blitzkrieg Bop - Mono	131840	https://r2.ackimixs.xyz/145.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	77qiWvNcRqhKKbQJ4IYwbx	13	13	0
146	I Wanna Be Your Boyfriend	145120	https://r2.ackimixs.xyz/146.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6w6iRWyOd6A5PBVQcZaHN2	13	13	0
147	I Wanna Be Your Boyfriend - Original Mono; 2016 Remaster	147253	https://r2.ackimixs.xyz/147.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4AIj2tN5dOXGtn00yGU3aM	13	13	0
148	Today Your Love, Tomorrow the World - Uncensored Vocals	132573	https://r2.ackimixs.xyz/148.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1857Kpq27ZfnkYWPKdXa8Z	13	13	0
149	I Don't Care - Demo; 2016 Remaster	121733	https://r2.ackimixs.xyz/149.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0vP2H8sIkQvZDbTIRWyuBv	13	13	0
150	53rd & 3rd - Demo	143440	https://r2.ackimixs.xyz/150.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7sRa57ejO0sDMWWh3OKomp	13	13	0
151	Loudmouth - Demo	136333	https://r2.ackimixs.xyz/151.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3W4nYdb9jbitTw3ui7LutK	13	13	0
152	Chain Saw - Demo	121626	https://r2.ackimixs.xyz/152.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2kXvGsGXIPwtcjpaw72ErN	13	13	0
153	You Should Have Never Opened That Door - Demo; 2016 Remaster	104186	https://r2.ackimixs.xyz/153.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0ANy7WBLYx1pkekrb1zwaz	13	13	0
154	I Wanna Be Your Boyfriend - Demo	113880	https://r2.ackimixs.xyz/154.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	36E8rMIBjdOwTeVIKxVr49	13	13	0
155	I Can't Be - Demo; 2016 Remaster	122480	https://r2.ackimixs.xyz/155.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	045TfGwMftk8Rk31l4EPPs	13	13	0
156	Today Your Love, Tomorrow the World - Demo	133346	https://r2.ackimixs.xyz/156.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0QkhhaEtc5sAWd5XZQDmVX	13	13	0
157	I Don't Wanna Walk Around with You - Demo	115533	https://r2.ackimixs.xyz/157.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0XHz5LWSKwXFSnoUo2xM8N	13	13	0
158	Now I Wanna Sniff Some Glue - Demo; 2016 Remaster	105186	https://r2.ackimixs.xyz/158.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5deIYVCLgeNNDniXUo4O7b	13	13	0
159	I Don't Wanna Be Learned / I Don't Wanna Be Tamed - Demo; 2016 Remaster	77413	https://r2.ackimixs.xyz/159.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1UAjHXyT5Wum6nSY8Qt1zI	13	13	0
160	You're Gonna Kill That Girl - Demo	171773	https://r2.ackimixs.xyz/160.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	700wTBOOQ8EMwwoZZnWlDc	13	13	0
161	What's Your Name - Demo; 2016 Remaster	177440	https://r2.ackimixs.xyz/161.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5xdrBBGQ9xs2Mus91tj2w6	13	13	0
162	Loudmouth - Live at the Roxy, Hollywood, CA 8/12/76; Set 1; 2016 Remaster	130066	https://r2.ackimixs.xyz/162.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7zwNiGXOzi4WdVusErUk7A	13	13	0
163	Beat on the Brat - Live at the Roxy, Hollywood, CA, 8/12/76; Set 1; 2016 Remaster	156066	https://r2.ackimixs.xyz/163.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3i5HdkCyorDO7ZSdkD5MhL	13	13	0
164	Blitzkrieg Bop - Live at the Roxy, Hollywood, CA, 8/12/76; Set 1; 2016 Remaster	133546	https://r2.ackimixs.xyz/164.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0h3LmXuHgfr0iy7HvMVus7	13	13	0
165	I Remember You - Live at the Roxy, Hollywood, CA 8/12/76; Set 1; 2016 Remaster	137160	https://r2.ackimixs.xyz/165.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7C9KH6jYxZH5SJUWnJYLsr	13	13	0
166	Holidays in the Sun	202800	https://r2.ackimixs.xyz/166.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2e4RcQohKWo8oZIUfjxiGo	14	14	0
167	Bodies	183000	https://r2.ackimixs.xyz/167.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	21MwEJ8tHezcPy77BaELJ6	14	14	0
168	No Feelings	171173	https://r2.ackimixs.xyz/168.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4GtIKUB1Q5O65ofahYPRfX	14	14	0
169	Liar	161533	https://r2.ackimixs.xyz/169.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2Hs7YqZwFEPIxRTnqtrHvP	14	14	0
170	Problems	251360	https://r2.ackimixs.xyz/170.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4AqfCW0jMeByTMZdoqHlH4	14	14	0
171	God Save the Queen	200080	https://r2.ackimixs.xyz/171.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6ui6l3ZNvlrGQZArwo8195	14	14	0
172	Seventeen	122706	https://r2.ackimixs.xyz/172.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0PgpDLsbk8wnYpgMCynGLz	14	14	0
173	Anarchy in the U.K.	211973	https://r2.ackimixs.xyz/173.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3LoDeIbiR12sAznmpNEmKA	14	14	0
174	Sub-Mission	252680	https://r2.ackimixs.xyz/174.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6jjASY7DtqLdM0zJbAQcnX	14	14	0
175	Pretty Vacant	198160	https://r2.ackimixs.xyz/175.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2mKj8Em0GLFu8I78yM1CfU	14	14	0
176	New York	186893	https://r2.ackimixs.xyz/176.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1sRWDB2Db5mZVealHeNYJt	14	14	0
177	EMI	193653	https://r2.ackimixs.xyz/177.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6FAF8l0j91yX6SwkQNhrm7	14	14	0
178	Rebel Yell	288533	https://r2.ackimixs.xyz/178.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4TIJ7zSBNejpoIPaWpWRKc	15	15	0
179	Daytime Drama	244653	https://r2.ackimixs.xyz/179.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7wO6lFGDLRcVQ4CoMTgeeU	15	15	0
180	Eyes Without A Face	299240	https://r2.ackimixs.xyz/180.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0pUVeEgZuNyFzIMKp67RbS	15	15	0
181	Blue Highway	307493	https://r2.ackimixs.xyz/181.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2LkB0t3N5nvGAkkzU9WRfh	15	15	0
182	Flesh For Fantasy - Remastered	278280	https://r2.ackimixs.xyz/182.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5NJvgtVjLTTogjFcrOIZYN	15	15	0
183	Catch My Fall - Edit	224333	https://r2.ackimixs.xyz/183.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6vrQiNJDkGyKzxlNCQGwNo	15	15	0
184	Crank Call	239520	https://r2.ackimixs.xyz/184.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2ft5JEw51D2otFSqOOOGne	15	15	0
185	(Do Not) Stand In The Shadows	192653	https://r2.ackimixs.xyz/185.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6CmoIYs1fWHh0wGkJ1X0fq	15	15	0
186	The Dead Next Door	228066	https://r2.ackimixs.xyz/186.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5aLiSPbF4E5aEM3UHTMoBr	15	15	0
187	1984 - 2015 Remaster	67573	https://r2.ackimixs.xyz/187.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	43nVoP1xPa5fbmAwxeN5fY	16	16	0
188	Jump - 2015 Remaster	241599	https://r2.ackimixs.xyz/188.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7N3PAbqfTjSEU1edb2tY8j	16	16	0
189	Panama - 2015 Remaster	210226	https://r2.ackimixs.xyz/189.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	05RgAMGypEvqhNs5hPCbMS	16	16	0
190	Top Jimmy - 2015 Remaster	179906	https://r2.ackimixs.xyz/190.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4H5QdHS8T7Qq4WgzFkYu5Q	16	16	0
191	Drop Dead Legs - 2015 Remaster	254200	https://r2.ackimixs.xyz/191.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	49KoX0qpXf3wHyP9nfUaqq	16	16	0
192	Hot for Teacher - 2015 Remaster	282746	https://r2.ackimixs.xyz/192.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6QDbGdbJ57Mtkflsg42WV5	16	16	0
193	I'll Wait - 2015 Remaster	280146	https://r2.ackimixs.xyz/193.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2TIKWWCf6qAtVP6AGa7e9k	16	16	0
194	Girl Gone Bad - 2015 Remaster	273893	https://r2.ackimixs.xyz/194.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7ytUUv11hwMJqZLaLK20Zq	16	16	0
195	House of Pain - 2015 Remaster	199840	https://r2.ackimixs.xyz/195.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6fYlvN1IlHi3cSY3tyZH1T	16	16	0
196	Women - Remastered 2017	342510	https://r2.ackimixs.xyz/196.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2q1njJdxOMEClSnuBWGMJa	17	17	0
197	Rocket - Remastered 2017	396823	https://r2.ackimixs.xyz/197.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1F1ek5FOLawYoPuZI0GITr	17	17	0
198	Animal - Remastered 2017	244560	https://r2.ackimixs.xyz/198.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4F12pb0e2KnyLuCMRs0Rd2	17	17	0
199	Love Bites - Remastered 2017	346960	https://r2.ackimixs.xyz/199.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3Dfy8YIxq89i84t108TvMi	17	17	0
200	Pour Some Sugar On Me - Remastered 2017	267306	https://r2.ackimixs.xyz/200.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0PdM2a6oIjqepoEfcJo0RO	17	17	0
201	Armageddon It - Remastered 2017	322866	https://r2.ackimixs.xyz/201.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	16MQZkAIAAtI4X5NuiEwuq	17	17	0
202	Gods Of War - Remastered 2017	397813	https://r2.ackimixs.xyz/202.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3YlVgIv15RabJD7s5tjL63	17	17	0
203	Don't Shoot Shot Gun - Remastered 2017	266790	https://r2.ackimixs.xyz/203.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5XuzKbpYnjE6Th8Zqq6iBC	17	17	0
204	Run Riot - Remastered 2017	279300	https://r2.ackimixs.xyz/204.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6y39OIfxGrM7PPNX0RRkjC	17	17	0
205	Hysteria - Remastered 2017	354636	https://r2.ackimixs.xyz/205.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6EzSduIPnAmO3o41HY5V9d	17	17	0
206	Excitable - Remastered 2017	259341	https://r2.ackimixs.xyz/206.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5QQc6QtIlU270Vq7SQRcBT	17	17	0
207	Love And Affection - Remastered 2017	276910	https://r2.ackimixs.xyz/207.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0bVYi0Y93sjo5q25qctzOZ	17	17	0
208	Tear It Down	217799	https://r2.ackimixs.xyz/208.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3pH9Vu1LNBXMUptZbmipFF	17	17	0
209	I Wanna Be Your Hero - Revised Version	275635	https://r2.ackimixs.xyz/209.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1DBt0u00pL1UIxTCizq9gN	17	17	0
210	Ride Into The Sun - Re-Recording	187060	https://r2.ackimixs.xyz/210.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	33RlHyPOv5vANMaswXNrbB	17	17	0
211	Ring Of Fire	276560	https://r2.ackimixs.xyz/211.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1VejPPCynfx4uOTs3OjEg6	17	17	0
212	Women - Radio Edit	295476	https://r2.ackimixs.xyz/212.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3ulICN9mJtGn5Nfla0S6PS	17	17	0
213	Rocket - Lunar Mix / Radio Edit	277557	https://r2.ackimixs.xyz/213.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5eO0mcQC1sxR4x5V25shqO	17	17	0
214	Love Bites - Radio Edit	288973	https://r2.ackimixs.xyz/214.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4gvWy7Urn1gfWKFlrJX1QK	17	17	0
215	Hysteria - Radio Edit	228534	https://r2.ackimixs.xyz/215.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3VY92N8E7bbuoBH4aBD79X	17	17	0
216	Pour Some Sugar On Me - Radio Edit	262994	https://r2.ackimixs.xyz/216.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4cbiHewUJ5D48xewsuld7T	17	17	0
217	Armageddon It - Radio Edit	252160	https://r2.ackimixs.xyz/217.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1UBpy08ZpFLoYMkJvtltxr	17	17	0
218	Release Me	211143	https://r2.ackimixs.xyz/218.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4ipj3mXOuWPjL3sReYrSB6	18	17	0
219	Rocket - Lunar Mix / Extended Version	520030	https://r2.ackimixs.xyz/219.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4anfSDKIqPaYPhagzmsIC2	17	17	0
220	Armageddon It - The Nuclear Mix	462239	https://r2.ackimixs.xyz/220.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	79BYMo4imq1lnNzS2nyJcZ	17	17	0
221	Animal - Extended Version	292461	https://r2.ackimixs.xyz/221.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	54aModKZIptZUQPeQlOury	17	17	0
222	Pour Some Sugar On Me - Extended Version	336348	https://r2.ackimixs.xyz/222.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3ZSkDwJzPELKzMF01COsuY	17	17	0
223	Excitable - The Orgasmic Mix	384850	https://r2.ackimixs.xyz/223.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6VDrgJZXRYySlOp2Ks4ofd	17	17	0
224	Rocket - Lunar Mix	426336	https://r2.ackimixs.xyz/224.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2hxSyI0TTpApNFnWnlMnRS	17	17	0
225	Rock Of Ages Medley - Live	519419	https://r2.ackimixs.xyz/225.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2XOOcpvSgikjFmmGNTQSGa	17	17	0
226	Love And Affection - Live	290575	https://r2.ackimixs.xyz/226.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1tRoBegih8S35CUyy8I16l	17	17	0
227	Billy's Got A Gun - Live	321262	https://r2.ackimixs.xyz/227.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	61tnn2VVEBXig1XMu24L9b	17	17	0
228	Stagefright - Live	256306	https://r2.ackimixs.xyz/228.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5z1WoxvkSHcpdI7SoOdsby	17	17	0
229	Rock! Rock! (Till You Drop) - Live	212400	https://r2.ackimixs.xyz/229.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0YfCEsATIo9m5xfVtUbil0	17	17	0
230	Women - Live	374373	https://r2.ackimixs.xyz/230.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7waZamZyc4jzO3XKu6X2DU	17	17	0
231	Too Late For Love - Live	351120	https://r2.ackimixs.xyz/231.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7ouyTbretuClXGfHrEm0Xs	17	17	0
232	Hysteria - Live	420080	https://r2.ackimixs.xyz/232.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3ItxFNkfXfFtE4GLn3v2I3	17	17	0
233	Gods Of War - Live	392293	https://r2.ackimixs.xyz/233.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3QaZuBkryt1QBjfPjxRs1L	17	17	0
234	Die Hard The Hunter - Live	370213	https://r2.ackimixs.xyz/234.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2tz4Gu6Jv4XjGkOcsUepI0	17	17	0
235	Nous y sommes	179147	https://r2.ackimixs.xyz/235.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6kmq1hyTgCBDPs3jBG9Ux5	19	18	0
236	Captain	163709	https://r2.ackimixs.xyz/236.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0Tab4yiv2M2CmzUnISO7h9	19	18	0
237	Big Buckets	149857	https://r2.ackimixs.xyz/237.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6PjNULRcYdAXo8BzmZP1Yr	19	18	0
238	Maman	192214	https://r2.ackimixs.xyz/238.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5OhM1XLjiC7C2lTENOKUe4	20	18	0
239	Menaces	186571	https://r2.ackimixs.xyz/239.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3F8yavp7a4R1WJROF8AJRb	19	18	0
240	CDI Freestyle	121214	https://r2.ackimixs.xyz/240.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5qjqqWA2qhxWRKajmpOPIO	20	18	0
241	Rudeboy	131642	https://r2.ackimixs.xyz/241.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1l3z4ddaKbAbndZHGubtgb	19	18	0
242	La vériter	146357	https://r2.ackimixs.xyz/242.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2V8pleOfkPtxIL96gHev8S	19	18	0
243	Lost & Dizzy	147000	https://r2.ackimixs.xyz/243.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1isveJHIqcM8NHfAPfC9ea	20	18	0
244	Interlude français	110142	https://r2.ackimixs.xyz/244.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	54cUiLzW2gpFO37Flql54u	19	18	0
245	Violette & citronnelle	195714	https://r2.ackimixs.xyz/245.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6QFodJOXRFL1wD7il68JZu	39	18	0
246	La bagarre	174571	https://r2.ackimixs.xyz/246.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5IstbPKIBEYUmAxXnfPzpK	19	18	0
247	N-mot	141428	https://r2.ackimixs.xyz/247.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5B62MPhvenHcV23Vpk7M59	19	18	0
248	Babai	98571	https://r2.ackimixs.xyz/248.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6DqYUOzMgt5NIHFdJLSinG	19	18	0
249	Mamone	139607	https://r2.ackimixs.xyz/249.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0D2eA6xMITMnb8RqnII4sU	46	18	0
250	Interlude mafieux	95678	https://r2.ackimixs.xyz/250.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0TF0TcWDpjs4YQbR4wCk16	47	18	0
251	Light You Up	207214	https://r2.ackimixs.xyz/251.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3vRRBzvwA4Og2f1LtvHpf0	20	18	0
252	FTG	142000	https://r2.ackimixs.xyz/252.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	65twe1XvBrfmAmeIGTXCmJ	19	18	0
253	Askip	169357	https://r2.ackimixs.xyz/253.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	36Hwe1AN2iL34UkKQjM6yB	19	18	0
254	Drake	146875	https://r2.ackimixs.xyz/254.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5VzpHPovgx7mzrq79HVMvC	19	18	0
255	Nous sommes les Daft Punk	166839	https://r2.ackimixs.xyz/255.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7JCq2tqtMxHnAszZl15IjM	20	18	0
256	Zinédine Zidane	139642	https://r2.ackimixs.xyz/256.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	16xUtmXsXzhI8fmzHBlOxg	54	18	0
257	BECTE	138786	https://r2.ackimixs.xyz/257.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0Fqpx84jq1cK3pDtPvTFyM	56	19	0
258	BODIES (feat. Damso)	166373	https://r2.ackimixs.xyz/258.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3im90dPSC5z1PYJ305kgSy	56	19	0
259	LETTRE À UN OPPS	178813	https://r2.ackimixs.xyz/259.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7LQxyZwcn4Ryq4Z0qllQd3	56	19	0
260	RAPPEL	217946	https://r2.ackimixs.xyz/260.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	48BdA5qBxXVoe59xvu0bwc	56	19	0
261	JEUX DANGEREUX	148866	https://r2.ackimixs.xyz/261.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5s4nWxnucgO7YPfoPGxR1e	56	19	0
262	M.A.L.A (feat. M Huncho)	226680	https://r2.ackimixs.xyz/262.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	63Rv4Exb1rc43qYL9AOXsa	56	19	0
263	GRA GRA BOOM (feat. Skread)	208413	https://r2.ackimixs.xyz/263.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3aOzpOcVaAXCb2bkabANde	56	19	0
264	HENNESSY	217960	https://r2.ackimixs.xyz/264.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6fKYXAnTD96mFM9nAGaC7V	56	19	0
265	IMPACT	186400	https://r2.ackimixs.xyz/265.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1hlUHJgbdFdvZvG64a3W1g	56	19	0
266	DIE	240413	https://r2.ackimixs.xyz/266.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3D29kjUyWxsT3jUUTtARVQ	56	19	0
267	BOSS	188933	https://r2.ackimixs.xyz/267.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2K2hSiCZAwwlFvwTxVRqoi	56	19	0
268	CELINE 3X	158226	https://r2.ackimixs.xyz/268.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2wXS2IXCyBX0WL76LLYT31	56	19	0
269	MOLLY	210440	https://r2.ackimixs.xyz/269.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	682C1KGj7SigHyZIFzP0yT	56	19	0
270	FLEURS (feat. Tiakola)	210933	https://r2.ackimixs.xyz/270.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0i9RysNKssk6syOrKDX3U2	56	19	0
271	MAUVAIS 2X (feat. Ninho)	217946	https://r2.ackimixs.xyz/271.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6eyMCE0yqY4XYI8ZUZf9Wk	56	19	0
272	Au coeur de la Tess	174973	https://r2.ackimixs.xyz/272.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0NMJvhPbflFhQOixjNFhWf	62	20	0
273	Bara	150000	https://r2.ackimixs.xyz/273.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6vlgCHcuuQZvc1DI0fPOI2	62	20	0
274	Jolie (feat. Ninho)	159573	https://r2.ackimixs.xyz/274.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	16FTTvpIgihyei3EBNw1jd	62	20	0
275	Light Skin	159133	https://r2.ackimixs.xyz/275.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0IHlf4D13Lk1QA9TwlWPQk	62	20	0
276	Rainté (feat. Franglish)	195146	https://r2.ackimixs.xyz/276.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	03yzfR8s9NA9v8rRalxNiC	62	20	0
277	Alcoolisé (feat. Alonzo) - Remix	215133	https://r2.ackimixs.xyz/277.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4kMB98ZFUhJwNIsnKUEVCY	62	20	0
278	G-Love	169160	https://r2.ackimixs.xyz/278.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2ClTagPnFd60UdEA3iy6nF	62	20	0
279	En pétard	200346	https://r2.ackimixs.xyz/279.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5GPEq7K89tvCnmwD86KeLH	62	20	0
280	Noir	169000	https://r2.ackimixs.xyz/280.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7toj4yzH8PlzIW1OI2hoJV	62	20	0
281	Chargeur	178000	https://r2.ackimixs.xyz/281.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5hJsKwgizyh7jSD29Lkqz7	62	20	0
282	Maria	173133	https://r2.ackimixs.xyz/282.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0tVG5j0th6GtEveDxniVnp	62	20	0
283	Cagoulé (feat. Leto)	165133	https://r2.ackimixs.xyz/283.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4TKywiK0aVAyKOGKqDD47e	62	20	0
284	Nike Air	175986	https://r2.ackimixs.xyz/284.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3BgtqTF99AqmRi4QjSs4wY	62	20	0
285	Dernier de la liste	180133	https://r2.ackimixs.xyz/285.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3wNs7DoHcAsjQvRppmH5It	62	20	0
286	NO LÈCHE	194201	https://r2.ackimixs.xyz/286.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6D1HiF2e3Z0F8FwQ5uLxwn	56	21	0
287	NOCHEY	198386	https://r2.ackimixs.xyz/287.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1ndtoMKQj4N3quUzJvPEsK	68	22	0
288	AMBER	182493	https://r2.ackimixs.xyz/288.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5Q967UCPfCsQeEgFhT1umT	68	22	0
289	COEUR DE ICE (feat. Damso)	192213	https://r2.ackimixs.xyz/289.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7jbu9k6w67hWlhSinmGT3c	68	22	0
290	L'ARMOIRE	165573	https://r2.ackimixs.xyz/290.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5R9ZGpFYnzW3WmVGk2uh4J	68	22	0
291	FROSTIES	110266	https://r2.ackimixs.xyz/291.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4bGWT7GWjqaO1Sj9ZbUtEG	68	22	0
292	ZAZA	188466	https://r2.ackimixs.xyz/292.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3qA5qgPKXsElkU8TRjNx7u	68	22	0
293	BRÛLURES INDIENNES	177973	https://r2.ackimixs.xyz/293.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	24vDSi6wZW34oY8sTrgQf7	68	22	0
294	TOUTE LA JOURNÉE (feat. Tiakola)	167933	https://r2.ackimixs.xyz/294.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6QPFWJJLKKPjnwRQJ1OwSC	68	22	0
295	CARTIER PANTHÈRE	185720	https://r2.ackimixs.xyz/295.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	14sdOJ9PZHGZaJmrxrbpSh	68	22	0
296	ENVIE7VIE	140413	https://r2.ackimixs.xyz/296.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0lSB2n0DEvA2mnsGI9qI5f	68	22	0
297	GORGÉE POUR LES MORTS	186600	https://r2.ackimixs.xyz/297.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0iGn8hkjQrEW2Mwb4oV9dk	68	22	0
298	ELECTRO	85813	https://r2.ackimixs.xyz/298.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6Pvo7NI5Wq3ajPPgocxm6o	68	22	0
299	MAKE UP	135813	https://r2.ackimixs.xyz/299.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	637PqFl8HYdCuSQXhqwkOb	68	22	0
300	CÔTÉ HUBLOT	196346	https://r2.ackimixs.xyz/300.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0R6Hx28x5lgpIUWD6ltX7e	68	22	0
301	LA LUMIÈRE	207560	https://r2.ackimixs.xyz/301.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3Bc9vObMRjShmk339aD5JA	68	22	0
302	Pena Duro	157893	https://r2.ackimixs.xyz/302.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0Bqj2Umn6ft60B2pWXKnLF	69	23	0
303	Freestyle LVL UP 1	114182	https://r2.ackimixs.xyz/303.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6RLVnSWFkT7ywpXv0XyRhY	61	24	0
304	POL-AK	102946	https://r2.ackimixs.xyz/304.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	614wjfYMFLyT3fILfpny2H	70	25	0
305	Demain	183013	https://r2.ackimixs.xyz/305.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	66TAAKeoOD0cFpVRug9IXZ	70	25	0
306	10 minutes	152440	https://r2.ackimixs.xyz/306.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3KLqY7E5dOgvfZ6qppQ9u7	70	25	0
307	Nouvelles	179653	https://r2.ackimixs.xyz/307.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7d391WfC0HtftRcetDFQUy	70	25	0
308	Cash	160186	https://r2.ackimixs.xyz/308.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	46dmfqeT2mzwKbSBD6V2o3	70	25	0
309	7/7	157386	https://r2.ackimixs.xyz/309.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5xoIhHhgZAoph1bz0o2Rtt	70	25	0
310	Pas de sentiments	125653	https://r2.ackimixs.xyz/310.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2Jqwwo5cUjQZ3d43BuCVlk	70	25	0
311	Pelo	117440	https://r2.ackimixs.xyz/311.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4VcB0rnLW3Q9vvEbL5nKdv	70	25	0
312	Panama Bende	177493	https://r2.ackimixs.xyz/312.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0h5KJnkDMA8fZswm7thalY	70	25	0
313	Décembre	139106	https://r2.ackimixs.xyz/313.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	25I2L2aKf1Hymv7H4gD3TC	70	25	0
314	1ntro'p	211746	https://r2.ackimixs.xyz/314.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3BHtZgssaXNil9uATzw76o	60	26	0
315	#TT	159933	https://r2.ackimixs.xyz/315.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	75kfVZGTaEeCDFjmujt1qj	60	26	0
316	Arsenik	207893	https://r2.ackimixs.xyz/316.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4bSbrbMLExS6H5OCCqjsmm	60	26	0
317	Parapluie	244546	https://r2.ackimixs.xyz/317.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6I0RkppLUfiUt1KoeF8u2G	60	26	0
318	La clé	172626	https://r2.ackimixs.xyz/318.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2JBnBUqpC3hrhMZv1Z9JKO	60	26	0
319	Mode AV (feat. Niska & Gazo)	192920	https://r2.ackimixs.xyz/319.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5b8HD1dJDuPawgS5FjSC2q	60	26	0
320	Si j'savais	223493	https://r2.ackimixs.xyz/320.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1bgL66Umw2xitBzjQnRSMx	60	26	0
321	Meuda	152546	https://r2.ackimixs.xyz/321.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4wNyrbY6B2Okii8VeKo2B2	60	26	0
322	Gasolina (feat. Rsko)	183053	https://r2.ackimixs.xyz/322.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6kwmp0U8M1tPvgPHqvbwsr	60	26	0
323	Soza	221426	https://r2.ackimixs.xyz/323.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4TdKWdXDQlxzt8UPPIGT1i	60	26	0
324	Riri / No camera	357706	https://r2.ackimixs.xyz/324.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5gIw1KJiXhrpnKGPcIY3YC	60	26	0
325	M3lo	138906	https://r2.ackimixs.xyz/325.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7ELft1cx8anhsXE405kckI	60	26	0
326	Atasanté (feat. Hamza)	214613	https://r2.ackimixs.xyz/326.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1oXn8nhl44cH6HXqGQnOgY	60	26	0
327	Roro (feat. SDM)	194826	https://r2.ackimixs.xyz/327.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0ikMJLqx8rq19jb6tIfD0R	60	26	0
328	Coucher de soleil	265200	https://r2.ackimixs.xyz/328.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5b8HQKrrfFII9kwOgDBmiK	60	26	0
329	R.I.Peace	226160	https://r2.ackimixs.xyz/329.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4wOMdLN4ckCqGC5wp8Bz7u	60	26	0
330	TOUTE LA JOURNÉE (feat. Tiakola)	168087	https://r2.ackimixs.xyz/330.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2nD4X3sHH2kZ1gWraTpe7u	68	27	0
331	Intro Rolex	167106	https://r2.ackimixs.xyz/331.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1e0bt0ceEbhimogdzWgcCQ	76	28	0
332	Maison hantée	225136	https://r2.ackimixs.xyz/332.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4iID5tW0yH9kgESntEz5Ce	76	28	0
333	Ciao	216333	https://r2.ackimixs.xyz/333.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3d7vLNeOXnzdBwUGbqklPE	76	28	0
334	Figaro	176946	https://r2.ackimixs.xyz/334.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2i6inLZ7heUSE1pQLQMASG	76	28	0
335	Grisaille	209933	https://r2.ackimixs.xyz/335.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1T1bzJ9qz37WfW9o9rcJTS	76	28	0
336	Laboratoire	162840	https://r2.ackimixs.xyz/336.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2GMXeFK2Zz6DqUP5LT9NHz	76	28	0
337	Virus	150586	https://r2.ackimixs.xyz/337.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5C7Yg86vsvMSVD4oXzX2sS	76	28	0
338	Tout seul	166760	https://r2.ackimixs.xyz/338.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5ckT7n48jEi0X31Tit1fDF	76	28	0
339	L'ancien	196626	https://r2.ackimixs.xyz/339.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5DnyGl5lPF3e5btCDCipV3	76	28	0
340	Vroum Vroum	184680	https://r2.ackimixs.xyz/340.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5eyeexCqXt6SqTcRx7eBWz	76	28	0
341	Satan 2	149800	https://r2.ackimixs.xyz/341.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6z1eCgVeuhctsKxarsNwEw	76	28	0
342	Nos labels c'est du papel	157386	https://r2.ackimixs.xyz/342.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5hKwohe5hGulzajpaqHKoO	76	28	0
343	Boussole	169973	https://r2.ackimixs.xyz/343.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	70uZpsISUU8qPBPuajTl8n	76	28	0
344	Escorte	194626	https://r2.ackimixs.xyz/344.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	41owO9tpVFmNAZ4IEpM2iK	76	28	0
345	Salaire	179746	https://r2.ackimixs.xyz/345.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2cWqszohtc49yiOmOYD1m3	76	28	0
346	Rude Boy	178493	https://r2.ackimixs.xyz/346.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0Pln8yPGv5LqcadbeGQb7k	76	28	0
347	Chemin d'or	212093	https://r2.ackimixs.xyz/347.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6g9JKWPybsqrZaqqgjCTx2	76	28	0
348	10.03.2023	160000	https://r2.ackimixs.xyz/348.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2uwdCyYYio0yplI31cLqqm	76	28	0
349	Mr. Ocho	226653	https://r2.ackimixs.xyz/349.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1xLCwgQcF6bKncTJmRGGws	75	29	0
350	Bolide allemand	176746	https://r2.ackimixs.xyz/350.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0EzNyXyU7gHzj2TN8qYThj	75	29	0
351	Ragnar	137520	https://r2.ackimixs.xyz/351.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6Fg2t44nTMh6Oerl1D5WOo	75	29	0
352	Nwar sur Nwar	201480	https://r2.ackimixs.xyz/352.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5uiv7eDJGMj47yg59HT4xW	75	29	0
353	Si tu savais	188560	https://r2.ackimixs.xyz/353.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3dRY9wpDvyIV7UZe9SnG1b	75	29	0
354	Cette année-là	188573	https://r2.ackimixs.xyz/354.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	10JrUDqAjSR8JlcFj6GK8i	75	29	0
355	Fame	199973	https://r2.ackimixs.xyz/355.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0l2C36tMNUSvunD0ECyNGQ	75	29	0
356	Dans le club	173133	https://r2.ackimixs.xyz/356.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1auLSAt03EwPE7q2ZrfdON	75	29	0
357	Jacque*** Bag	111586	https://r2.ackimixs.xyz/357.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3q2DNvmHfx7RFBSHfaVLoW	75	29	0
358	Franklin Saint	226946	https://r2.ackimixs.xyz/358.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6y8K9wBDMNLE9RCNdEFXCs	75	29	0
359	2sang43	175120	https://r2.ackimixs.xyz/359.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5PggKLOEflI2InGXqRoQTl	75	29	0
360	Redescends	161586	https://r2.ackimixs.xyz/360.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	17iXucMQMB1Ph3sXU3ZOMi	75	29	0
361	File de gauche	206040	https://r2.ackimixs.xyz/361.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0uUlCrtq69Z0RvIqwv6kgQ	75	29	0
362	Le temps	230800	https://r2.ackimixs.xyz/362.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2HG0SGdVycows4g5bhLH6R	75	29	0
363	Sang40	171333	https://r2.ackimixs.xyz/363.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1oz4XyBQi2m9Y61tyNNA2u	75	29	0
364	LA RUE	225137	https://r2.ackimixs.xyz/364.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7EO5oDxrq2dvYDgBjFvFYY	81	30	0
365	Finale - Nouvelle École	180000	https://r2.ackimixs.xyz/365.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	46NCn1HZ054Wy0o6H86teM	82	31	0
366	Intro	115466	https://r2.ackimixs.xyz/366.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5gTx6kpkQ0TN3DmgknTYMP	83	32	0
367	Frank Lucas	232146	https://r2.ackimixs.xyz/367.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	70IdN2Bm2IXU7xReA44AOD	83	32	0
368	Opaque	214946	https://r2.ackimixs.xyz/368.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5WcwuEjdHvNneqgNO10uVu	83	32	0
369	Galactic	134920	https://r2.ackimixs.xyz/369.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6t5eToKchEStEhi3TiM2aD	83	32	0
370	Fetty Wap	164346	https://r2.ackimixs.xyz/370.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4eCQd00uuhXtzgYRS4qW5C	83	32	0
371	Omerta	92000	https://r2.ackimixs.xyz/371.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	60vv2FTa31yyaYlJuDC7rI	83	32	0
372	Quand T’es Là	169986	https://r2.ackimixs.xyz/372.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5ZDWCmJWZIGeNQfXmXbD9z	83	32	0
373	La Pègre	148986	https://r2.ackimixs.xyz/373.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4wZLuEJNzXR0gnVR5gA7Yy	83	32	0
374	Velar	161920	https://r2.ackimixs.xyz/374.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2MGSHTuIsRqGmYqjswWiBB	83	32	0
375	Le Moine	207560	https://r2.ackimixs.xyz/375.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3mXiiDURmE5ieq3P6os0AT	83	32	0
376	B22	196653	https://r2.ackimixs.xyz/376.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	19f3WsiGZq0nG0bboLa7th	83	32	0
377	Rif	123920	https://r2.ackimixs.xyz/377.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3pjkpMQLqDjNEkvR5hPl8K	83	32	0
378	Criminel	163920	https://r2.ackimixs.xyz/378.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1o3nr1jAxdDigVleBhTVFG	83	32	0
379	Araï	182973	https://r2.ackimixs.xyz/379.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7rIt7p95T9y9ndjip9F83X	83	32	0
380	Malembé	194253	https://r2.ackimixs.xyz/380.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0dAdLqKqFPmOzkPiTA4V2K	83	32	0
381	Haut Et Bas	175760	https://r2.ackimixs.xyz/381.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3rzJq3vzLEytmK85c4oO3H	83	32	0
382	Boîte à Gants	167960	https://r2.ackimixs.xyz/382.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0074XGa4ytWx2s1o48jO3y	83	32	0
383	La Moto	174240	https://r2.ackimixs.xyz/383.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4V510Ew0CvcvMEpnye1UVM	83	32	0
384	La Honda	163226	https://r2.ackimixs.xyz/384.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3XT1DIBOAbFMyRnrO4Ce9f	83	32	0
385	Manon	146466	https://r2.ackimixs.xyz/385.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1wmm7YIDPMQaP5UGLQrPBk	83	32	0
386	LES PIEDS SUR TERRE	149000	https://r2.ackimixs.xyz/386.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0Xw25OXhmUovJNZZICrz4T	64	33	0
387	LVDC	173493	https://r2.ackimixs.xyz/387.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5H2yI3gWpB8JRijom3p4Qc	64	33	0
388	PLAQUÉ 13	173706	https://r2.ackimixs.xyz/388.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	046RrWqGgrw7siqkmhNfxu	64	33	0
389	QUARTIERS NORD	233160	https://r2.ackimixs.xyz/389.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4qW50maUjgenuAat1A2c7B	64	33	0
390	HÉRITIERS	164640	https://r2.ackimixs.xyz/390.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1nhC6hjwBrrleJy3FrZibe	64	33	0
391	LE DOUBLÉ	181240	https://r2.ackimixs.xyz/391.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6A625UxCul0C7wMPzq5gBe	64	33	0
392	VALLON DES AUFFES	191106	https://r2.ackimixs.xyz/392.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0mJHGKoDHfSkDxvzPbo6EV	64	33	0
393	FRÉRO	223253	https://r2.ackimixs.xyz/393.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	18BeJpT9XyidwR4XNwC5ts	64	33	0
394	TOUT VA BIEN (feat. Ninho & Naps)	192960	https://r2.ackimixs.xyz/394.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6OZwia8loN0aPS0vTvsBjR	64	33	0
395	CIAO LA FRANCE (feat. Skinny Flex)	181986	https://r2.ackimixs.xyz/395.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	61o6OHdxbrVzCidLzg3u89	64	33	0
396	J'AI GRANDI (feat. FAYV)	208266	https://r2.ackimixs.xyz/396.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5qIKR0rRvWP31mp9ACOtZG	64	33	0
397	PADDOCK	189480	https://r2.ackimixs.xyz/397.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2kqcLRUnITv4Ev30ygx2Yb	64	33	0
398	BISON	166906	https://r2.ackimixs.xyz/398.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2JkWkGL2OQHUpAdyRaH5a8	64	33	0
399	BUMPY	184893	https://r2.ackimixs.xyz/399.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1D8lLfcmm2kpW7CTdhrFN9	64	33	0
400	PROBLÈMES	194960	https://r2.ackimixs.xyz/400.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3wRDJXLakoOT8ilNPOOhh9	64	33	0
401	CAPO RESTE CAPO	162040	https://r2.ackimixs.xyz/401.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5oTbTzttP3kc1ySjZUpaUS	64	33	0
402	TRAFICANTE	189626	https://r2.ackimixs.xyz/402.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3mTOTW2KnH9pJlpy5o3cJK	64	33	0
403	En temps réel	165920	https://r2.ackimixs.xyz/403.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	47079xgWnX2N49XAIoGW94	88	34	0
404	C'est carré le S	201533	https://r2.ackimixs.xyz/404.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2f8JQJctq8LZtaq6Hgdgb8	88	34	0
405	Ma belleuh	185946	https://r2.ackimixs.xyz/405.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0mxeZGN3FVNAsRSAdnsosL	88	34	0
406	Purple	152893	https://r2.ackimixs.xyz/406.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0qZivPq7uIWS5R7sGApmXY	88	34	0
407	Le fruit de mon époque	173720	https://r2.ackimixs.xyz/407.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1UvV64YR5Bj9gUnRFW0YeT	88	34	0
408	Benef max	192000	https://r2.ackimixs.xyz/408.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3jboife4pCcUNUPbRxCjk9	88	34	0
409	C'est toute ma life	176720	https://r2.ackimixs.xyz/409.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5zwwpjVoTkeuo71yGqAkCN	88	34	0
410	La danse du roro	212053	https://r2.ackimixs.xyz/410.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6sR9M21Bl17LNMs07QSjyb	88	34	0
411	Le sang de la veine	169813	https://r2.ackimixs.xyz/411.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3PzVD2hPYXGhHz3cVhwZAf	88	34	0
412	Casa De Papel	162493	https://r2.ackimixs.xyz/412.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3b5abCqwOh3GfXsaDS87l8	88	34	0
413	Fast life	143880	https://r2.ackimixs.xyz/413.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5FOseq4dkkYtbttzw4YPvK	88	34	0
414	Vie sur nous	139133	https://r2.ackimixs.xyz/414.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	13g1tLN8l5wtCur5IjRiU3	88	34	0
415	Dua Lipa	174640	https://r2.ackimixs.xyz/415.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3eGoesLSmoacFL3ri6klkM	88	34	0
416	J'kiff ma Life	159626	https://r2.ackimixs.xyz/416.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0QOkjWZeuklWof0O4rTNTW	88	34	0
417	M'en aller	166013	https://r2.ackimixs.xyz/417.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3ioyekDi88cBHBGdvdAaO1	88	34	0
418	Mamacita	156786	https://r2.ackimixs.xyz/418.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3FJAUhb2GTQszyBkGDsM1m	88	34	0
419	Ça soutient fort	163173	https://r2.ackimixs.xyz/419.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1gzqXsSBr60jUios3HUfxq	88	34	0
420	Coachella	172720	https://r2.ackimixs.xyz/420.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1PLYrOQpfhQ1A9N7vRjsSM	88	34	0
421	Kassocita	143106	https://r2.ackimixs.xyz/421.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1De1v4aQok8JXNjZOLACF0	88	34	0
422	Sativa	190240	https://r2.ackimixs.xyz/422.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3eSoDu7UMXP7oW0FYxLc9S	88	34	0
423	Brouncha	182693	https://r2.ackimixs.xyz/423.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6UceEgPDtU9CSuzsKRI7pq	88	34	0
424	Frero	168986	https://r2.ackimixs.xyz/424.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4VBn8GnXVVYytuGM4CL3aD	88	34	0
425	Auto Détruit	106213	https://r2.ackimixs.xyz/425.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6E3lpxpwNbGA4sjWxCMr4E	94	35	0
426	Viral	231986	https://r2.ackimixs.xyz/426.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6BvSrWjWgizEFbefrYJmZf	94	35	0
427	Vie d'avant	176240	https://r2.ackimixs.xyz/427.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5ulVOTq5QVgpNkmYVC8hg1	94	35	0
428	Maybach	188573	https://r2.ackimixs.xyz/428.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1roybe6TpPG0elVCDUhPdg	94	35	0
429	Strada	137853	https://r2.ackimixs.xyz/429.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4PjYiRgCDrotH0Nb9m5nCW	94	35	0
430	Chaque jour	209226	https://r2.ackimixs.xyz/430.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6FUaG4NtiSnPibgHduxC6d	94	35	0
431	Iniesta	166266	https://r2.ackimixs.xyz/431.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2DXuTQ7JptmvWsa40sHcdh	94	35	0
432	Gun shot	150746	https://r2.ackimixs.xyz/432.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5vgS5QPbCAEgdFR2HfJmi4	94	35	0
433	Corazon	193280	https://r2.ackimixs.xyz/433.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5QDvt87wwX7HOE7HEtkgOc	94	35	0
434	Deux côtés	178613	https://r2.ackimixs.xyz/434.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5LkN2nBPtmTEb4hOBI6wjY	94	35	0
435	Mental	157093	https://r2.ackimixs.xyz/435.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5k2V0K1UfxCYAw4WoVil4s	94	35	0
436	Gibraltar	182320	https://r2.ackimixs.xyz/436.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3UA70infev5LVVAu3iKr8r	94	35	0
437	Pokito	159026	https://r2.ackimixs.xyz/437.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	10ZpsO9x1gIZK6NcIt79Fn	94	35	0
438	Breaking Bad	180653	https://r2.ackimixs.xyz/438.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	12LGo6AINOtfjkE8Q6o9nY	94	35	0
439	Né pour briller	283840	https://r2.ackimixs.xyz/439.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6vGPD87LRZYyZWafmQwV8F	94	35	0
440	Yafama - Nouvelle École	214901	https://r2.ackimixs.xyz/440.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2rd3kchMtUoVCP7S7a0Lxa	96	36	0
441	FADE UP	219187	https://r2.ackimixs.xyz/441.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4ZpIuzx91EAPK3VimONbfB	98	37	0
442	AMF - Nouvelle École	179769	https://r2.ackimixs.xyz/442.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0su56748WvAwZDecsY8ZNZ	100	38	0
443	AMBER	182067	https://r2.ackimixs.xyz/443.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5UPpgOKi0UQMMMSzWWgJJe	68	39	0
444	Urus	148015	https://r2.ackimixs.xyz/444.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2A44J8NMBI9DKi0AZW2W84	66	40	0
445	Mentalité	169760	https://r2.ackimixs.xyz/445.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	52UrFOAeY9bsifylstnsEj	101	41	0
446	Aqua	155400	https://r2.ackimixs.xyz/446.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	48NB8xi6yLBZVFeHozM6vG	101	41	0
447	Lola	146133	https://r2.ackimixs.xyz/447.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	43vjYTKZg8R5LsuITJ4wVu	101	41	0
448	Indiana	169786	https://r2.ackimixs.xyz/448.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2xAasEmLAq9cV00EeZZUNV	101	41	0
449	Intro	149840	https://r2.ackimixs.xyz/449.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4fU66QllpanU7fxwRpBQ5P	104	43	0
450	Millionnaire	213706	https://r2.ackimixs.xyz/450.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5H6WViUZcImv70pMmtt1S0	104	43	0
451	On roule	191533	https://r2.ackimixs.xyz/451.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6MOwhJCRPbORdMg1zIok6r	104	43	0
452	Qui sait ? (feat. ElGrandeToto)	190786	https://r2.ackimixs.xyz/452.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3ejjmzEsUfObGdmmQRVmM2	104	43	0
453	Jamais de nous	214373	https://r2.ackimixs.xyz/453.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3ujfC75PQpg3DI5bpJXYoS	104	43	0
454	Parti de rien (feat. Tayc)	256160	https://r2.ackimixs.xyz/454.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2OLDHbZNyVjslwlx7afzJq	104	43	0
455	Alpha 5.20	258359	https://r2.ackimixs.xyz/455.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7nRu7XBxQ9q7OPraoA6Gis	104	43	0
456	Mauvaise conduite (feat. TIG)	202666	https://r2.ackimixs.xyz/456.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6tTwumk2d7pzpQa6I2fW1z	104	43	0
457	Heureusement	169386	https://r2.ackimixs.xyz/457.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2wJPmQJcVEU6nRiSx52yTs	104	43	0
458	C'est pas assez	210760	https://r2.ackimixs.xyz/458.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2u7xTZ3HRREAVPOTeEuCg4	104	43	0
459	A qui la faute (feat. Niska)	203026	https://r2.ackimixs.xyz/459.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2OXCeVFF5vu0bk45poTCos	104	43	0
460	Khoya	267253	https://r2.ackimixs.xyz/460.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4UJOvziTWrb5pnf6TgXFli	104	43	0
461	Quand je serai grand (feat. Sofiane Pamart)	184920	https://r2.ackimixs.xyz/461.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5Tpw1YXRvCuppsjfTOiXCs	104	43	0
462	50 euros (feat. Alpha Wann)	238960	https://r2.ackimixs.xyz/462.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5Eluh0SRnZMiYtlAEotyhG	104	43	0
463	Okocha	206653	https://r2.ackimixs.xyz/463.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2iMg98TBkefe4gYgCJiGff	104	43	0
464	Taulier	201160	https://r2.ackimixs.xyz/464.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2kwUTjZLXAHvwk5Is0InWb	104	43	0
465	Papa fait le pitre	317426	https://r2.ackimixs.xyz/465.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4wbyiTBhKwgECsPFE4mdn5	104	43	0
466	Jolie Go	166654	https://r2.ackimixs.xyz/466.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4QiJK3bjjI3mbzyKDjjGlg	110	44	0
467	Magnum	225306	https://r2.ackimixs.xyz/467.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4trWevN28OiAmWa617Zb4N	99	45	0
468	LIF	194905	https://r2.ackimixs.xyz/468.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1bQzTUxeGELwCbWIan83V3	99	45	0
469	Niobe	148760	https://r2.ackimixs.xyz/469.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0MBUiPhMx69GRBu4PwfFjJ	99	45	0
470	Marginaux (feat. Dinos)	221000	https://r2.ackimixs.xyz/470.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	67PWiuodhQW3lAANwQpYjY	99	45	0
471	Offshore	218520	https://r2.ackimixs.xyz/471.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7FSBBwk1A5N9dlm0zMnAEM	99	45	0
472	Autobahn	170653	https://r2.ackimixs.xyz/472.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	03o8WSqd2K5rkGvn9IsLy2	99	45	0
473	Vivienne Westwood	157586	https://r2.ackimixs.xyz/473.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1p8r0CMfNikjvBIorZF2Is	99	45	0
474	Transmission Automatique (feat. So La Lune)	186973	https://r2.ackimixs.xyz/474.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5wXNVsx3hBKgIFuKeesh9K	99	45	0
475	Blue Bahamas	188106	https://r2.ackimixs.xyz/475.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5iAIYZr0t6sDNTTRv2evVI	99	45	0
476	Lilou Dallas	218160	https://r2.ackimixs.xyz/476.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2GgkH0MWw40xMXcwljb4mk	99	45	0
477	83K	159320	https://r2.ackimixs.xyz/477.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	77GoFjP18yMFeSkdVosP1c	99	45	0
478	Cœur de môme	175800	https://r2.ackimixs.xyz/478.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6a201YbN5MGavXYxDxd1n9	99	45	0
479	Blanc Bleu	179986	https://r2.ackimixs.xyz/479.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1o0h9KfmBQYJYEvBorkCiM	99	45	0
480	Actes	186480	https://r2.ackimixs.xyz/480.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1A18fWpnZE3Lwrm4JCjbGa	99	45	0
481	Carolina	195459	https://r2.ackimixs.xyz/481.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	22IP2WKjuGYQ19JAz5GpAv	61	46	0
482	Cristales	258897	https://r2.ackimixs.xyz/482.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2N6nvOoosSaNduG3wmZJo7	85	47	0
483	Paz	186000	https://r2.ackimixs.xyz/483.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5wFtUYK4cSjgVc760eLlcs	85	47	0
484	Mi Barrio	199411	https://r2.ackimixs.xyz/484.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4pS2RiGbEKQbrkeH21QuMe	85	47	0
485	No Estuviste En Lo Malo	247680	https://r2.ackimixs.xyz/485.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3hQARI8XG01UawaCalyfjK	85	47	0
486	Andando	261713	https://r2.ackimixs.xyz/486.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0yK1nUASmGNYKUH5qpXeOY	85	47	0
487	Soledad	228349	https://r2.ackimixs.xyz/487.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3kxXMYZKZka5g4SyqNsk09	85	47	0
488	Estopa	225000	https://r2.ackimixs.xyz/488.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	49BwXf5qkukZN91iFfnNVM	85	47	0
489	Niños Pequeños	257560	https://r2.ackimixs.xyz/489.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1yFEsKBUzjL7ODRtxgR5pM	85	47	0
490	María	190515	https://r2.ackimixs.xyz/490.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4i49MfWN68HFd5cAeyoVtq	85	47	0
491	Poporopa	187272	https://r2.ackimixs.xyz/491.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4Fv2ZAQ0U1lsEGjhghcdb0	85	47	0
492	Se Grita	259627	https://r2.ackimixs.xyz/492.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	55Q180Og5mkW2XeGPjB7yn	85	47	0
493	Por Los Míos	236307	https://r2.ackimixs.xyz/493.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5RY2rdVa0AUg2vi6nvC6sP	85	47	0
494	Ojos Sin Ver	191615	https://r2.ackimixs.xyz/494.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3l7ixTpHmRxjjH05OnWY6f	85	47	0
495	Desespero	194400	https://r2.ackimixs.xyz/495.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1Dlzq86mlvJEkaGoS9c7MN	85	47	0
496	Problemas	228000	https://r2.ackimixs.xyz/496.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2WYd3pWMDXUExZaU1vD3vF	85	47	0
497	Walou Bla Bla	177272	https://r2.ackimixs.xyz/497.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	58xvamZp3NecBCy3zGoSKN	85	47	0
498	Un Amigo Me Falló	218901	https://r2.ackimixs.xyz/498.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5n8GAcqjg5mkZaTRJIDu1x	85	47	0
499	Tiempo de Nada	230204	https://r2.ackimixs.xyz/499.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0W4qe30BMkPY98jWtVe6ZS	85	47	0
500	Caballero	219699	https://r2.ackimixs.xyz/500.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4qq6ngz0AWeN0jqEeFhbq9	85	47	0
501	Nous deux	221653	https://r2.ackimixs.xyz/501.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6APVzgDu9ni6rIcSubOZz3	75	48	0
502	Nocif	229386	https://r2.ackimixs.xyz/502.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7FeWKPL2gj7xIRv5gyHejU	74	49	0
503	Papillon de nuit - Remasterisé en 2004	298746	https://r2.ackimixs.xyz/503.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6LVtT13c0mR6taLalhIpSn	119	51	0
504	Dancing Brave - Remasterisé en 2004	187733	https://r2.ackimixs.xyz/504.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2JVPwlF59N6bCAGs3ncEDf	119	51	0
505	Babacar - Remasterisé en 2004	289333	https://r2.ackimixs.xyz/505.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0xCWuxvVaWKl15vFrCMFkG	119	51	0
506	J'irai où tu iras - Remasterisé en 2004	231306	https://r2.ackimixs.xyz/506.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4XNdW1BlA6emIfHmMr7krb	119	51	0
507	Ella, elle l'a - Remasterisé en 2004	291400	https://r2.ackimixs.xyz/507.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	67CfbIKKTCKFqmQLJwUftX	119	51	0
508	Evidemment - Remasterisé en 2004	206626	https://r2.ackimixs.xyz/508.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1kYi6X7VMmU3rCiE2aWjV1	119	51	0
509	La chanson d'Azima - Remasterisé en 2004	166640	https://r2.ackimixs.xyz/509.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6vEDxoDnx6O0OIEDSs2hYa	119	51	0
510	Urgent d'attendre - Remasterisé en 2004	224466	https://r2.ackimixs.xyz/510.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5CcGmunPo7oysU3zDTg93q	119	51	0
511	C'est bon que tu sois là - Remasterisé en 2004	221546	https://r2.ackimixs.xyz/511.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	59Aoa76vwIhtMQ5ml1tNuR	119	51	0
512	Le verrou	142733	https://r2.ackimixs.xyz/512.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0IlXC8XEMJakZbHAULVwqr	120	52	0
513	Échafaudages	207866	https://r2.ackimixs.xyz/513.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3uNrQHECAOKUn7RbdgL7sc	120	52	0
514	Avisos	192293	https://r2.ackimixs.xyz/514.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3GjFOEAAHtgGx6kywETQxq	120	52	0
515	Gare à la casse	234093	https://r2.ackimixs.xyz/515.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3NCruJfDObLxF6esa9otGY	120	52	0
516	Fille du feu	257706	https://r2.ackimixs.xyz/516.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	06ZDFmdHuT17HgU4ipoAvM	120	52	0
517	Foutu	243693	https://r2.ackimixs.xyz/517.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6jgIEUWfklbHh4zfQaKJi0	120	52	0
518	Fais-moi une place	216866	https://r2.ackimixs.xyz/518.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3sxOptguVVowIbz3FMp5vF	120	52	0
519	Petits pois lardons	271573	https://r2.ackimixs.xyz/519.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3zNzRxZAIAUhv9DFe1ySZZ	120	52	0
520	Le chiendent	220600	https://r2.ackimixs.xyz/520.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2TRD2TZuWzSc6IicjQWVxe	120	52	0
521	Petit Joseph	252706	https://r2.ackimixs.xyz/521.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6gEwSAz9TdbjHbo9ecixhA	120	52	0
522	Nouveau Big Bang	161160	https://r2.ackimixs.xyz/522.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4vcvVACte9bJ5ZcmREeAxq	120	52	0
523	Le verrou - Reprise	73866	https://r2.ackimixs.xyz/523.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2XkyKIztpkERWKveKcunOY	120	52	0
524	Pour que tu m'aimes encore	254093	https://r2.ackimixs.xyz/524.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6qlpXtA29VcxCNgLWR5IWx	121	53	0
525	Le ballet	263266	https://r2.ackimixs.xyz/525.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2fhQu3b0YqxOKTMt8HQXSA	121	53	0
526	Regarde-moi	236466	https://r2.ackimixs.xyz/526.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5Jt2PmCIndH7XCCd8c91Ti	121	53	0
527	Je sais pas	273133	https://r2.ackimixs.xyz/527.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	19ncRYEjjcGiRQgvqXOExO	121	53	0
528	La mémoire d'Abraham	229600	https://r2.ackimixs.xyz/528.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0AvmX6FCD7CXBxXi1ca0Un	121	53	0
529	Cherche encore	203866	https://r2.ackimixs.xyz/529.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4RzX2J6QTy0QEPCFbL0ByH	121	53	0
530	Destin	254773	https://r2.ackimixs.xyz/530.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1k1TYnOyqus6URRlENhmB6	121	53	0
531	Les derniers seront les premiers	212906	https://r2.ackimixs.xyz/531.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	32Qsu5EDr6ULaQFPOCmuOI	121	53	0
532	J'irai où tu iras (with Jean-Jacques Goldman)	205800	https://r2.ackimixs.xyz/532.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	17LZKLjQxH2w67xMa8mWML	121	53	0
533	J'attendais	263693	https://r2.ackimixs.xyz/533.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3WjGs9JgOrN3uCX06glf4c	121	53	0
534	Prière païenne	249733	https://r2.ackimixs.xyz/534.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5qrVEJLwzDbASSVcfpMJO4	121	53	0
535	Vole	176906	https://r2.ackimixs.xyz/535.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6OthNPtCybxL02z2V9o7Y8	121	53	0
536	Il suffira d'un signe	264986	https://r2.ackimixs.xyz/536.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5cm8rgW7MaSyqerLYiiRkX	122	54	0
537	Pas l'indifférence - Live En public 1986	266853	https://r2.ackimixs.xyz/537.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1ZY7q5TvxEXGompIxkTQ9X	122	54	0
538	Quand la musique est bonne	230746	https://r2.ackimixs.xyz/538.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4dBS1TmY0D5cIPlCfjEYLA	122	54	0
539	Comme toi	257293	https://r2.ackimixs.xyz/539.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2jaZ4hBoKFoyexyhGkIHmx	122	54	0
540	Etre le premier	237506	https://r2.ackimixs.xyz/540.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	00cJkDaW5cdPxqdPdydquf	122	54	0
541	Au bout de mes rêves	226693	https://r2.ackimixs.xyz/541.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2vB09wDnu9de0GCiAGDGid	122	54	0
542	Je ne vous parlerai pas d'elle	284706	https://r2.ackimixs.xyz/542.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3Fwjx4Qs64BoNeXjqfbZsq	122	54	0
543	Si tu m'emmènes	217066	https://r2.ackimixs.xyz/543.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1kGkVcqQkj6Jc1KkG6Vncb	122	54	0
544	Veiller tard - Live	248693	https://r2.ackimixs.xyz/544.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1monTO1cpq0HmXVoyBIksi	122	54	0
545	Envole-moi	308506	https://r2.ackimixs.xyz/545.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5DUDPxGamYE4rtOqDjnDYG	122	54	0
546	Dors bébé, dors	206386	https://r2.ackimixs.xyz/546.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3ifUIq2b6o9zk9ua689u0u	122	54	0
547	Encore un matin	251813	https://r2.ackimixs.xyz/547.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4i5YyUO3u0g0rcXjnutfbd	122	54	0
548	Long Is the Road (Américain)	283626	https://r2.ackimixs.xyz/548.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6bbRptfTIDVJc55HQ2vvCU	122	54	0
549	Nous ne nous parlerons pas	267600	https://r2.ackimixs.xyz/549.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4XRSu60gYeOc2jscVdNy7R	122	54	0
550	Pas toi	330893	https://r2.ackimixs.xyz/550.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2qGxs4cbDKTjD71QgdSESO	122	54	0
551	Il changeait la vie	239106	https://r2.ackimixs.xyz/551.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	15wi1FgtmMBHtFgD0iWoQf	122	54	0
552	Là-bas	339866	https://r2.ackimixs.xyz/552.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1f6xuXGFerDcDb0QTV5XLS	122	54	0
553	Elle a fait un bébé toute seule	233600	https://r2.ackimixs.xyz/553.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7CjPiRmZ6UHNlTUVGjWNcn	122	54	0
554	Puisque tu pars	449533	https://r2.ackimixs.xyz/554.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1aYnXGKejvrfiD46BihnzA	122	54	0
555	C'est ta chance	299066	https://r2.ackimixs.xyz/555.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3Q5YPk1Tn0RAuSFUFPWUj9	122	54	0
556	Reprendre c'est voler	170200	https://r2.ackimixs.xyz/556.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5m9UlaaBLQDI6Awpaxr14D	122	54	0
557	Filles faciles	224760	https://r2.ackimixs.xyz/557.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0izebNjnbVipaL3RoqgJlM	122	54	0
558	Doux	234800	https://r2.ackimixs.xyz/558.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1OVgqjZ1weIU2rn13zIQaF	122	54	0
559	Il y a	219066	https://r2.ackimixs.xyz/559.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5CyBFj1y77MkIePYcvR1B1	122	54	0
560	Peur de rien blues - Live	472746	https://r2.ackimixs.xyz/560.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2tB4HhBPfTyxjCpKT2gbHr	122	54	0
561	La corrida - Remastered	342613	https://r2.ackimixs.xyz/561.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5MtP6QGoOkA1L5ynZyQEiv	124	55	0
562	Assis sur le rebord du monde - Remastered	206133	https://r2.ackimixs.xyz/562.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4qxIYfd899cRtHPbjU7ep1	124	55	0
563	La cabane du pêcheur - Remastered	308093	https://r2.ackimixs.xyz/563.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6yyBPctdUt6eXdRz6DCCRl	124	55	0
564	Samedi soir sur la terre - Remastered	414360	https://r2.ackimixs.xyz/564.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3HeHBDnkQZjNIts50VM021	124	55	0
565	Je t'aimais, je t'aime, je t'aimerai - Remastered	278253	https://r2.ackimixs.xyz/565.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1sTWIzAlg8HapeWz2fXvfJ	124	55	0
566	Les vidanges du diable - Remastered	290186	https://r2.ackimixs.xyz/566.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3vUPE8B2H7HU8OLQpSWlRy	124	55	0
567	L' arbre va tomber - Remastered	333453	https://r2.ackimixs.xyz/567.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1t90hmVVx3MYellzvior8p	124	55	0
568	Octobre - Remastered	215586	https://r2.ackimixs.xyz/568.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0nviNTKaGhRdrWIEi2XjAk	124	55	0
569	Le noceur - Remastered	414573	https://r2.ackimixs.xyz/569.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	46W1N5lkQeCovXTR4wKSvm	124	55	0
570	Tôt ou tard s'en aller - Remastered	240960	https://r2.ackimixs.xyz/570.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0XnATiNXDRj6R9W2gTYPRF	124	55	0
571	Ça ne tient pas debout - Remasterisé en 2002	395760	https://r2.ackimixs.xyz/571.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	64HNccPlAAW7X3axCSnBxh	125	56	0
572	À quoi il sert - Remasterisé en 2002	384520	https://r2.ackimixs.xyz/572.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7atOs5nPYXL8JiEekO98VK	125	56	0
573	Les enfants chantent toujours - Remasterisé en 2002	249693	https://r2.ackimixs.xyz/573.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5deUkLUo67Z0fgGvyZ68So	125	56	0
574	Privé d'amour - Remasterisé en 2002	327133	https://r2.ackimixs.xyz/574.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	65q0qNwVlg3vExIfTYMTlo	125	56	0
575	Le paradis blanc - Remasterisé en 2002	396493	https://r2.ackimixs.xyz/575.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6N6uTt8e1vLLgIZK5FgSYh	125	56	0
576	Danser sur la glace - Remasterisé en 2002	366640	https://r2.ackimixs.xyz/576.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7dGs61EQytyS0xjDS9yR0H	125	56	0
577	L'un sans l'autre - Remasterisé en 2002	333720	https://r2.ackimixs.xyz/577.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7LVaB79Q8lBsHb3mLocGVY	125	56	0
578	Chanson pour Man Ray - Remasterisé en 2002	199706	https://r2.ackimixs.xyz/578.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0BZ70LxFfgI7NTrlwMhQ2Y	125	56	0
579	L'orange bleue - Remasterisé en 2002	352120	https://r2.ackimixs.xyz/579.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1OkHCaW1RcSZhCHUtx2AnN	125	56	0
580	J'aurais voulu parler	343701	https://r2.ackimixs.xyz/580.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6cp4bH2zdVEEZ3XGfG8ILs	126	57	0
581	Les pluies de novembre	253352	https://r2.ackimixs.xyz/581.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7hn0sTmWrTSxO5WLGfl0uU	126	57	0
582	Te souviens-tu de moi	191332	https://r2.ackimixs.xyz/582.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2NhjvIXaap1HzjvyvIlVRP	126	57	0
583	On s'était dit	294103	https://r2.ackimixs.xyz/583.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6iuvfNyUg6X0AVlmcCCFA8	126	57	0
584	Grand comme ça	225419	https://r2.ackimixs.xyz/584.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2PR8jWwzXR4w9E0snYz5mS	126	57	0
585	Amoureuse - Remasterisé en 2008	221600	https://r2.ackimixs.xyz/585.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5jcS1ZXOYMexs2y88yFnyn	127	58	0
586	Tout est cassé, tout est mort - Remasterisé en 2008	168933	https://r2.ackimixs.xyz/586.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2584Pkv87yu90JRg5nBT5B	127	58	0
587	L'irréparable - Remasterisé en 2008	129986	https://r2.ackimixs.xyz/587.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4ljD22ws7VdzYHI295cqMC	127	58	0
588	Louis - Remasterisé en 2008	122426	https://r2.ackimixs.xyz/588.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1pzFOdGGIEXXggzH5m4wDQ	127	58	0
589	Mariavah - Remasterisé en 2008	216746	https://r2.ackimixs.xyz/589.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0D5eN1l1ehEjIZq3heREpp	127	58	0
590	Pour les Michel - Remasterisé en 2008	66733	https://r2.ackimixs.xyz/590.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2DmfEH1w9rZjjWGgPYiUuF	127	58	0
591	Pour qui - Resmasterisé en 2008	155880	https://r2.ackimixs.xyz/591.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	41NaHoOqyVY5HOassY2BaH	127	58	0
592	Vert vert vert - Remasterisé en 2008	116333	https://r2.ackimixs.xyz/592.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	158k3ck7ewgP57pfsoYhwG	127	58	0
593	Besoin de personne - Remasterisé en 2008	168013	https://r2.ackimixs.xyz/593.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0zjza5UtS00ws0CjObVsvQ	127	58	0
594	Bahia - Remasterisé en 2008	132040	https://r2.ackimixs.xyz/594.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3Vkx049ilK9PsnoS5qufhI	127	58	0
595	C'est le moment - Remasterisé en 2008	143320	https://r2.ackimixs.xyz/595.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2C1mkeIuQRMW93Ufj99VDz	127	58	0
596	Dis-lui (de revenir) - Remasterisé en 2008	61986	https://r2.ackimixs.xyz/596.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3060pNWPdGpe0WrZDfPWCD	127	58	0
597	Amoureuse (feat. Fanny Ardant)	264586	https://r2.ackimixs.xyz/597.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0e1LvHNdegztAuXYKK1qm0	127	58	0
598	Amoureuse - Maquette 1971	178093	https://r2.ackimixs.xyz/598.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2Q0Rt4B9eNUC8RI9utvgf9	127	58	0
599	Louis - Maquette 1971	115973	https://r2.ackimixs.xyz/599.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6bgg20Ot3cc0AKvhj8cKoK	127	58	0
600	Pour les Michel - Maquette 1971	113906	https://r2.ackimixs.xyz/600.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0CpA3wPqH5kBTYHGhHIh25	127	58	0
601	Vert vert vert - Maquette 1971	120093	https://r2.ackimixs.xyz/601.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2REKjKsAjrl2VPPdBKvCSz	127	58	0
602	Bahia - Maquette 1971	98933	https://r2.ackimixs.xyz/602.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	40bhccgu0f1MKA6Y2BEkHv	127	58	0
603	C'est le moment - Maquette 1971	145426	https://r2.ackimixs.xyz/603.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7wpxsEoYneWN5a2wWy43S8	127	58	0
604	Dis-lui de revenir - Maquette 1971	56320	https://r2.ackimixs.xyz/604.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5FmZRC2Okr047E8JMMZV3q	127	58	0
605	Passé composé - Maquette 1971	64826	https://r2.ackimixs.xyz/605.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	50FZWbIftItJemn5saS0LI	127	58	0
606	Tout est cassé, tout est mort - Maquette 1971	123106	https://r2.ackimixs.xyz/606.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5Vgh0nQO2iAUnhbY3LRrwy	127	58	0
607	L'irréparable - Maquette 1971	142973	https://r2.ackimixs.xyz/607.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6Hvv0BmnByPvzkgTihh1kS	127	58	0
608	Panne de coeur - Maquette 1971	66066	https://r2.ackimixs.xyz/608.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4dCsOK9hTQIVlw21jed1zN	127	58	0
609	Amoureuse - Version anglaise, 1972	222133	https://r2.ackimixs.xyz/609.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	34VwMdiInzn3Gia9iAKhsT	127	58	0
610	Needed Nobody - Version anglaise, 1972	166106	https://r2.ackimixs.xyz/610.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	48v1oZTZghDDNFsi1DGuZG	127	58	0
611	Green Green Green - Version anglaise, 1972	116160	https://r2.ackimixs.xyz/611.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3TvAGNXHAbg9VtxIrkzH0J	127	58	0
612	Birds of Summer - Version anglaise, 1972	59800	https://r2.ackimixs.xyz/612.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6360sFH2RAw4DGavX3fP3i	127	58	0
613	Amoureuse - Version allemande, 1973	221826	https://r2.ackimixs.xyz/613.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	26NraowKdibio7RYdhEfPz	127	58	0
614	Regen am Morgen - Version allemande, 1973	165586	https://r2.ackimixs.xyz/614.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5D2EA0ToubW3nqJ6LgAMoI	127	58	0
615	Enamorada - Version espagnole, 1973	220893	https://r2.ackimixs.xyz/615.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5IVvkOgmiPBZ8smcZZSKec	127	58	0
616	Necesidad de nadie - Version espagnole, 1973	165453	https://r2.ackimixs.xyz/616.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3IQrZzjr5kUoyv0wMcS9ka	127	58	0
617	Diverso amore mio - Version italienne, 1978	220440	https://r2.ackimixs.xyz/617.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4Gjw7C2S4uY0xerULP5NnE	127	58	0
618	La nuit se fait attendre - Maquette 1971	146653	https://r2.ackimixs.xyz/618.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5KFNhSPNijDWe5w5RpTima	127	58	0
619	Bahia - Single Version 1994	160400	https://r2.ackimixs.xyz/619.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3DCkTEDmYKkbks6qUQwsAZ	127	58	0
620	Bahia - Remix Club I	351053	https://r2.ackimixs.xyz/620.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2zS3NWfuXqPiMH9cJh3nMA	127	58	0
621	L'Irréparable - Live à Cergy, 1982	166066	https://r2.ackimixs.xyz/621.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2kferyHaxBZd4t29ql1HQr	127	58	0
622	C'est le moment - Live à Nice, 1984	167733	https://r2.ackimixs.xyz/622.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0GQRNGXAL4V5a1V6VcAzNK	127	58	0
623	Amoureuse - Live à Toulouse, 1998	233693	https://r2.ackimixs.xyz/623.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	38WW7VMiJnl5SlvdDBDdHK	127	58	0
624	Aimer est plus fort que d'être aimé	245120	https://r2.ackimixs.xyz/624.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	112mJNSudZnvXE3x4mPb6C	129	59	0
625	Tous les cris les S.O.S.	302866	https://r2.ackimixs.xyz/625.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2rkw1gqH62Tc9ydm9jsEJ1	129	59	0
626	L'Aziza	260587	https://r2.ackimixs.xyz/626.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1uFWyT4KLFXisiVkiBPCTb	129	59	0
627	Le blues est blanc	213892	https://r2.ackimixs.xyz/627.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5V3Z89PLgxBOm2uGIHrs8H	129	59	0
628	Sauver l'amour	263356	https://r2.ackimixs.xyz/628.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2oWt0SAy9XKwrCufC4yCwX	129	59	0
629	Petite Angèle	281785	https://r2.ackimixs.xyz/629.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0nCPzric3OZJEm1pvD54Mb	129	59	0
630	Petit homme mort au combat	299232	https://r2.ackimixs.xyz/630.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0g3ww0gdtnGKJWO4BdHicG	129	59	0
631	Ne parle pas de malheur	272748	https://r2.ackimixs.xyz/631.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	458mypuP57ArLtVGb1G3Hv	129	59	0
632	Un enfant assis attend la pluie	352480	https://r2.ackimixs.xyz/632.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2MXGykHvjoUxt0n62pHJjM	129	59	0
633	L'Atlantique	211093	https://r2.ackimixs.xyz/633.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1owtMkwbQZvKWlokkCgSOT	130	60	0
634	Les corons	254266	https://r2.ackimixs.xyz/634.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2RXjwVq4YTuh1PflBgVKTj	130	60	0
635	Elle est d'ailleurs	232973	https://r2.ackimixs.xyz/635.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	17jqKcsnznw38YtAiGG3S5	130	60	0
636	Flo	278600	https://r2.ackimixs.xyz/636.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6OrW9oR2N4SGUORaU5mEnu	130	60	0
637	Emmanuelle - French Version	188693	https://r2.ackimixs.xyz/637.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	29mx7TGZs3DtuQGkLlHdxz	130	60	0
638	Tu es là au rendez-vous	212866	https://r2.ackimixs.xyz/638.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7nLBfB2LN7SBE25sbIqhtK	130	60	0
639	Marionnettiste	294106	https://r2.ackimixs.xyz/639.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6ohVFU3E1i5Ke7k37vtDdS	130	60	0
640	En l'an 2001	327293	https://r2.ackimixs.xyz/640.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4Lv1Xqqu5vvl3jjiyhGn4j	130	60	0
641	Vingt ans	259173	https://r2.ackimixs.xyz/641.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	37tezSawJIQE9DpIpbR5Eo	130	60	0
642	Écris-moi	206560	https://r2.ackimixs.xyz/642.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4T8UdcE6n7KkBYWKus8KeA	130	60	0
643	La Ville Ainsi Soit-Il	259373	https://r2.ackimixs.xyz/643.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	34T07xV8pejax0DJjUu0a7	130	60	0
644	Les Lolas	239933	https://r2.ackimixs.xyz/644.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6Nra1nDJg7wPokWLiX3RU0	130	60	0
645	Pleure pas boulou	291893	https://r2.ackimixs.xyz/645.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	699iiyUq93odB2nkPLdZ8X	130	60	0
646	Embrasse-la	197066	https://r2.ackimixs.xyz/646.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	20iYmz4NpL66YtGVhVolao	130	60	0
647	L'Homme En Blanc	267866	https://r2.ackimixs.xyz/647.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2vO3AMxL4gx2KHAw7CRM6N	130	60	0
648	Né Pour Vivre	245400	https://r2.ackimixs.xyz/648.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	46c187gz2bByZOQUkv15oN	130	60	0
649	A perpétuité	220773	https://r2.ackimixs.xyz/649.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2SSsAAKNC8k5QKlKFwZ1h7	130	60	0
650	Partenaire particulier	247973	https://r2.ackimixs.xyz/650.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6S3RLyhmC0rO5jirBtJEK7	134	61	0
651	Saint-Etienne	187106	https://r2.ackimixs.xyz/651.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6qO7Bn1Yslo4poftlVQYwV	135	62	0
652	Petit	270160	https://r2.ackimixs.xyz/652.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5n5Id7g3EqOtDiRrJukfXH	135	62	0
653	Les mains d’or	253373	https://r2.ackimixs.xyz/653.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4vVRXMcXA3AZpLZC35r2V7	135	62	0
654	Idées noires	207346	https://r2.ackimixs.xyz/654.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	41WB5uXxG0wriIxpYNIFxo	135	62	0
655	Noir et blanc	273386	https://r2.ackimixs.xyz/655.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0IrkoSj8VfMFDJPMmKXnZF	135	62	0
656	La grande marée	281306	https://r2.ackimixs.xyz/656.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6Q95KhQ6GXYwBJIjLqCOAu	135	62	0
657	Les barbares	273733	https://r2.ackimixs.xyz/657.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5hUW7PeVd2rrqziCTUoVgH	135	62	0
658	Fensch vallée	188493	https://r2.ackimixs.xyz/658.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2KtZbwb0bFzDMlWZPnB4rT	135	62	0
659	Traffic	226173	https://r2.ackimixs.xyz/659.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	58AzTpBYldLZrrIFUDmFyU	135	62	0
660	Betty	284306	https://r2.ackimixs.xyz/660.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6ndS5OrhVcHd2BPrCBnklk	135	62	0
661	On The Road Again	181973	https://r2.ackimixs.xyz/661.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2EIjSbzkTqGHwiwSwYEqUK	135	62	0
662	Manila Hotel	182333	https://r2.ackimixs.xyz/662.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0ClcAy7drezg4eb5gsIrL2	135	62	0
663	Attention fragile	231346	https://r2.ackimixs.xyz/663.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4YXq2cAarrWL9PcFQIdCGf	135	62	0
664	Melody Tempo Harmony	214546	https://r2.ackimixs.xyz/664.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1U4RC2E3MBkdA6cyqJtWL0	135	62	0
665	Gitan	245666	https://r2.ackimixs.xyz/665.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6ZDQSjfR7gk326zR1B8JSg	140	63	0
666	Que l'amour est violent	341266	https://r2.ackimixs.xyz/666.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7DS8wehdmjuDRxRnmwjWW3	140	63	0
667	Demande au soleil	333960	https://r2.ackimixs.xyz/667.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2al5FV7uw6bnJR7ncLfjz8	140	63	0
668	Seul	281373	https://r2.ackimixs.xyz/668.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7MRyru6giOwdtFYL5KQEVq	140	63	0
669	Sous le vent	211293	https://r2.ackimixs.xyz/669.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6VZB0ttlqGjpGMAcaomXh9	140	63	0
670	Je n'attendais que vous	318666	https://r2.ackimixs.xyz/670.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5ln6N51J6r9zNZNcFPu1Xs	140	63	0
671	Criminel	225333	https://r2.ackimixs.xyz/671.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5fazcQoRfYQke80bxgBWlj	140	63	0
672	Le calme plat	250440	https://r2.ackimixs.xyz/672.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4Djn01utoqON7VNwbPmryH	140	63	0
673	Au plaisir de ton corps	278293	https://r2.ackimixs.xyz/673.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1lWcWiOkIWNPpGCAORvMHi	140	63	0
674	La moitié du ciel	251240	https://r2.ackimixs.xyz/674.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6DcKn1vrV9sErelVRqUzBi	140	63	0
675	Lis dans mes yeux	244493	https://r2.ackimixs.xyz/675.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	4A20zsJWczv2DvHs5GsmJ4	140	63	0
676	Jusqu'à me perdre	267173	https://r2.ackimixs.xyz/676.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3du7auhjRoBcFV55iWGkR0	140	63	0
677	Gambler	277626	https://r2.ackimixs.xyz/677.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1XYcs8blYos8JvKWlnKOXO	140	63	0
678	L'adieu	241506	https://r2.ackimixs.xyz/678.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6vQ0OgX3VnuNvl4VJrmsQV	140	63	0
679	Enterre Mon Coeur Au Ciné Majestic	78400	https://r2.ackimixs.xyz/679.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1ce8ZtmjepOWFQTezgrRnG	141	64	0
680	Et la voix d' Elvis	151506	https://r2.ackimixs.xyz/680.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5zEiFbUU29cu8ByR31Psny	141	64	0
681	C'Est Charlie Brown	146733	https://r2.ackimixs.xyz/681.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	0OrdK6Id0144KNd92djfr1	141	64	0
682	La Colline De Blueberry Hill	165293	https://r2.ackimixs.xyz/682.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7JoIyjwfBixStJCfOXUvBA	141	64	0
683	Le Père De James Dean	169733	https://r2.ackimixs.xyz/683.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	2QkBg98uSPTPzMnS3QRU7A	141	64	0
684	Pire qu'une chanson d'été	158866	https://r2.ackimixs.xyz/684.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5tDPnANdL6AIfoUmeOMR4V	141	64	0
685	Mon Flash Back	155733	https://r2.ackimixs.xyz/685.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7d8UIilQaYDy2o4aSsUc1I	141	64	0
686	La dernière séance	213226	https://r2.ackimixs.xyz/686.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1LMMoxkBJe9NfGEQikGK0B	141	64	0
687	Sens Unique	142533	https://r2.ackimixs.xyz/687.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7ibHlIhJmt9RieRAYfEnZm	141	64	0
688	Laisse Tomber Le Ciel	220173	https://r2.ackimixs.xyz/688.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1uVUBC2lckURsyGrgU2niT	141	64	0
689	L'Amour En Cadillac	167560	https://r2.ackimixs.xyz/689.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	7aqnefRTX5lBWoxfVwyG48	141	64	0
690	Le Chanteur Du Dancing	247040	https://r2.ackimixs.xyz/690.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	1v1DNlIUZMMHFCBPu2cxzA	141	64	0
691	Ça ira	201426	https://r2.ackimixs.xyz/691.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5C2Z4wUonzbbXayoVG0YfZ	142	65	0
692	Compile	199200	https://r2.ackimixs.xyz/692.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	37OxMgatnDqpBlhh1WCS8k	142	65	0
693	Petite blonde	175213	https://r2.ackimixs.xyz/693.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3epVCFwDgiTJKtXNvXVm8G	142	65	0
694	Pardonnera	188280	https://r2.ackimixs.xyz/694.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3Tcw1IYo3gMdQeqQDDhVsr	142	65	0
695	Jimmie	189160	https://r2.ackimixs.xyz/695.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5WDbJ2ZemTFiEZRavU3qdR	142	65	0
696	Piano coccinelle	193293	https://r2.ackimixs.xyz/696.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	3SLyo174teQBvQhmInuvfp	142	65	0
697	Nino ou Rose	171413	https://r2.ackimixs.xyz/697.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	5LnXgLMe6HC1slH8PRAjWH	142	65	0
698	Prélude	69240	https://r2.ackimixs.xyz/698.mp3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     	6ae5XRhsZSG9Cz0psynP7U	142	65	0
\.


--
-- Data for Name: playlist; Type: TABLE DATA; Schema: public; Owner: spotifaie_user
--

COPY public.playlist (id_playlist, titre_playlist, date_playlist, image_playlist, public) FROM stdin;
1	Légendes du Rock	2023-06-06 15:59:56.263029	https://i.scdn.co/image/ab67706f000000034d3bb5c9538a115adadc5d80	t
2	ZZCCMXTP favorite	2023-06-06 16:00:47.949387	https://i.scdn.co/image/ab67706c0000bebba4702c355501c53b15221bea	t
3	Rap FR 🇫🇷	2023-06-06 16:01:20.725683	https://i.scdn.co/image/ab67706c0000bebb51c61a7ed20d2373975179bd	t
4	Best Life	2023-06-06 16:02:08.530405	https://i.scdn.co/image/ab67706f0000000355cb61b39ccdaecb2fd81d57	t
5	Variété française 80 à aujourd'hui	2023-06-06 16:02:33.304825	https://mosaic.scdn.co/640/ab67616d0000b273a33e2b9d221b420f2ab1d29fab67616d0000b273b40c6c296952930237c28129ab67616d0000b273f657d2e6ee8f676801772695ab67616d0000b273f9948ef140c5b2cb78b6c039	t
6	My playlist	2023-06-06 16:56:46	\N	f
\.


--
-- Data for Name: playlist_musique; Type: TABLE DATA; Schema: public; Owner: spotifaie_user
--

COPY public.playlist_musique (id_musique, id_playlist, date_ajout) FROM stdin;
8	1	2023-06-06
21	1	2023-06-06
29	1	2023-06-06
43	1	2023-06-06
47	1	2023-06-06
60	1	2023-06-06
74	1	2023-06-06
1	1	2023-06-06
79	1	2023-06-06
95	1	2023-06-06
102	1	2023-06-06
116	1	2023-06-06
173	1	2023-06-06
178	1	2023-06-06
188	1	2023-06-06
200	1	2023-06-06
248	2	2023-06-06
238	2	2023-06-06
256	2	2023-06-06
250	2	2023-06-06
242	2	2023-06-06
251	2	2023-06-06
243	2	2023-06-06
246	2	2023-06-06
236	2	2023-06-06
241	2	2023-06-06
253	2	2023-06-06
252	2	2023-06-06
244	2	2023-06-06
247	2	2023-06-06
245	2	2023-06-06
240	2	2023-06-06
237	2	2023-06-06
254	2	2023-06-06
239	2	2023-06-06
249	2	2023-06-06
266	3	2023-06-06
274	3	2023-06-06
286	3	2023-06-06
289	3	2023-06-06
302	3	2023-06-06
303	3	2023-06-06
305	3	2023-06-06
322	3	2023-06-06
330	3	2023-06-06
333	3	2023-06-06
350	3	2023-06-06
364	3	2023-06-06
365	3	2023-06-06
373	3	2023-06-06
394	3	2023-06-06
404	3	2023-06-06
428	3	2023-06-06
440	3	2023-06-06
321	3	2023-06-06
441	3	2023-06-06
442	3	2023-06-06
443	3	2023-06-06
444	3	2023-06-06
447	3	2023-06-06
349	3	2023-06-06
260	3	2023-06-06
319	3	2023-06-06
270	3	2023-06-06
404	4	2023-06-06
307	4	2023-06-06
452	4	2023-06-06
466	4	2023-06-06
472	4	2023-06-06
481	4	2023-06-06
492	4	2023-06-06
501	4	2023-06-06
502	4	2023-06-06
435	4	2023-06-06
508	5	2023-06-06
518	5	2023-06-06
524	5	2023-06-06
539	5	2023-06-06
565	5	2023-06-06
575	5	2023-06-06
580	5	2023-06-06
585	5	2023-06-06
625	5	2023-06-06
635	5	2023-06-06
527	5	2023-06-06
582	5	2023-06-06
628	5	2023-06-06
654	5	2023-06-06
668	5	2023-06-06
686	5	2023-06-06
533	5	2023-06-06
236	6	2023-06-06
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: spotifaie_user
--

COPY public."user" (id_user, mail, date_naissance, nom_user, prenom_user, motdepasse, image_user) FROM stdin;
1	killian.guichet@isen-ouest.yncrea.fr	2003-09-09	Guichet	Killian	$2y$10$bBIrNogIVZBzXV0Dj50rne6..DOvh15KoCgFU3EosbrOq/OE1OcGS	photo/profile/GuichetKillian.png                                                                    
\.


--
-- Data for Name: user_playlist; Type: TABLE DATA; Schema: public; Owner: spotifaie_user
--

COPY public.user_playlist (id_playlist, id_user, date_playlist) FROM stdin;
6	1	2023-06-06 16:56:47
\.


--
-- Name: album_id_album_seq; Type: SEQUENCE SET; Schema: public; Owner: spotifaie_user
--

SELECT pg_catalog.setval('public.album_id_album_seq', 65, true);


--
-- Name: artiste_id_artiste_seq; Type: SEQUENCE SET; Schema: public; Owner: spotifaie_user
--

SELECT pg_catalog.setval('public.artiste_id_artiste_seq', 142, true);


--
-- Name: musique_id_musique_seq; Type: SEQUENCE SET; Schema: public; Owner: spotifaie_user
--

SELECT pg_catalog.setval('public.musique_id_musique_seq', 698, true);


--
-- Name: playlist_id_playlist_seq; Type: SEQUENCE SET; Schema: public; Owner: spotifaie_user
--

SELECT pg_catalog.setval('public.playlist_id_playlist_seq', 6, true);


--
-- Name: user_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: spotifaie_user
--

SELECT pg_catalog.setval('public.user_id_user_seq', 1, true);


--
-- Name: album album_pk; Type: CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pk PRIMARY KEY (id_album);


--
-- Name: artiste_musique artiste_musique_pk; Type: CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.artiste_musique
    ADD CONSTRAINT artiste_musique_pk PRIMARY KEY (id_artiste, id_musique);


--
-- Name: artiste artiste_pk; Type: CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.artiste
    ADD CONSTRAINT artiste_pk PRIMARY KEY (id_artiste);


--
-- Name: file_attente file_attente_pk; Type: CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.file_attente
    ADD CONSTRAINT file_attente_pk PRIMARY KEY (id_musique, id_user);


--
-- Name: historique historique_pk; Type: CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.historique
    ADD CONSTRAINT historique_pk PRIMARY KEY (id_musique, id_user);


--
-- Name: like_musique like_musique_pk; Type: CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.like_musique
    ADD CONSTRAINT like_musique_pk PRIMARY KEY (id_musique, id_user);


--
-- Name: musique musique_pk; Type: CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.musique
    ADD CONSTRAINT musique_pk PRIMARY KEY (id_musique);


--
-- Name: playlist_musique playlist_musique_pk; Type: CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.playlist_musique
    ADD CONSTRAINT playlist_musique_pk PRIMARY KEY (id_musique, id_playlist);


--
-- Name: playlist playlist_pk; Type: CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pk PRIMARY KEY (id_playlist);


--
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id_user);


--
-- Name: user_playlist user_playlist_pk; Type: CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.user_playlist
    ADD CONSTRAINT user_playlist_pk PRIMARY KEY (id_playlist, id_user);


--
-- Name: album album_artiste0_fk; Type: FK CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_artiste0_fk FOREIGN KEY (id_artiste) REFERENCES public.artiste(id_artiste);


--
-- Name: musique album_musique_fk; Type: FK CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.musique
    ADD CONSTRAINT album_musique_fk FOREIGN KEY (id_album) REFERENCES public.album(id_album);


--
-- Name: artiste_musique artiste_musique_artiste_fk; Type: FK CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.artiste_musique
    ADD CONSTRAINT artiste_musique_artiste_fk FOREIGN KEY (id_artiste) REFERENCES public.artiste(id_artiste);


--
-- Name: artiste_musique artiste_musique_musique0_fk; Type: FK CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.artiste_musique
    ADD CONSTRAINT artiste_musique_musique0_fk FOREIGN KEY (id_musique) REFERENCES public.musique(id_musique);


--
-- Name: musique artiste_principale_musique_fk; Type: FK CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.musique
    ADD CONSTRAINT artiste_principale_musique_fk FOREIGN KEY (id_artiste_principale) REFERENCES public.artiste(id_artiste);


--
-- Name: file_attente file_attente_musique_fk; Type: FK CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.file_attente
    ADD CONSTRAINT file_attente_musique_fk FOREIGN KEY (id_musique) REFERENCES public.musique(id_musique);


--
-- Name: file_attente file_attente_user0_fk; Type: FK CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.file_attente
    ADD CONSTRAINT file_attente_user0_fk FOREIGN KEY (id_user) REFERENCES public."user"(id_user);


--
-- Name: historique historique_musique_fk; Type: FK CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.historique
    ADD CONSTRAINT historique_musique_fk FOREIGN KEY (id_musique) REFERENCES public.musique(id_musique);


--
-- Name: historique historique_user0_fk; Type: FK CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.historique
    ADD CONSTRAINT historique_user0_fk FOREIGN KEY (id_user) REFERENCES public."user"(id_user);


--
-- Name: like_musique like_musique_musique_fk; Type: FK CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.like_musique
    ADD CONSTRAINT like_musique_musique_fk FOREIGN KEY (id_musique) REFERENCES public.musique(id_musique);


--
-- Name: like_musique like_musique_user0_fk; Type: FK CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.like_musique
    ADD CONSTRAINT like_musique_user0_fk FOREIGN KEY (id_user) REFERENCES public."user"(id_user);


--
-- Name: playlist_musique playlist_musique_musique_fk; Type: FK CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.playlist_musique
    ADD CONSTRAINT playlist_musique_musique_fk FOREIGN KEY (id_musique) REFERENCES public.musique(id_musique);


--
-- Name: playlist_musique playlist_musique_playlist0_fk; Type: FK CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.playlist_musique
    ADD CONSTRAINT playlist_musique_playlist0_fk FOREIGN KEY (id_playlist) REFERENCES public.playlist(id_playlist);


--
-- Name: user_playlist user_playlist_playlist_fk; Type: FK CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.user_playlist
    ADD CONSTRAINT user_playlist_playlist_fk FOREIGN KEY (id_playlist) REFERENCES public.playlist(id_playlist);


--
-- Name: user_playlist user_playlist_user0_fk; Type: FK CONSTRAINT; Schema: public; Owner: spotifaie_user
--

ALTER TABLE ONLY public.user_playlist
    ADD CONSTRAINT user_playlist_user0_fk FOREIGN KEY (id_user) REFERENCES public."user"(id_user);


--
-- spotifaie_userQL database dump complete
--

