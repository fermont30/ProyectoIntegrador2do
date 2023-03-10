toc.dat                                                                                             0000600 0004000 0002000 00000020240 14367540472 0014451 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           "                {            login    15.1    15.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    16442    login    DATABASE     x   CREATE DATABASE login WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE login;
                postgres    false         ?            1259    16785 	   categoria    TABLE     n   CREATE TABLE public.categoria (
    idcat integer NOT NULL,
    descripcion character varying(40) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false         ?            1259    25043    pedidos    TABLE     ?   CREATE TABLE public.pedidos (
    id integer NOT NULL,
    idproductos integer NOT NULL,
    idusers integer,
    cantidad integer
);
    DROP TABLE public.pedidos;
       public         heap    postgres    false         ?            1259    25042    pedidos_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.pedidos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.pedidos_id_seq;
       public          postgres    false    220                    0    0    pedidos_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.pedidos_id_seq OWNED BY public.pedidos.id;
          public          postgres    false    219         ?            1259    16779 	   productos    TABLE     ?   CREATE TABLE public.productos (
    id integer NOT NULL,
    nombre character varying(40) NOT NULL,
    precio double precision NOT NULL,
    descripcion character varying(255) NOT NULL,
    idcat integer NOT NULL
);
    DROP TABLE public.productos;
       public         heap    postgres    false         ?            1259    16778    productos_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.productos_id_seq;
       public          postgres    false    217                    0    0    productos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;
          public          postgres    false    216         ?            1259    16444    users    TABLE     ?   CREATE TABLE public.users (
    id integer NOT NULL,
    fullname character varying(100) NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(50) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false         ?            1259    16443    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215                    0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    214         u           2604    25046 
   pedidos id    DEFAULT     h   ALTER TABLE ONLY public.pedidos ALTER COLUMN id SET DEFAULT nextval('public.pedidos_id_seq'::regclass);
 9   ALTER TABLE public.pedidos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220         t           2604    16782    productos id    DEFAULT     l   ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);
 ;   ALTER TABLE public.productos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217         s           2604    16447    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215                   0    16785 	   categoria 
   TABLE DATA           7   COPY public.categoria (idcat, descripcion) FROM stdin;
    public          postgres    false    218       3347.dat           0    25043    pedidos 
   TABLE DATA           E   COPY public.pedidos (id, idproductos, idusers, cantidad) FROM stdin;
    public          postgres    false    220       3349.dat           0    16779 	   productos 
   TABLE DATA           K   COPY public.productos (id, nombre, precio, descripcion, idcat) FROM stdin;
    public          postgres    false    217       3346.dat           0    16444    users 
   TABLE DATA           H   COPY public.users (id, fullname, username, password, email) FROM stdin;
    public          postgres    false    215       3344.dat            0    0    pedidos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pedidos_id_seq', 10, true);
          public          postgres    false    219                     0    0    productos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.productos_id_seq', 35, true);
          public          postgres    false    216         !           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 13, true);
          public          postgres    false    214         {           2606    16789    categoria categoria_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (idcat);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    218         }           2606    25048    pedidos pedidos_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.pedidos DROP CONSTRAINT pedidos_pkey;
       public            postgres    false    220         y           2606    16784    productos productos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    217         w           2606    16449    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215         ~           2606    16790    productos fk_cat    FK CONSTRAINT     t   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_cat FOREIGN KEY (idcat) REFERENCES public.categoria(idcat);
 :   ALTER TABLE ONLY public.productos DROP CONSTRAINT fk_cat;
       public          postgres    false    218    3195    217                    2606    25049    pedidos fk_products    FK CONSTRAINT     ?   ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT fk_products FOREIGN KEY (idproductos) REFERENCES public.productos(id) ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.pedidos DROP CONSTRAINT fk_products;
       public          postgres    false    3193    220    217         ?           2606    25054    pedidos fk_users    FK CONSTRAINT     ?   ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT fk_users FOREIGN KEY (idusers) REFERENCES public.users(id) ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.pedidos DROP CONSTRAINT fk_users;
       public          postgres    false    215    3191    220                                                                                                                                                                                                                                                                                                                                                                        3347.dat                                                                                            0000600 0004000 0002000 00000000072 14367540472 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	celulares
2	ordenadores
3	componentes
4	accesorios
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                      3349.dat                                                                                            0000600 0004000 0002000 00000000056 14367540472 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        7	22	\N	2
8	24	\N	1
9	24	\N	2
10	22	\N	3
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  3346.dat                                                                                            0000600 0004000 0002000 00000000415 14367540472 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        24	Poco x3 pro	200.4	poco x3 pro es una versión mejorada en las características del poco  x3 	1
22	Xiaomi note 12 nft	802	el normal	1
33	laptop razer	800.6	laptop gamer	2
34	targeta de video rtx 3060	1200.5	targeta nvidia	3
35	mouse razer gold	80.9	mouse rojo	4
\.


                                                                                                                                                                                                                                                   3344.dat                                                                                            0000600 0004000 0002000 00000003334 14367540472 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	fercho	fermont	pbkdf2:sha256:260000$opHC90nwH7YdTjcN$7be9f90adfca1f6f4dcfe5c8a6b79390dfffdf25a5d9aca2aa8bb2a6098c016c	fermont@gmail.com
2	carlos	carlos	pbkdf2:sha256:260000$mn1YG7ebwBhAQGTu$53c2ba6f4015f6c34185a5ac8eaf1019638ee28702e03613e55cfa12a5c73528	pelis@gmail.com
3	jessica	jsk	pbkdf2:sha256:260000$GGRfyhFZrCUkdf2P$d3600cbddb5bf8b99f09cbc535bf201ae3e9dc25dbaa1b48f1e3955a571540c5	jessica@gmail.com
4	alexander	alex	pbkdf2:sha256:260000$NGvUEBHNA3rRPPPZ$29415ec2efb8b9419ecfc08fb7df7ef58194f41725a3fcd000eec3300ed1450d	alex@gmail.com
5	marlon	mar	pbkdf2:sha256:260000$k1vj79AmFBXpswsJ$aaa575fcb7febf40a38e6b9abe58ff288f2b2520a731ddcdacab4713d8ad71a3	marlon@gmail.com
6	bladimir	blady	pbkdf2:sha256:260000$vxXOhZsRV3oh95Lt$eee06d96aa5d9cb20dd37e3783893a7a93814d5c22ee50535ee4ae5ac12e25c1	bladimir@gmail.com
7	kevin	kev	pbkdf2:sha256:260000$Wb8dFll57BwJUREs$7e8701decf1554c5391a1ecc09387fc8568f4a65dd6613ae7180d723a8c9bf35	kevin@gmail.com
8	guissell	guiss	pbkdf2:sha256:260000$DNVszSwoH8mvolfq$543ff657f42dad74e885b055bdafacee305f5af168851af3fe36e5999d9a3fb8	gismont@gmail.com
9	fercho2	fer	pbkdf2:sha256:260000$jHdHldFfn4a9EYYi$d6a72380bb77393d6178bfcd0f088d247bdd9c4031debfa9aa0fbaaa1882a20c	fermonr2@sfd.com
10	kevin2	kev2	pbkdf2:sha256:260000$wBKiXfd6L9o9ki07$324ef0089898b06b1cb5d638020c154f729a750c90ccd46d1f6edb3d85513aa8	kevin2@gmail.com
11	mari	mary	pbkdf2:sha256:260000$KjqvTttkW5FxeWUJ$8784d09dcd9ed3fa0966ada4a42e37873d0b361caec96abc127554e797e12323	mari@gmail.com
12	lore	lore	pbkdf2:sha256:260000$x8Tx5xX9laP1KNwp$cfccd8cd10298ad22e11b75b8ff5021c443354d0ba1cfadeb804356c41f67398	lore@gmail.com
13	bryan	bryan	pbkdf2:sha256:260000$0ydgUdF7fP168SaW$c0d7bbac98124b7bcc410dc0daffb50e2c5c096ee2c09afb84b772e05facc211	brayan2@gmail.com
\.


                                                                                                                                                                                                                                                                                                    restore.sql                                                                                         0000600 0004000 0002000 00000015633 14367540472 0015410 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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

DROP DATABASE login;
--
-- Name: login; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE login WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE login OWNER TO postgres;

\connect login

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
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    idcat integer NOT NULL,
    descripcion character varying(40) NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos (
    id integer NOT NULL,
    idproductos integer NOT NULL,
    idusers integer,
    cantidad integer
);


ALTER TABLE public.pedidos OWNER TO postgres;

--
-- Name: pedidos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_id_seq OWNER TO postgres;

--
-- Name: pedidos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_id_seq OWNED BY public.pedidos.id;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    nombre character varying(40) NOT NULL,
    precio double precision NOT NULL,
    descripcion character varying(255) NOT NULL,
    idcat integer NOT NULL
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_id_seq OWNER TO postgres;

--
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    fullname character varying(100) NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: pedidos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos ALTER COLUMN id SET DEFAULT nextval('public.pedidos_id_seq'::regclass);


--
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (idcat, descripcion) FROM stdin;
\.
COPY public.categoria (idcat, descripcion) FROM '$$PATH$$/3347.dat';

--
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos (id, idproductos, idusers, cantidad) FROM stdin;
\.
COPY public.pedidos (id, idproductos, idusers, cantidad) FROM '$$PATH$$/3349.dat';

--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id, nombre, precio, descripcion, idcat) FROM stdin;
\.
COPY public.productos (id, nombre, precio, descripcion, idcat) FROM '$$PATH$$/3346.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, fullname, username, password, email) FROM stdin;
\.
COPY public.users (id, fullname, username, password, email) FROM '$$PATH$$/3344.dat';

--
-- Name: pedidos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_id_seq', 10, true);


--
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 35, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (idcat);


--
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: productos fk_cat; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT fk_cat FOREIGN KEY (idcat) REFERENCES public.categoria(idcat);


--
-- Name: pedidos fk_products; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT fk_products FOREIGN KEY (idproductos) REFERENCES public.productos(id) ON DELETE CASCADE;


--
-- Name: pedidos fk_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT fk_users FOREIGN KEY (idusers) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     