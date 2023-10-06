--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE mydb;




--
-- Drop roles
--

DROP ROLE gufrip;


--
-- Roles
--

CREATE ROLE gufrip;
ALTER ROLE gufrip WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:hqvbCy2yIrON3vkPw/hCoQ==$g4bnBs+kJUaXeny6GN6mlKwaJII6K1c6H/d/zgY8y5s=:eYEXsYdxImO8ex33Bmaxa8fNeAvkvU8JewaigXhnpMY=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-1.pgdg120+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: gufrip
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO gufrip;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: gufrip
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: gufrip
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: gufrip
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "mydb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-1.pgdg120+1)

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
-- Name: mydb; Type: DATABASE; Schema: -; Owner: gufrip
--

CREATE DATABASE mydb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE mydb OWNER TO gufrip;

\connect mydb

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
-- Name: Account; Type: TABLE; Schema: public; Owner: gufrip
--

CREATE TABLE public."Account" (
    id text NOT NULL,
    "userId" text NOT NULL,
    type text NOT NULL,
    provider text NOT NULL,
    "providerAccountId" text NOT NULL,
    refresh_token text,
    access_token text,
    expires_at integer,
    token_type text,
    scope text,
    id_token text,
    session_state text
);


ALTER TABLE public."Account" OWNER TO gufrip;

--
-- Name: Category; Type: TABLE; Schema: public; Owner: gufrip
--

CREATE TABLE public."Category" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    title text NOT NULL,
    "desc" text NOT NULL,
    color text NOT NULL,
    img text NOT NULL,
    slug text NOT NULL
);


ALTER TABLE public."Category" OWNER TO gufrip;

--
-- Name: Order; Type: TABLE; Schema: public; Owner: gufrip //// ---------------------
--

CREATE TABLE public."Order" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    price numeric(65,30) NOT NULL,
    products jsonb[],
    status text NOT NULL,
    intent_id text,
    "userEmail" text NOT NULL
);


ALTER TABLE public."Order" OWNER TO gufrip;

--
-- Name: Product; Type: TABLE; Schema: public; Owner: gufrip
--

CREATE TABLE public."Product" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    title text NOT NULL,
    "desc" text NOT NULL,
    img text,
    price numeric(65,30) NOT NULL,
    "isFeatured" boolean DEFAULT false NOT NULL,
    options jsonb[],
    "catSlug" text NOT NULL
);


ALTER TABLE public."Product" OWNER TO gufrip;

--
-- Name: Session; Type: TABLE; Schema: public; Owner: gufrip
--

CREATE TABLE public."Session" (
    id text NOT NULL,
    "sessionToken" text NOT NULL,
    "userId" text NOT NULL,
    expires timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Session" OWNER TO gufrip;

--
-- Name: User; Type: TABLE; Schema: public; Owner: gufrip
--

CREATE TABLE public."User" (
    id text NOT NULL,
    name text,
    email text,
    "emailVerified" timestamp(3) without time zone,
    image text,
    "isAdmin" boolean DEFAULT false NOT NULL
);


ALTER TABLE public."User" OWNER TO gufrip;

--
-- Name: VerificationToken; Type: TABLE; Schema: public; Owner: gufrip
--

CREATE TABLE public."VerificationToken" (
    identifier text NOT NULL,
    token text NOT NULL,
    expires timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."VerificationToken" OWNER TO gufrip;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: gufrip
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO gufrip;

--
-- Data for Name: Account; Type: TABLE DATA; Schema: public; Owner: gufrip
--

COPY public."Account" (id, "userId", type, provider, "providerAccountId", refresh_token, access_token, expires_at, token_type, scope, id_token, session_state) FROM stdin;
clmot3g120002hj9dcswa30zb	clmot3g0c0000hj9dny11m4co	oauth	google	103988895846123390272	\N	ya29.a0AfB_byA4eH3kyKHouRh3lhBMmDqCVSg8UnJWyjmYHjYeeOOLc90pByjL70vo8nlUkMp8g_dNEyehLZxeJ005yGwK1SUreCO9EbpeGkpdlXTcKZloTg73bDqBA4RMJYyPJufr1MOUpHECP-Vgbdf_dX92L1m_6VmTulHlaCgYKAXMSARMSFQGOcNnCr8Fpf7OuCZEaGNMN97Imzg0171	1695040313	Bearer	openid https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile	eyJhbGciOiJSUzI1NiIsImtpZCI6IjZmNzI1NDEwMWY1NmU0MWNmMzVjOTkyNmRlODRhMmQ1NTJiNGM2ZjEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI1NTk0MjQ3ODc5NjktN3MxY2N1bWJkMmt1b3MyNWJramxtbnN2cGs3MHV0YTAuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI1NTk0MjQ3ODc5NjktN3MxY2N1bWJkMmt1b3MyNWJramxtbnN2cGs3MHV0YTAuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDM5ODg4OTU4NDYxMjMzOTAyNzIiLCJlbWFpbCI6InJ5YmtvbGhvekBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6IkdCU3BaRWlrQ0liZFppeE5EcDBfQXciLCJuYW1lIjoi0Jwu0J4u0J4uIiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hL0FDZzhvY0xYODRoMm9qM0NYaWU0MnNhV2dXQVNhRTR4bmJGTjR6TWpsNkhnNzcyTklnPXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6ItCcLtCeLtCeLiIsImxvY2FsZSI6InVrIiwiaWF0IjoxNjk1MDM2NzE0LCJleHAiOjE2OTUwNDAzMTR9.bSjPXRY_kSmBT8eVFf8OE7yv1kFFVMHSP5Nmn_w7MjFcvagiQnclzUa37YeJmShULBLx5xHawNnGhTFU_cF95Jh41Ek5J0SNVXbVmU-8gOZZNh0huAa5abl-0AgAUSsAIclb5QltC602tnfHvvIHx1dRau_tUp9yzqLM0BzzNqsKaHVJx3ffdp6QftKxpxJNWhl9zBQCy-fPYULorw6oVfGQFriyU9XvMa_KBc4KSNwu5ZYvvXf5I7s7z6vtHgzE8biuUJYo7PEDpiCDKRs09lwyi8pp4cNiz6GSHRHLqZ5lMiTXhZnEm78yV-BN2SM2SWdOs3Bcr1Fqx6ThkFyUUw	\N
\.


--
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: gufrip
--

COPY public."Category" (id, "createdAt", title, "desc", color, img, slug) FROM stdin;
clmhhdl0y0003hjgcr2mzzeav	2023-09-13 08:29:29.651	Cheesy Pizzas	Pizza Paradise: Irresistible slices, mouthwatering toppings, and cheesy perfection.	white	/temporary/m3.png	pizzas
clmhhbajk0001hjgcgtc7t79s	2023-09-13 08:27:42.753	Juicy Burgers 444	Burger Bliss: Juicy patties, bold flavors, and gourmet toppings galore lorem ipsum dolorem guflorem ipsum dolorem lorem ipsum doloremlorem ipsum dolorem guflorem ipsum dolorem guf guflorem ipsum dolorem gufguflorem ipsum dolorem guflorem ipsum dolorem guf.	black	/temporary/m2.png	burgers
clmhh8fgw0000hjgc50fnroic	2023-09-13 08:25:29.169	Italian Pastas2233	Guf Rip Pasta eat and shit himself quick11111222	white	/temporary/m1.png	pastas
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: gufrip
--

COPY public."Order" (id, "createdAt", price, products, status, intent_id, "userEmail") FROM stdin;
clmq5h75a0002hjcbvjwomc4e	2023-09-19 10:06:18.479	7.000000000000000000000000000000	{"{\\"title\\": \\"sranaCole\\"}"}	sraka	\N	guf@rip.ua
clmq5d0tp0000hjcbv5xi6act	2023-09-19 10:03:03.61	19.000000000000000000000000000000	{"{\\"title\\": \\"pizzaDno\\"}"}	delivered	\N	rybkolhoz@gmail.com
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: gufrip
--

COPY public."Product" (id, "createdAt", title, "desc", img, price, "isFeatured", options, "catSlug") FROM stdin;
clmj29lho0001hjqjo8nzazgx	2023-09-14 11:02:01.74	Sicilian	Description of this dung22222 grgdffewpeoor	/temporary/p1.png	34.000000000000000000000000000000	t	{"{\\"title\\": \\"small\\", \\"additionalPrice\\": 0}","{\\"title\\": \\"medium\\", \\"additionalPrice\\": 2}","{\\"title\\": \\"large\\", \\"additionalPrice\\": 3}"}	pizzas
clmyqgk5m0000hj0zsrvsqskc	2023-09-25 10:15:50.027	Burger 2	desc burger 22222 2 2 2	/temporary/p2.png	18.000000000000000000000000000000	f	{}	burgers
clmyqjltw0002hj0zi9l42v7g	2023-09-25 10:18:12.165	Makaronezi	desc makarony sdfsdfsd	/temporary/p7.png	17.500000000000000000000000000000	f	{}	pastas
clmsus3si0000hjs0mdoczmf8	2023-09-21 07:30:10.086	Burger3	desc b3	/temporary/p5.png	12.600000000000000000000000000000	t	{"{\\"title\\": \\"small\\", \\"additionalPrice\\": 0}","{\\"title\\": \\"dno\\", \\"additionalPrice\\": 1}"}	burgers
clmyqhxcw0001hj0zd5rvk30n	2023-09-25 10:16:53.792	TomatoPizza	desctomatooo piiiszs	/temporary/p3.png	36.800000000000000000000000000000	f	{}	pizzas
clmsutasn0001hjs07ox7da8g	2023-09-21 07:31:05.832	pasta goya	desfrfrfrfr	/temporary/p4.png	32.250000000000000000000000000000	t	{"{\\"title\\": \\"small\\", \\"additionalPrice\\": 0}","{\\"title\\": \\"dno\\", \\"additionalPrice\\": 2}"}	pastas
\.


--
-- Data for Name: Session; Type: TABLE DATA; Schema: public; Owner: gufrip
--

COPY public."Session" (id, "sessionToken", "userId", expires) FROM stdin;
clmq4eny60001hjztvf6s0uuf	e701eeed-e7f6-4d59-8726-be011ea4446f	clmot3g0c0000hj9dny11m4co	2023-10-19 09:36:20.605
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: gufrip
--

COPY public."User" (id, name, email, "emailVerified", image, "isAdmin") FROM stdin;
clmq5ek620001hjcb7ie2qsup	guf user	guf@rip.ua	\N	\N	f
clmot3g0c0000hj9dny11m4co	М.О.О.	rybkolhoz@gmail.com	\N	https://lh3.googleusercontent.com/a/ACg8ocLX84h2oj3CXie42saWgWASaE4xnbFN4zMjl6Hg772NIg=s96-c	t
\.


--
-- Data for Name: VerificationToken; Type: TABLE DATA; Schema: public; Owner: gufrip
--

COPY public."VerificationToken" (identifier, token, expires) FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: gufrip
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
d45f94b8-e35e-4916-b505-4e2885ebe551	789124b047ea87082c9dc678343c9b3682fcb48b700f3398d6d8f265a03cb293	2023-09-13 08:18:20.487563+00	20230913081819_first	\N	\N	2023-09-13 08:18:19.973892+00	1
c6eb4b68-4ebb-48a1-a327-7513f5a2e7b0	be700681cdfb85e9cf3305d814fe52a16974f96944d3cb38234d83603eaf297c	2023-09-18 10:44:31.648847+00	20230918104430_add_user	\N	\N	2023-09-18 10:44:30.621133+00	1
\.


--
-- Name: Account Account_pkey; Type: CONSTRAINT; Schema: public; Owner: gufrip
--

ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_pkey" PRIMARY KEY (id);


--
-- Name: Category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: gufrip
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);


--
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: gufrip
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: gufrip
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: Session Session_pkey; Type: CONSTRAINT; Schema: public; Owner: gufrip
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: gufrip
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: gufrip
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Account_provider_providerAccountId_key; Type: INDEX; Schema: public; Owner: gufrip
--

CREATE UNIQUE INDEX "Account_provider_providerAccountId_key" ON public."Account" USING btree (provider, "providerAccountId");


--
-- Name: Category_slug_key; Type: INDEX; Schema: public; Owner: gufrip
--

CREATE UNIQUE INDEX "Category_slug_key" ON public."Category" USING btree (slug);


--
-- Name: Order_intent_id_key; Type: INDEX; Schema: public; Owner: gufrip
--

CREATE UNIQUE INDEX "Order_intent_id_key" ON public."Order" USING btree (intent_id);


--
-- Name: Session_sessionToken_key; Type: INDEX; Schema: public; Owner: gufrip
--

CREATE UNIQUE INDEX "Session_sessionToken_key" ON public."Session" USING btree ("sessionToken");


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: gufrip
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: VerificationToken_identifier_token_key; Type: INDEX; Schema: public; Owner: gufrip
--

CREATE UNIQUE INDEX "VerificationToken_identifier_token_key" ON public."VerificationToken" USING btree (identifier, token);


--
-- Name: VerificationToken_token_key; Type: INDEX; Schema: public; Owner: gufrip
--

CREATE UNIQUE INDEX "VerificationToken_token_key" ON public."VerificationToken" USING btree (token);


--
-- Name: Account Account_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gufrip
--

ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Order Order_userEmail_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gufrip
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_userEmail_fkey" FOREIGN KEY ("userEmail") REFERENCES public."User"(email) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Product Product_catSlug_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gufrip
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_catSlug_fkey" FOREIGN KEY ("catSlug") REFERENCES public."Category"(slug) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Session Session_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gufrip
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-1.pgdg120+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: gufrip
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO gufrip;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: gufrip
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

