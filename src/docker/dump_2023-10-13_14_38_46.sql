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

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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
-- Name: Order; Type: TABLE; Schema: public; Owner: gufrip
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
    "isAdmin" boolean DEFAULT false NOT NULL,
    password text
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
cln3h2vlk0002xc7fhpjehzys	cln3h2vle0000xc7fcfzwltpt	oauth	google	109585711774992628017	\N	ya29.a0AfB_byApOf1OMiMR5qbJr4eEPYTfuTA0nYi6SqBgFfBTM4vTgDGERhsA8MwoU5g3MDwRcwuSg60Ia_3yKQECsLccfs3GS7uspcO_xuGlpeij6_uVAPvoTKt9zXebEPBgBk3IqmiwWuQwF4S0StU9uif3p2vVLVhnrTnqaCgYKARcSARISFQGOcNnC2L6gdiqi8VL9RB4zAq9S7A0171	1695927124	Bearer	https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile openid	eyJhbGciOiJSUzI1NiIsImtpZCI6ImI5YWM2MDFkMTMxZmQ0ZmZkNTU2ZmYwMzJhYWIxODg4ODBjZGUzYjkiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI1NTk0MjQ3ODc5NjktN3MxY2N1bWJkMmt1b3MyNWJramxtbnN2cGs3MHV0YTAuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI1NTk0MjQ3ODc5NjktN3MxY2N1bWJkMmt1b3MyNWJramxtbnN2cGs3MHV0YTAuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDk1ODU3MTE3NzQ5OTI2MjgwMTciLCJlbWFpbCI6Im1vbGNoYW5vdjE5ODlvbGV4YW5kckBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6IklaTTlxc2pQQVloMmR3M3FUeHkwQmciLCJuYW1lIjoi0J7Qu9C10LrRgdCw0L3QtNGAINCc0L7Qu9GH0LDQvdC-0LIiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUNnOG9jS2xhcTFpSThrbnJzN01UdV9wVElSMHZBRnlXYWVlRUdJU3o0YTZvNHA2PXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6ItCe0LvQtdC60YHQsNC90LTRgCIsImZhbWlseV9uYW1lIjoi0JzQvtC70YfQsNC90L7QsiIsImxvY2FsZSI6InJ1IiwiaWF0IjoxNjk1OTIzNTI1LCJleHAiOjE2OTU5MjcxMjV9.nqJKeyzPh8A9xyme9fyrnqJzGOVWjv1lM4UDlKm93UgMYAVhd0I_7qoqZo6JS8GVlJ9noldwUz2rwH6pev_SdkWv-cNtXJ4t4P0cwZsQEGrIyzxmt95OTnT3pbGoPFL2cRN35x3_-6jWOmHshub9-4o6JzjkBQ9TIsa5tby-JKyX9JHL7SQCk48eRGm5XYlImU32ni38a7UoX6sJw-mqWkFuEoiwB8nUO4wxODs7D0q1wJl5xeAv2O51wtnAfmF7stbMIqzYfdoIKlz9EdZeIYYrCBeJarCpeG06ry45sRgqj2P6MHPO9bKKtRbxM3gFu0_F3IggQzTcFyI7Gexlfg	\N
clnh8pj9a0002xc5h410rbcf6	clnh8pj960000xc5hjwvp1mjv	oauth	google	103988895846123390272	\N	ya29.a0AfB_byC69MA5sal13IY_dGO5oidxsSxY4St1lHTEbk7gxbPoj2Ivxs-nHBDsZB_j5hMhgviZ6pjhYBEY8VV7UjEtWYlKJcx2o-6hAllOS6YGP7BA6RMZ17_y2KyNO9f9xVPbOPKO9hX5fCLdT7SBh2XiaWpiWiZAdA0aCgYKAdISARMSFQGOcNnCRcEBQTmrGDNph3QssUvbyA0170	1696759591	Bearer	openid https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email	eyJhbGciOiJSUzI1NiIsImtpZCI6ImM2MjYzZDA5NzQ1YjUwMzJlNTdmYTZlMWQwNDFiNzdhNTQwNjZkYmQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI1NTk0MjQ3ODc5NjktN3MxY2N1bWJkMmt1b3MyNWJramxtbnN2cGs3MHV0YTAuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI1NTk0MjQ3ODc5NjktN3MxY2N1bWJkMmt1b3MyNWJramxtbnN2cGs3MHV0YTAuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMDM5ODg4OTU4NDYxMjMzOTAyNzIiLCJlbWFpbCI6InJ5YmtvbGhvekBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6InVIelJzc0szaGt4eXB1LWxobGUxNWciLCJuYW1lIjoi0Jwu0J4u0J4uIiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hL0FDZzhvY0xYODRoMm9qM0NYaWU0MnNhV2dXQVNhRTR4bmJGTjR6TWpsNkhnNzcyTklnPXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6ItCcLtCeLtCeLiIsImxvY2FsZSI6InVrIiwiaWF0IjoxNjk2NzU1OTkyLCJleHAiOjE2OTY3NTk1OTJ9.vtnEgOEMXn7qhgH1gvHnTpKDLhffX9mYC_cMl5miyO7b1bZLWgVjKgKRnAKpnpvFF9TDIendC8PYKZkBJAGOOGAhpkZeeMHaQuQOHjKzCv8rukygq8cMqOp701lh9d6Jb74ywtBKJhJHup6VNPFjllq2F-KFOft-UiAnxiYkaE3RddW2P16BXRCRwjk1OexJBBs5LqUU-R4tH2m1KD2iwUFFmwWEE45iKBluNG6TuCJI3rkD6yFNpBnoeTcFG4-_cNs87KW_YmLvLd9yFe1EchmjXWnLYbLPb3mAs4N7zARiqG8FdSZnRZkyTearhYQ-E7ETkUeVOOxXx7N6RgFmkQ	\N
clnkn212y0002xctymgf3klho	clnkn212o0000xctymucc8opz	oauth	facebook	1989453594754003	\N	EAAJZCHcqCjAABO5egpX0LN2NQRYdVhKyYQUGZB97bRMoMtznhAjXORY9C0QiNEEmPJYVeLcoembzhUyjJdetzDCjrxzcMD7PLDck44sw9BGUtq0DPIYZCg3gGqZCO6MYbUIcbX9rZBbi5TWhJ6ZAf1ei71mHI6il9bGN1iGBvle1ajFw0U862qZAFtZAfzhHCAqLZB9xPZCrSvK9UVV1KoiP73iMQYZBlYYHWk2meG8la8q1wtZAZCx38XA1M	1702118330	bearer	\N	\N	\N
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
clnbhmsst0003xcemt683zjoi	2023-10-04 08:29:44.909	299.150000000000000000000000000000	{"{\\"id\\": \\"clmyqjltw0002hj0zi9l42v7g\\", \\"img\\": \\"/temporary/p7.png\\", \\"price\\": 17.5, \\"title\\": \\"Makaronezi\\", \\"quantity\\": 1}","{\\"id\\": \\"clmsutasn0001hjs07ox7da8g\\", \\"img\\": \\"/temporary/p4.png\\", \\"price\\": 171.25, \\"title\\": \\"pasta goya\\", \\"quantity\\": 5, \\"optionTitle\\": \\"dno\\"}","{\\"id\\": \\"clmyqhxcw0001hj0zd5rvk30n\\", \\"img\\": \\"/temporary/p3.png\\", \\"price\\": 110.4, \\"title\\": \\"TomatoPizza\\", \\"quantity\\": 3}"}	Not Paid!	pi_3NxQSkEUu9WIU5CD1PT0rODj	molchanov1989olexandr@gmail.com
clnbhb2z50001xcems1qxv5wf	2023-10-04 08:20:38.224	87.650000000000000000000000000000	{"{\\"id\\": \\"clmyqgk5m0000hj0zsrvsqskc\\", \\"img\\": \\"/temporary/p2.png\\", \\"price\\": 18, \\"title\\": \\"Burger 2\\", \\"quantity\\": 1}","{\\"id\\": \\"clmsutasn0001hjs07ox7da8g\\", \\"img\\": \\"/temporary/p4.png\\", \\"price\\": 32.25, \\"title\\": \\"pasta goya\\", \\"quantity\\": 1, \\"optionTitle\\": \\"small\\"}","{\\"id\\": \\"clmyqhxcw0001hj0zd5rvk30n\\", \\"img\\": \\"/temporary/p3.png\\", \\"price\\": 36.8, \\"title\\": \\"TomatoPizza\\", \\"quantity\\": 4}"}	Not Paid!	pi_3NxQJxEUu9WIU5CD0joUhcUD	molchanov1989olexandr@gmail.com
cln3hfujg0006xc7flay9pxry	2023-09-28 18:02:11.164	87.650000000000000000000000000000	{"{\\"id\\": \\"clmyqgk5m0000hj0zsrvsqskc\\", \\"img\\": \\"/temporary/p2.png\\", \\"price\\": 18, \\"title\\": \\"Burger 2\\", \\"quantity\\": 1}","{\\"id\\": \\"clmsutasn0001hjs07ox7da8g\\", \\"img\\": \\"/temporary/p4.png\\", \\"price\\": 32.25, \\"title\\": \\"pasta goya\\", \\"quantity\\": 1, \\"optionTitle\\": \\"small\\"}","{\\"id\\": \\"clmyqhxcw0001hj0zd5rvk30n\\", \\"img\\": \\"/temporary/p3.png\\", \\"price\\": 36.8, \\"title\\": \\"TomatoPizza\\", \\"quantity\\": 4}"}	Not Paid!	pi_3NvOXREUu9WIU5CD0QKTX1fs	molchanov1989olexandr@gmail.com
clnh8ub4d0004xc5hur28azw5	2023-10-08 09:10:15.757	137.000000000000000000000000000000	{"{\\"id\\": \\"clmsutasn0001hjs07ox7da8g\\", \\"img\\": \\"/temporary/p4.png\\", \\"price\\": 137, \\"title\\": \\"pasta goya\\", \\"quantity\\": 4, \\"optionTitle\\": \\"dno\\"}"}	Being prepared!	pi_3Nyt0CEUu9WIU5CD0Ayhw5pA	rybkolhoz@gmail.com
clnh8zuml0001xcsmtp1hcq2l	2023-10-08 09:14:34.317	82.000000000000000000000000000000	{"{\\"id\\": \\"clmyqgk5m0000hj0zsrvsqskc\\", \\"img\\": \\"/temporary/p2.png\\", \\"price\\": 36, \\"title\\": \\"Burger 2\\", \\"quantity\\": 2}","{\\"id\\": \\"clndgf6p20001xczxdv4snzyv\\", \\"img\\": null, \\"price\\": 46, \\"title\\": \\"sresf\\", \\"quantity\\": 1, \\"optionTitle\\": \\"erwewr\\"}"}	Being prepared!	pi_3Nyt4MEUu9WIU5CD0x0SiFjs	rybkolhoz@gmail.com
clnj26jy30003xcjks7m7yg7y	2023-10-09 15:39:22.107	157.500000000000000000000000000000	{"{\\"id\\": \\"clmyqjltw0002hj0zi9l42v7g\\", \\"img\\": \\"/temporary/p7.png\\", \\"price\\": 157.5, \\"title\\": \\"Makaronezi\\", \\"quantity\\": 9}"}	Being prepared!	pi_3NzLYGEUu9WIU5CD0CPlzSPq	rybkolhoz@gmail.com
clnj4no54000bxcjki0agt7ev	2023-10-09 16:48:39.928	255.400000000000000000000000000000	{"{\\"id\\": \\"clmyqjltw0002hj0zi9l42v7g\\", \\"img\\": \\"/temporary/p7.png\\", \\"price\\": 35, \\"title\\": \\"Makaronezi\\", \\"quantity\\": 2}","{\\"id\\": \\"clmyqhxcw0001hj0zd5rvk30n\\", \\"img\\": \\"/temporary/p3.png\\", \\"price\\": 110.4, \\"title\\": \\"TomatoPizza\\", \\"quantity\\": 3}","{\\"id\\": \\"clmyqgk5m0000hj0zsrvsqskc\\", \\"img\\": \\"/temporary/p2.png\\", \\"price\\": 36, \\"title\\": \\"Burger 2\\", \\"quantity\\": 2}","{\\"id\\": \\"clmj29lho0001hjqjo8nzazgx\\", \\"img\\": \\"/temporary/p1.png\\", \\"price\\": 74, \\"title\\": \\"Sicilian\\", \\"quantity\\": 2, \\"optionTitle\\": \\"large\\"}"}	Being prepared!	pi_3NzMdLEUu9WIU5CD0l1eWWsC	molchanov1989olexandr@gmail.com
clnj2ghjy0007xcjkplaaznie	2023-10-09 15:47:05.566	27.200000000000000000000000000000	{"{\\"id\\": \\"clmsus3si0000hjs0mdoczmf8\\", \\"img\\": \\"/temporary/p5.png\\", \\"price\\": 27.2, \\"title\\": \\"Burger3\\", \\"quantity\\": 2, \\"optionTitle\\": \\"dno\\"}"}	Being prepared!	pi_3NzLfkEUu9WIU5CD0fImbuKm	rybkolhoz@gmail.com
clnko0ivi000excty1tfrae9b	2023-10-10 18:38:18.51	36.000000000000000000000000000000	{"{\\"id\\": \\"clnko0637000cxctyx5zs564b\\", \\"img\\": \\"http://res.cloudinary.com/dvlngfltj/image/upload/v1696963081/restaurant/swwgikq9zcg9rkcz9zkq.jpg\\", \\"price\\": 36, \\"title\\": \\"dnoo\\", \\"quantity\\": 2, \\"optionTitle\\": \\"wexx454\\"}"}	Being prepared!	pi_3Nzkp1EUu9WIU5CD0lcEBWyp	insolensnes@bigmir.net
clnkoargu000ixctyo4doxmz9	2023-10-10 18:46:16.206	179.020000000000000000000000000000	{"{\\"id\\": \\"clnko8wse000gxctyqrnb1p1c\\", \\"img\\": \\"http://res.cloudinary.com/dvlngfltj/image/upload/v1696963488/restaurant/g7g3yhvawpqayl9uecbb.jpg\\", \\"price\\": 11.52, \\"title\\": \\"test\\", \\"quantity\\": 3, \\"optionTitle\\": \\"erer2\\"}","{\\"id\\": \\"clnknd9ej0008xctylf9nnna4\\", \\"img\\": \\"http://res.cloudinary.com/dvlngfltj/image/upload/v1696962007/restaurant/yplihf7lkcbfgi3kdjcu.png\\", \\"price\\": 14.5, \\"title\\": \\"Dnishche\\", \\"quantity\\": 1, \\"optionTitle\\": \\"three\\"}","{\\"id\\": \\"clnkndb8z000axctytmccd7cc\\", \\"img\\": \\"http://res.cloudinary.com/dvlngfltj/image/upload/v1696962014/restaurant/iighecduppqehx1wpzgg.png\\", \\"price\\": 40.5, \\"title\\": \\"Dnishche\\", \\"quantity\\": 3, \\"optionTitle\\": \\"two\\"}","{\\"id\\": \\"clnko0637000cxctyx5zs564b\\", \\"img\\": \\"http://res.cloudinary.com/dvlngfltj/image/upload/v1696963081/restaurant/swwgikq9zcg9rkcz9zkq.jpg\\", \\"price\\": 36, \\"title\\": \\"dnoo\\", \\"quantity\\": 2, \\"optionTitle\\": \\"wexx454\\"}","{\\"id\\": \\"clndjbl880001xcmewmzqxpvs\\", \\"img\\": \\"http://res.cloudinary.com/dvlngfltj/image/upload/v1696531952/restaurant/xtrxo1rq9vie1oxiotbr.jpg\\", \\"price\\": 24, \\"title\\": \\"wewewe\\", \\"quantity\\": 2}","{\\"id\\": \\"clmyqjltw0002hj0zi9l42v7g\\", \\"img\\": \\"/temporary/p7.png\\", \\"price\\": 52.5, \\"title\\": \\"Makaronezi\\", \\"quantity\\": 3}"}	Being prepared!	pi_3NzkwgEUu9WIU5CD0xfbHS3F	insolensnes@bigmir.net
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
clndjbl880001xcmewmzqxpvs	2023-10-05 18:52:33.464	wewewe	wewe	http://res.cloudinary.com/dvlngfltj/image/upload/v1696531952/restaurant/xtrxo1rq9vie1oxiotbr.jpg	12.000000000000000000000000000000	f	{}	pizzas
clnknd9ej0008xctylf9nnna4	2023-10-10 18:20:12.976	Dnishche	Ddddf dfdfdf lklklvkblvkbl vbv-0bv-0b-v0b-v0b12121	http://res.cloudinary.com/dvlngfltj/image/upload/v1696962007/restaurant/yplihf7lkcbfgi3kdjcu.png	11.000000000000000000000000000000	f	{"{\\"title\\": \\"one\\", \\"additionalPrice\\": \\"2\\"}","{\\"title\\": \\"two\\", \\"additionalPrice\\": \\"2.5\\"}","{\\"title\\": \\"three\\", \\"additionalPrice\\": \\"3.5\\"}"}	burgers
clnkndb8z000axctytmccd7cc	2023-10-10 18:20:15.54	Dnishche	Ddddf dfdfdf lklklvkblvkbl vbv-0bv-0b-v0b-v0b12121	http://res.cloudinary.com/dvlngfltj/image/upload/v1696962014/restaurant/iighecduppqehx1wpzgg.png	11.000000000000000000000000000000	f	{"{\\"title\\": \\"one\\", \\"additionalPrice\\": \\"2\\"}","{\\"title\\": \\"two\\", \\"additionalPrice\\": \\"2.5\\"}","{\\"title\\": \\"three\\", \\"additionalPrice\\": \\"3.5\\"}"}	burgers
clnko0637000cxctyx5zs564b	2023-10-10 18:38:01.938	dnoo	fdffdfdfdf	http://res.cloudinary.com/dvlngfltj/image/upload/v1696963081/restaurant/swwgikq9zcg9rkcz9zkq.jpg	11.000000000000000000000000000000	f	{"{\\"title\\": \\"wewe\\", \\"additionalPrice\\": \\"3\\"}","{\\"title\\": \\"wexx\\", \\"additionalPrice\\": \\"5\\"}","{\\"title\\": \\"wexx454\\", \\"additionalPrice\\": \\"7\\"}"}	pastas
clnko8wse000gxctyqrnb1p1c	2023-10-10 18:44:49.79	test	ttttttttttttttttt	http://res.cloudinary.com/dvlngfltj/image/upload/v1696963488/restaurant/g7g3yhvawpqayl9uecbb.jpg	1.140000000000000000000000000000	f	{"{\\"title\\": \\"erer\\", \\"additionalPrice\\": \\"0.23\\"}","{\\"title\\": \\"erer2\\", \\"additionalPrice\\": \\"2.7\\"}"}	pastas
\.


--
-- Data for Name: Session; Type: TABLE DATA; Schema: public; Owner: gufrip
--

COPY public."Session" (id, "sessionToken", "userId", expires) FROM stdin;
clnj422zn0009xcjkkxlfxkn5	d34b8704-6476-4675-a9a5-46826bf75f6d	cln3h2vle0000xc7fcfzwltpt	2023-11-08 16:49:43.033
clnkn22290004xctytkv0we3v	59d3dc5a-ce21-40aa-97b7-b5171d221720	clnkn212o0000xctymucc8opz	2023-11-09 18:53:01.074
clnj20qqf0001xcjk17ffgs33	7672110b-d610-4739-9b42-298185164873	clnh8pj960000xc5hjwvp1mjv	2023-11-12 09:01:21.277
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: gufrip
--

COPY public."User" (id, name, email, "emailVerified", image, "isAdmin", password) FROM stdin;
clmq5ek620001hjcb7ie2qsup	guf user	guf@rip.ua	\N	\N	f	\N
cln3h2vle0000xc7fcfzwltpt	Олександр Молчанов	molchanov1989olexandr@gmail.com	\N	https://lh3.googleusercontent.com/a/ACg8ocKlaq1iI8knrs7MTu_pTIR0vAFyWaeeEGISz4a6o4p6=s96-c	t	\N
clnh8pj960000xc5hjwvp1mjv	М.О.О.	rybkolhoz@gmail.com	\N	https://lh3.googleusercontent.com/a/ACg8ocLX84h2oj3CXie42saWgWASaE4xnbFN4zMjl6Hg772NIg=s96-c	f	\N
clnkn212o0000xctymucc8opz	Олександр Молчанов	insolensnes@bigmir.net	\N	https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1989453594754003&height=50&width=50&ext=1699553488&hash=AeS3zp02eRDQiDsr1jM	t	\N
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
c4be62d0-7980-4b39-a892-1df400f06a6b	789124b047ea87082c9dc678343c9b3682fcb48b700f3398d6d8f265a03cb293	2023-09-25 15:49:59.913134+00	20230913081819_first	\N	\N	2023-09-25 15:49:59.863161+00	1
6bd7c4e8-6501-4f98-8e49-d3e1af6118b3	be700681cdfb85e9cf3305d814fe52a16974f96944d3cb38234d83603eaf297c	2023-09-25 15:49:59.966035+00	20230918104430_add_user	\N	\N	2023-09-25 15:49:59.914825+00	1
d45f94b8-e35e-4916-b505-4e2885ebe551	789124b047ea87082c9dc678343c9b3682fcb48b700f3398d6d8f265a03cb293	2023-09-13 08:18:20.487563+00	20230913081819_first	\N	\N	2023-09-13 08:18:19.973892+00	1
c6eb4b68-4ebb-48a1-a327-7513f5a2e7b0	be700681cdfb85e9cf3305d814fe52a16974f96944d3cb38234d83603eaf297c	2023-09-18 10:44:31.648847+00	20230918104430_add_user	\N	\N	2023-09-18 10:44:30.621133+00	1
b0caeaa2-57d7-455f-a374-987f4f53a7f4	aa23032030363961664ad4847c12f81c236f30d9b463543762f59d612f433293	2023-10-13 11:29:17.518838+00	20231002141533_double_precision	\N	\N	2023-10-13 11:29:17.487717+00	1
72aebc1d-c08d-4554-862f-7aacd033fa3c	cef2dad0f96ec0a5259bf56e63bd615423b23a61e7f531737889562873cda750	2023-10-13 11:34:00.360176+00	20231013113400_decimalprice_again_password	\N	\N	2023-10-13 11:34:00.329035+00	1
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

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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

