--
-- PostgreSQL database dump
--

\restrict E7dDve1CFAIrVI2m1JQTg0OW4OnMzsYVlsSQICkgK7d5xRb8dhyAgjoQ4kuTabO

-- Dumped from database version 18.1 (Debian 18.1-1.pgdg13+2)
-- Dumped by pg_dump version 18.1 (Debian 18.1-1.pgdg13+2)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: nest_user
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    "createdAt" timestamp with time zone,
    "userId" integer,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.groups OWNER TO nest_user;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: nest_user
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groups_id_seq OWNER TO nest_user;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nest_user
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: nest_user
--

CREATE TABLE public.permissions (
    id integer NOT NULL,
    key character varying(255) NOT NULL,
    name character varying(255),
    description character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.permissions OWNER TO nest_user;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: nest_user
--

CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO nest_user;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nest_user
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: nest_user
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    content text,
    "userId" integer,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.posts OWNER TO nest_user;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: nest_user
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO nest_user;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nest_user
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: nest_user
--

CREATE TABLE public.role_permissions (
    "roleId" integer NOT NULL,
    "permissionId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.role_permissions OWNER TO nest_user;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: nest_user
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.roles OWNER TO nest_user;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: nest_user
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO nest_user;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nest_user
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: nest_user
--

CREATE TABLE public.user_roles (
    "userId" integer NOT NULL,
    "roleId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.user_roles OWNER TO nest_user;

--
-- Name: users; Type: TABLE; Schema: public; Owner: nest_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "groupId" integer,
    age integer,
    avatar character varying(255),
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE public.users OWNER TO nest_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: nest_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO nest_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nest_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: nest_user
--

COPY public.groups (id, name, description, "createdAt", "userId", "updatedAt") FROM stdin;
1	it	it部门	2025-11-22 08:44:39.372+00	1	2025-11-22 08:44:39.372+00
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: nest_user
--

COPY public.permissions (id, key, name, description, "createdAt", "updatedAt") FROM stdin;
1	group.read	部门读取	\N	2025-11-22 09:56:53.993628+00	2025-11-22 09:56:53.993628+00
2	group.write	部门写入	\N	2025-11-22 09:56:53.993628+00	2025-11-22 09:56:53.993628+00
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: nest_user
--

COPY public.posts (id, title, content, "userId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: nest_user
--

COPY public.role_permissions ("roleId", "permissionId", "createdAt", "updatedAt") FROM stdin;
1	1	2025-11-22 09:57:11.842+00	2025-11-22 09:57:11.842+00
1	2	2025-11-22 09:57:11.842+00	2025-11-22 09:57:11.842+00
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: nest_user
--

COPY public.roles (id, name, description, "createdAt", "updatedAt") FROM stdin;
1	管理员	老大	2025-11-22 09:00:40.073+00	2025-11-22 09:00:40.073+00
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: nest_user
--

COPY public.user_roles ("userId", "roleId", "createdAt", "updatedAt") FROM stdin;
1	1	2025-11-22 09:40:53.134+00	2025-11-22 09:40:53.134+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: nest_user
--

COPY public.users (id, name, "groupId", age, avatar, password, "createdAt", "updatedAt") FROM stdin;
1	张三	\N	\N	\N	$2b$10$Ok8SpSZ.3M3jvDMA1mSG.uQIIgT4DY7BM5./ZfUBA8H5QFg6ne.WK	2025-11-22 08:43:11.398+00	2025-11-22 08:43:11.398+00
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nest_user
--

SELECT pg_catalog.setval('public.groups_id_seq', 1, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nest_user
--

SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nest_user
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nest_user
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nest_user
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_key_key; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key UNIQUE (key);


--
-- Name: permissions permissions_key_key1; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key1 UNIQUE (key);


--
-- Name: permissions permissions_key_key10; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key10 UNIQUE (key);


--
-- Name: permissions permissions_key_key11; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key11 UNIQUE (key);


--
-- Name: permissions permissions_key_key12; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key12 UNIQUE (key);


--
-- Name: permissions permissions_key_key13; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key13 UNIQUE (key);


--
-- Name: permissions permissions_key_key14; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key14 UNIQUE (key);


--
-- Name: permissions permissions_key_key15; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key15 UNIQUE (key);


--
-- Name: permissions permissions_key_key16; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key16 UNIQUE (key);


--
-- Name: permissions permissions_key_key17; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key17 UNIQUE (key);


--
-- Name: permissions permissions_key_key18; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key18 UNIQUE (key);


--
-- Name: permissions permissions_key_key19; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key19 UNIQUE (key);


--
-- Name: permissions permissions_key_key2; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key2 UNIQUE (key);


--
-- Name: permissions permissions_key_key20; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key20 UNIQUE (key);


--
-- Name: permissions permissions_key_key21; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key21 UNIQUE (key);


--
-- Name: permissions permissions_key_key22; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key22 UNIQUE (key);


--
-- Name: permissions permissions_key_key23; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key23 UNIQUE (key);


--
-- Name: permissions permissions_key_key24; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key24 UNIQUE (key);


--
-- Name: permissions permissions_key_key25; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key25 UNIQUE (key);


--
-- Name: permissions permissions_key_key26; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key26 UNIQUE (key);


--
-- Name: permissions permissions_key_key27; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key27 UNIQUE (key);


--
-- Name: permissions permissions_key_key28; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key28 UNIQUE (key);


--
-- Name: permissions permissions_key_key29; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key29 UNIQUE (key);


--
-- Name: permissions permissions_key_key3; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key3 UNIQUE (key);


--
-- Name: permissions permissions_key_key30; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key30 UNIQUE (key);


--
-- Name: permissions permissions_key_key31; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key31 UNIQUE (key);


--
-- Name: permissions permissions_key_key32; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key32 UNIQUE (key);


--
-- Name: permissions permissions_key_key33; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key33 UNIQUE (key);


--
-- Name: permissions permissions_key_key34; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key34 UNIQUE (key);


--
-- Name: permissions permissions_key_key35; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key35 UNIQUE (key);


--
-- Name: permissions permissions_key_key36; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key36 UNIQUE (key);


--
-- Name: permissions permissions_key_key37; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key37 UNIQUE (key);


--
-- Name: permissions permissions_key_key38; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key38 UNIQUE (key);


--
-- Name: permissions permissions_key_key39; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key39 UNIQUE (key);


--
-- Name: permissions permissions_key_key4; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key4 UNIQUE (key);


--
-- Name: permissions permissions_key_key40; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key40 UNIQUE (key);


--
-- Name: permissions permissions_key_key41; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key41 UNIQUE (key);


--
-- Name: permissions permissions_key_key42; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key42 UNIQUE (key);


--
-- Name: permissions permissions_key_key43; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key43 UNIQUE (key);


--
-- Name: permissions permissions_key_key44; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key44 UNIQUE (key);


--
-- Name: permissions permissions_key_key45; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key45 UNIQUE (key);


--
-- Name: permissions permissions_key_key46; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key46 UNIQUE (key);


--
-- Name: permissions permissions_key_key47; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key47 UNIQUE (key);


--
-- Name: permissions permissions_key_key48; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key48 UNIQUE (key);


--
-- Name: permissions permissions_key_key49; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key49 UNIQUE (key);


--
-- Name: permissions permissions_key_key5; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key5 UNIQUE (key);


--
-- Name: permissions permissions_key_key50; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key50 UNIQUE (key);


--
-- Name: permissions permissions_key_key51; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key51 UNIQUE (key);


--
-- Name: permissions permissions_key_key52; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key52 UNIQUE (key);


--
-- Name: permissions permissions_key_key53; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key53 UNIQUE (key);


--
-- Name: permissions permissions_key_key54; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key54 UNIQUE (key);


--
-- Name: permissions permissions_key_key55; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key55 UNIQUE (key);


--
-- Name: permissions permissions_key_key56; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key56 UNIQUE (key);


--
-- Name: permissions permissions_key_key57; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key57 UNIQUE (key);


--
-- Name: permissions permissions_key_key58; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key58 UNIQUE (key);


--
-- Name: permissions permissions_key_key59; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key59 UNIQUE (key);


--
-- Name: permissions permissions_key_key6; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key6 UNIQUE (key);


--
-- Name: permissions permissions_key_key60; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key60 UNIQUE (key);


--
-- Name: permissions permissions_key_key61; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key61 UNIQUE (key);


--
-- Name: permissions permissions_key_key62; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key62 UNIQUE (key);


--
-- Name: permissions permissions_key_key63; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key63 UNIQUE (key);


--
-- Name: permissions permissions_key_key64; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key64 UNIQUE (key);


--
-- Name: permissions permissions_key_key65; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key65 UNIQUE (key);


--
-- Name: permissions permissions_key_key66; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key66 UNIQUE (key);


--
-- Name: permissions permissions_key_key67; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key67 UNIQUE (key);


--
-- Name: permissions permissions_key_key68; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key68 UNIQUE (key);


--
-- Name: permissions permissions_key_key69; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key69 UNIQUE (key);


--
-- Name: permissions permissions_key_key7; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key7 UNIQUE (key);


--
-- Name: permissions permissions_key_key70; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key70 UNIQUE (key);


--
-- Name: permissions permissions_key_key71; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key71 UNIQUE (key);


--
-- Name: permissions permissions_key_key72; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key72 UNIQUE (key);


--
-- Name: permissions permissions_key_key73; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key73 UNIQUE (key);


--
-- Name: permissions permissions_key_key74; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key74 UNIQUE (key);


--
-- Name: permissions permissions_key_key75; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key75 UNIQUE (key);


--
-- Name: permissions permissions_key_key76; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key76 UNIQUE (key);


--
-- Name: permissions permissions_key_key77; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key77 UNIQUE (key);


--
-- Name: permissions permissions_key_key78; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key78 UNIQUE (key);


--
-- Name: permissions permissions_key_key79; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key79 UNIQUE (key);


--
-- Name: permissions permissions_key_key8; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key8 UNIQUE (key);


--
-- Name: permissions permissions_key_key80; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key80 UNIQUE (key);


--
-- Name: permissions permissions_key_key81; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key81 UNIQUE (key);


--
-- Name: permissions permissions_key_key82; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key82 UNIQUE (key);


--
-- Name: permissions permissions_key_key83; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key83 UNIQUE (key);


--
-- Name: permissions permissions_key_key84; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key84 UNIQUE (key);


--
-- Name: permissions permissions_key_key85; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key85 UNIQUE (key);


--
-- Name: permissions permissions_key_key86; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key86 UNIQUE (key);


--
-- Name: permissions permissions_key_key9; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_key_key9 UNIQUE (key);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY ("roleId", "permissionId");


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_name_key1; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key1 UNIQUE (name);


--
-- Name: roles roles_name_key10; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key10 UNIQUE (name);


--
-- Name: roles roles_name_key11; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key11 UNIQUE (name);


--
-- Name: roles roles_name_key12; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key12 UNIQUE (name);


--
-- Name: roles roles_name_key13; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key13 UNIQUE (name);


--
-- Name: roles roles_name_key14; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key14 UNIQUE (name);


--
-- Name: roles roles_name_key15; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key15 UNIQUE (name);


--
-- Name: roles roles_name_key16; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key16 UNIQUE (name);


--
-- Name: roles roles_name_key17; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key17 UNIQUE (name);


--
-- Name: roles roles_name_key18; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key18 UNIQUE (name);


--
-- Name: roles roles_name_key19; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key19 UNIQUE (name);


--
-- Name: roles roles_name_key2; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key2 UNIQUE (name);


--
-- Name: roles roles_name_key20; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key20 UNIQUE (name);


--
-- Name: roles roles_name_key21; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key21 UNIQUE (name);


--
-- Name: roles roles_name_key22; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key22 UNIQUE (name);


--
-- Name: roles roles_name_key23; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key23 UNIQUE (name);


--
-- Name: roles roles_name_key24; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key24 UNIQUE (name);


--
-- Name: roles roles_name_key25; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key25 UNIQUE (name);


--
-- Name: roles roles_name_key26; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key26 UNIQUE (name);


--
-- Name: roles roles_name_key27; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key27 UNIQUE (name);


--
-- Name: roles roles_name_key28; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key28 UNIQUE (name);


--
-- Name: roles roles_name_key29; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key29 UNIQUE (name);


--
-- Name: roles roles_name_key3; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key3 UNIQUE (name);


--
-- Name: roles roles_name_key30; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key30 UNIQUE (name);


--
-- Name: roles roles_name_key31; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key31 UNIQUE (name);


--
-- Name: roles roles_name_key32; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key32 UNIQUE (name);


--
-- Name: roles roles_name_key33; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key33 UNIQUE (name);


--
-- Name: roles roles_name_key34; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key34 UNIQUE (name);


--
-- Name: roles roles_name_key35; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key35 UNIQUE (name);


--
-- Name: roles roles_name_key36; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key36 UNIQUE (name);


--
-- Name: roles roles_name_key37; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key37 UNIQUE (name);


--
-- Name: roles roles_name_key38; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key38 UNIQUE (name);


--
-- Name: roles roles_name_key39; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key39 UNIQUE (name);


--
-- Name: roles roles_name_key4; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key4 UNIQUE (name);


--
-- Name: roles roles_name_key40; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key40 UNIQUE (name);


--
-- Name: roles roles_name_key41; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key41 UNIQUE (name);


--
-- Name: roles roles_name_key42; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key42 UNIQUE (name);


--
-- Name: roles roles_name_key43; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key43 UNIQUE (name);


--
-- Name: roles roles_name_key44; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key44 UNIQUE (name);


--
-- Name: roles roles_name_key45; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key45 UNIQUE (name);


--
-- Name: roles roles_name_key46; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key46 UNIQUE (name);


--
-- Name: roles roles_name_key47; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key47 UNIQUE (name);


--
-- Name: roles roles_name_key48; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key48 UNIQUE (name);


--
-- Name: roles roles_name_key49; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key49 UNIQUE (name);


--
-- Name: roles roles_name_key5; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key5 UNIQUE (name);


--
-- Name: roles roles_name_key50; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key50 UNIQUE (name);


--
-- Name: roles roles_name_key51; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key51 UNIQUE (name);


--
-- Name: roles roles_name_key52; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key52 UNIQUE (name);


--
-- Name: roles roles_name_key53; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key53 UNIQUE (name);


--
-- Name: roles roles_name_key54; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key54 UNIQUE (name);


--
-- Name: roles roles_name_key55; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key55 UNIQUE (name);


--
-- Name: roles roles_name_key56; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key56 UNIQUE (name);


--
-- Name: roles roles_name_key57; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key57 UNIQUE (name);


--
-- Name: roles roles_name_key58; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key58 UNIQUE (name);


--
-- Name: roles roles_name_key59; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key59 UNIQUE (name);


--
-- Name: roles roles_name_key6; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key6 UNIQUE (name);


--
-- Name: roles roles_name_key60; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key60 UNIQUE (name);


--
-- Name: roles roles_name_key61; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key61 UNIQUE (name);


--
-- Name: roles roles_name_key62; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key62 UNIQUE (name);


--
-- Name: roles roles_name_key63; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key63 UNIQUE (name);


--
-- Name: roles roles_name_key64; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key64 UNIQUE (name);


--
-- Name: roles roles_name_key65; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key65 UNIQUE (name);


--
-- Name: roles roles_name_key66; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key66 UNIQUE (name);


--
-- Name: roles roles_name_key67; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key67 UNIQUE (name);


--
-- Name: roles roles_name_key68; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key68 UNIQUE (name);


--
-- Name: roles roles_name_key69; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key69 UNIQUE (name);


--
-- Name: roles roles_name_key7; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key7 UNIQUE (name);


--
-- Name: roles roles_name_key70; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key70 UNIQUE (name);


--
-- Name: roles roles_name_key71; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key71 UNIQUE (name);


--
-- Name: roles roles_name_key72; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key72 UNIQUE (name);


--
-- Name: roles roles_name_key73; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key73 UNIQUE (name);


--
-- Name: roles roles_name_key74; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key74 UNIQUE (name);


--
-- Name: roles roles_name_key75; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key75 UNIQUE (name);


--
-- Name: roles roles_name_key76; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key76 UNIQUE (name);


--
-- Name: roles roles_name_key77; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key77 UNIQUE (name);


--
-- Name: roles roles_name_key78; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key78 UNIQUE (name);


--
-- Name: roles roles_name_key79; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key79 UNIQUE (name);


--
-- Name: roles roles_name_key8; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key8 UNIQUE (name);


--
-- Name: roles roles_name_key80; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key80 UNIQUE (name);


--
-- Name: roles roles_name_key81; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key81 UNIQUE (name);


--
-- Name: roles roles_name_key82; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key82 UNIQUE (name);


--
-- Name: roles roles_name_key83; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key83 UNIQUE (name);


--
-- Name: roles roles_name_key84; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key84 UNIQUE (name);


--
-- Name: roles roles_name_key85; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key85 UNIQUE (name);


--
-- Name: roles roles_name_key86; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key86 UNIQUE (name);


--
-- Name: roles roles_name_key9; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key9 UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY ("userId", "roleId");


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_name_key1; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key1 UNIQUE (name);


--
-- Name: users users_name_key10; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key10 UNIQUE (name);


--
-- Name: users users_name_key11; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key11 UNIQUE (name);


--
-- Name: users users_name_key12; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key12 UNIQUE (name);


--
-- Name: users users_name_key13; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key13 UNIQUE (name);


--
-- Name: users users_name_key14; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key14 UNIQUE (name);


--
-- Name: users users_name_key15; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key15 UNIQUE (name);


--
-- Name: users users_name_key16; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key16 UNIQUE (name);


--
-- Name: users users_name_key17; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key17 UNIQUE (name);


--
-- Name: users users_name_key18; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key18 UNIQUE (name);


--
-- Name: users users_name_key19; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key19 UNIQUE (name);


--
-- Name: users users_name_key2; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key2 UNIQUE (name);


--
-- Name: users users_name_key20; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key20 UNIQUE (name);


--
-- Name: users users_name_key21; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key21 UNIQUE (name);


--
-- Name: users users_name_key22; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key22 UNIQUE (name);


--
-- Name: users users_name_key23; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key23 UNIQUE (name);


--
-- Name: users users_name_key24; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key24 UNIQUE (name);


--
-- Name: users users_name_key25; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key25 UNIQUE (name);


--
-- Name: users users_name_key26; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key26 UNIQUE (name);


--
-- Name: users users_name_key27; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key27 UNIQUE (name);


--
-- Name: users users_name_key28; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key28 UNIQUE (name);


--
-- Name: users users_name_key29; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key29 UNIQUE (name);


--
-- Name: users users_name_key3; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key3 UNIQUE (name);


--
-- Name: users users_name_key30; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key30 UNIQUE (name);


--
-- Name: users users_name_key31; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key31 UNIQUE (name);


--
-- Name: users users_name_key32; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key32 UNIQUE (name);


--
-- Name: users users_name_key33; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key33 UNIQUE (name);


--
-- Name: users users_name_key34; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key34 UNIQUE (name);


--
-- Name: users users_name_key35; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key35 UNIQUE (name);


--
-- Name: users users_name_key36; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key36 UNIQUE (name);


--
-- Name: users users_name_key37; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key37 UNIQUE (name);


--
-- Name: users users_name_key38; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key38 UNIQUE (name);


--
-- Name: users users_name_key39; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key39 UNIQUE (name);


--
-- Name: users users_name_key4; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key4 UNIQUE (name);


--
-- Name: users users_name_key40; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key40 UNIQUE (name);


--
-- Name: users users_name_key41; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key41 UNIQUE (name);


--
-- Name: users users_name_key42; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key42 UNIQUE (name);


--
-- Name: users users_name_key43; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key43 UNIQUE (name);


--
-- Name: users users_name_key44; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key44 UNIQUE (name);


--
-- Name: users users_name_key45; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key45 UNIQUE (name);


--
-- Name: users users_name_key46; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key46 UNIQUE (name);


--
-- Name: users users_name_key47; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key47 UNIQUE (name);


--
-- Name: users users_name_key48; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key48 UNIQUE (name);


--
-- Name: users users_name_key49; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key49 UNIQUE (name);


--
-- Name: users users_name_key5; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key5 UNIQUE (name);


--
-- Name: users users_name_key50; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key50 UNIQUE (name);


--
-- Name: users users_name_key51; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key51 UNIQUE (name);


--
-- Name: users users_name_key52; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key52 UNIQUE (name);


--
-- Name: users users_name_key53; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key53 UNIQUE (name);


--
-- Name: users users_name_key54; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key54 UNIQUE (name);


--
-- Name: users users_name_key55; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key55 UNIQUE (name);


--
-- Name: users users_name_key56; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key56 UNIQUE (name);


--
-- Name: users users_name_key57; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key57 UNIQUE (name);


--
-- Name: users users_name_key58; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key58 UNIQUE (name);


--
-- Name: users users_name_key59; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key59 UNIQUE (name);


--
-- Name: users users_name_key6; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key6 UNIQUE (name);


--
-- Name: users users_name_key60; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key60 UNIQUE (name);


--
-- Name: users users_name_key61; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key61 UNIQUE (name);


--
-- Name: users users_name_key62; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key62 UNIQUE (name);


--
-- Name: users users_name_key63; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key63 UNIQUE (name);


--
-- Name: users users_name_key64; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key64 UNIQUE (name);


--
-- Name: users users_name_key65; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key65 UNIQUE (name);


--
-- Name: users users_name_key66; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key66 UNIQUE (name);


--
-- Name: users users_name_key67; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key67 UNIQUE (name);


--
-- Name: users users_name_key68; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key68 UNIQUE (name);


--
-- Name: users users_name_key69; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key69 UNIQUE (name);


--
-- Name: users users_name_key7; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key7 UNIQUE (name);


--
-- Name: users users_name_key70; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key70 UNIQUE (name);


--
-- Name: users users_name_key71; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key71 UNIQUE (name);


--
-- Name: users users_name_key72; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key72 UNIQUE (name);


--
-- Name: users users_name_key73; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key73 UNIQUE (name);


--
-- Name: users users_name_key74; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key74 UNIQUE (name);


--
-- Name: users users_name_key75; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key75 UNIQUE (name);


--
-- Name: users users_name_key76; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key76 UNIQUE (name);


--
-- Name: users users_name_key77; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key77 UNIQUE (name);


--
-- Name: users users_name_key78; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key78 UNIQUE (name);


--
-- Name: users users_name_key79; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key79 UNIQUE (name);


--
-- Name: users users_name_key8; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key8 UNIQUE (name);


--
-- Name: users users_name_key80; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key80 UNIQUE (name);


--
-- Name: users users_name_key81; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key81 UNIQUE (name);


--
-- Name: users users_name_key82; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key82 UNIQUE (name);


--
-- Name: users users_name_key83; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key83 UNIQUE (name);


--
-- Name: users users_name_key84; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key84 UNIQUE (name);


--
-- Name: users users_name_key85; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key85 UNIQUE (name);


--
-- Name: users users_name_key86; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key86 UNIQUE (name);


--
-- Name: users users_name_key87; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key87 UNIQUE (name);


--
-- Name: users users_name_key88; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key88 UNIQUE (name);


--
-- Name: users users_name_key89; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key89 UNIQUE (name);


--
-- Name: users users_name_key9; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key9 UNIQUE (name);


--
-- Name: users users_name_key90; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key90 UNIQUE (name);


--
-- Name: users users_name_key91; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key91 UNIQUE (name);


--
-- Name: users users_name_key92; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key92 UNIQUE (name);


--
-- Name: users users_name_key93; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key93 UNIQUE (name);


--
-- Name: users users_name_key94; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key94 UNIQUE (name);


--
-- Name: users users_name_key95; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key95 UNIQUE (name);


--
-- Name: users users_name_key96; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key96 UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: groups groups_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT "groups_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: posts posts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users users_groupId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nest_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES public.groups(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict E7dDve1CFAIrVI2m1JQTg0OW4OnMzsYVlsSQICkgK7d5xRb8dhyAgjoQ4kuTabO

