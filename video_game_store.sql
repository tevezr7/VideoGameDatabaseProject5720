--
-- PostgreSQL database dump
--

\restrict OEoLr2js890LL94wgvlLZFI8ajc40LOesLpxYeRvtfFhp9lTBCZxhhJjGv1Fb4X

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-12-12 22:14:13

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
-- TOC entry 5077 (class 1262 OID 16953)
-- Name: video_game_store; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE video_game_store WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE video_game_store OWNER TO postgres;

\unrestrict OEoLr2js890LL94wgvlLZFI8ajc40LOesLpxYeRvtfFhp9lTBCZxhhJjGv1Fb4X
\connect video_game_store
\restrict OEoLr2js890LL94wgvlLZFI8ajc40LOesLpxYeRvtfFhp9lTBCZxhhJjGv1Fb4X

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
-- TOC entry 220 (class 1259 OID 16962)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    name text,
    email text,
    phone text,
    address text
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16954)
-- Name: game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game (
    game_id integer NOT NULL,
    name text,
    release_date date,
    genre text,
    esrb_rating text,
    price numeric(6,2)
);


ALTER TABLE public.game OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17109)
-- Name: game_availability; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_availability (
    game_id integer NOT NULL,
    platform_id integer NOT NULL
);


ALTER TABLE public.game_availability OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17023)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    store_id integer NOT NULL,
    game_id integer NOT NULL,
    platform_id integer NOT NULL,
    quantity integer
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17086)
-- Name: order_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_item (
    order_id integer NOT NULL,
    game_id integer NOT NULL,
    platform_id integer NOT NULL,
    quantity integer,
    unit_price_at_sale numeric(6,2)
);


ALTER TABLE public.order_item OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16970)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    total_amount numeric(6,2),
    customer_id integer,
    order_date date
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16983)
-- Name: platform; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.platform (
    platform_id integer NOT NULL,
    name text,
    release_date date,
    price numeric(6,2)
);


ALTER TABLE public.platform OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17046)
-- Name: review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review (
    review_id integer NOT NULL,
    score integer,
    review_date date,
    customer_id integer,
    game_id integer
);


ALTER TABLE public.review OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16991)
-- Name: store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.store (
    store_id integer NOT NULL,
    name text,
    address text,
    phone text
);


ALTER TABLE public.store OWNER TO postgres;

--
-- TOC entry 5064 (class 0 OID 16962)
-- Dependencies: 220
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer (customer_id, name, email, phone, address) VALUES (1, 'Aldair Perez', 'aldair@email.com', '9095551234', '123 Peaceful St');
INSERT INTO public.customer (customer_id, name, email, phone, address) VALUES (2, 'Lawrence Orijuela', 'lawrence@email.com', '9095551235', '234 Awesome Dr');
INSERT INTO public.customer (customer_id, name, email, phone, address) VALUES (3, 'Giovanni Orijuela', 'giovanni@email.com', '9095551236', '456 Wondrous Ave');
INSERT INTO public.customer (customer_id, name, email, phone, address) VALUES (4, 'Todd Howard', 'todd@email.com', '9095551237', '678 Lovely Rd');
INSERT INTO public.customer (customer_id, name, email, phone, address) VALUES (5, 'Abraham Lincoln', 'abraham@email.com', '9095551238', '899 Cool St');
INSERT INTO public.customer (customer_id, name, email, phone, address) VALUES (6, 'Dragon Born', 'dragon@email.com', '9095551239', '146 Main St');
INSERT INTO public.customer (customer_id, name, email, phone, address) VALUES (7, 'Tarnished One', 'tarnished@email.com', '9095551240', '424 Epic Ave');


--
-- TOC entry 5063 (class 0 OID 16954)
-- Dependencies: 219
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.game (game_id, name, release_date, genre, esrb_rating, price) VALUES (1, 'Skyrim', '2011-11-11', 'RPG', 'M', 59.99);
INSERT INTO public.game (game_id, name, release_date, genre, esrb_rating, price) VALUES (2, 'Elden Ring', '2022-02-01', 'RPG', 'M', 59.99);
INSERT INTO public.game (game_id, name, release_date, genre, esrb_rating, price) VALUES (3, 'Rainbow Six Siege', '2015-12-01', 'Action', 'M', 59.99);
INSERT INTO public.game (game_id, name, release_date, genre, esrb_rating, price) VALUES (4, 'Smash Bros Ultimate', '2017-06-01', 'Fighting', 'E', 59.99);
INSERT INTO public.game (game_id, name, release_date, genre, esrb_rating, price) VALUES (5, 'FIFA 20', '2019-09-01', 'Sports', 'E', 59.99);
INSERT INTO public.game (game_id, name, release_date, genre, esrb_rating, price) VALUES (6, 'Twilight Princess', '2004-06-01', 'Adventure', 'T', 59.99);
INSERT INTO public.game (game_id, name, release_date, genre, esrb_rating, price) VALUES (7, 'Fallout 4', '2015-11-10', 'RPG', 'M', 59.99);


--
-- TOC entry 5071 (class 0 OID 17109)
-- Dependencies: 227
-- Data for Name: game_availability; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.game_availability (game_id, platform_id) VALUES (1, 1);
INSERT INTO public.game_availability (game_id, platform_id) VALUES (1, 6);
INSERT INTO public.game_availability (game_id, platform_id) VALUES (1, 7);
INSERT INTO public.game_availability (game_id, platform_id) VALUES (2, 1);
INSERT INTO public.game_availability (game_id, platform_id) VALUES (2, 2);
INSERT INTO public.game_availability (game_id, platform_id) VALUES (2, 3);
INSERT INTO public.game_availability (game_id, platform_id) VALUES (2, 4);
INSERT INTO public.game_availability (game_id, platform_id) VALUES (3, 1);
INSERT INTO public.game_availability (game_id, platform_id) VALUES (3, 2);
INSERT INTO public.game_availability (game_id, platform_id) VALUES (3, 3);


--
-- TOC entry 5068 (class 0 OID 17023)
-- Dependencies: 224
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inventory (store_id, game_id, platform_id, quantity) VALUES (1, 1, 1, 5);
INSERT INTO public.inventory (store_id, game_id, platform_id, quantity) VALUES (2, 1, 1, 7);
INSERT INTO public.inventory (store_id, game_id, platform_id, quantity) VALUES (3, 1, 1, 1);
INSERT INTO public.inventory (store_id, game_id, platform_id, quantity) VALUES (1, 2, 1, 12);
INSERT INTO public.inventory (store_id, game_id, platform_id, quantity) VALUES (2, 2, 1, 7);
INSERT INTO public.inventory (store_id, game_id, platform_id, quantity) VALUES (2, 2, 3, 9);
INSERT INTO public.inventory (store_id, game_id, platform_id, quantity) VALUES (2, 3, 1, 15);
INSERT INTO public.inventory (store_id, game_id, platform_id, quantity) VALUES (3, 3, 1, 14);


--
-- TOC entry 5070 (class 0 OID 17086)
-- Dependencies: 226
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_item (order_id, game_id, platform_id, quantity, unit_price_at_sale) VALUES (1, 1, 1, 1, 59.99);
INSERT INTO public.order_item (order_id, game_id, platform_id, quantity, unit_price_at_sale) VALUES (1, 2, 1, 1, 59.99);
INSERT INTO public.order_item (order_id, game_id, platform_id, quantity, unit_price_at_sale) VALUES (2, 3, 1, 2, 35.00);
INSERT INTO public.order_item (order_id, game_id, platform_id, quantity, unit_price_at_sale) VALUES (2, 4, 5, 1, 30.00);
INSERT INTO public.order_item (order_id, game_id, platform_id, quantity, unit_price_at_sale) VALUES (2, 5, 1, 2, 50.00);
INSERT INTO public.order_item (order_id, game_id, platform_id, quantity, unit_price_at_sale) VALUES (3, 1, 1, 1, 19.99);
INSERT INTO public.order_item (order_id, game_id, platform_id, quantity, unit_price_at_sale) VALUES (7, 2, 2, 1, 59.99);
INSERT INTO public.order_item (order_id, game_id, platform_id, quantity, unit_price_at_sale) VALUES (8, 2, 3, 1, 59.99);


--
-- TOC entry 5065 (class 0 OID 16970)
-- Dependencies: 221
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (order_id, total_amount, customer_id, order_date) VALUES (1, 119.98, 1, '2024-12-01');
INSERT INTO public.orders (order_id, total_amount, customer_id, order_date) VALUES (2, 200.00, 1, '2025-12-01');
INSERT INTO public.orders (order_id, total_amount, customer_id, order_date) VALUES (3, 19.99, 2, '2022-02-11');
INSERT INTO public.orders (order_id, total_amount, customer_id, order_date) VALUES (4, 39.52, 3, '2022-06-21');
INSERT INTO public.orders (order_id, total_amount, customer_id, order_date) VALUES (5, 44.86, 4, '2024-11-04');
INSERT INTO public.orders (order_id, total_amount, customer_id, order_date) VALUES (6, 68.52, 5, '2023-08-04');
INSERT INTO public.orders (order_id, total_amount, customer_id, order_date) VALUES (7, 59.99, 6, '2024-04-07');
INSERT INTO public.orders (order_id, total_amount, customer_id, order_date) VALUES (8, 59.99, 7, '2024-04-20');


--
-- TOC entry 5066 (class 0 OID 16983)
-- Dependencies: 222
-- Data for Name: platform; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.platform (platform_id, name, release_date, price) VALUES (1, 'PC', '2000-01-01', 1000.00);
INSERT INTO public.platform (platform_id, name, release_date, price) VALUES (2, 'Playstation 5', '2020-11-12', 499.99);
INSERT INTO public.platform (platform_id, name, release_date, price) VALUES (3, 'Xbox Series X', '2020-11-10', 499.99);
INSERT INTO public.platform (platform_id, name, release_date, price) VALUES (4, 'Nintendo Switch 2', '2025-06-01', 499.99);
INSERT INTO public.platform (platform_id, name, release_date, price) VALUES (5, 'Nintendo Switch', '2017-06-01', 499.99);
INSERT INTO public.platform (platform_id, name, release_date, price) VALUES (6, 'Playstation 4', '2013-11-01', 499.99);
INSERT INTO public.platform (platform_id, name, release_date, price) VALUES (7, 'Xbox One', '2013-11-01', 499.99);


--
-- TOC entry 5069 (class 0 OID 17046)
-- Dependencies: 225
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.review (review_id, score, review_date, customer_id, game_id) VALUES (1, 10, '2025-12-05', 1, 1);
INSERT INTO public.review (review_id, score, review_date, customer_id, game_id) VALUES (2, 10, '2025-11-05', 2, 1);
INSERT INTO public.review (review_id, score, review_date, customer_id, game_id) VALUES (3, 10, '2023-10-01', 3, 1);
INSERT INTO public.review (review_id, score, review_date, customer_id, game_id) VALUES (4, 10, '2021-11-24', 4, 1);
INSERT INTO public.review (review_id, score, review_date, customer_id, game_id) VALUES (5, 10, '2020-02-04', 5, 1);
INSERT INTO public.review (review_id, score, review_date, customer_id, game_id) VALUES (6, 10, '2025-04-20', 1, 2);
INSERT INTO public.review (review_id, score, review_date, customer_id, game_id) VALUES (7, 10, '2021-10-24', 1, 3);
INSERT INTO public.review (review_id, score, review_date, customer_id, game_id) VALUES (8, 10, '2025-09-15', 1, 4);


--
-- TOC entry 5067 (class 0 OID 16991)
-- Dependencies: 223
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.store (store_id, name, address, phone) VALUES (1, 'Downtown Store', '123 Main St', '9095551111');
INSERT INTO public.store (store_id, name, address, phone) VALUES (2, 'Mall Store', '456 Mall Rd', '9095552222');
INSERT INTO public.store (store_id, name, address, phone) VALUES (3, 'Rural Store', '789 Country Ave', '9095553333');
INSERT INTO public.store (store_id, name, address, phone) VALUES (4, 'Big Store', '147 Great Dr', '9095554444');
INSERT INTO public.store (store_id, name, address, phone) VALUES (5, 'Small Store', '321 Mini St', '9095556666');
INSERT INTO public.store (store_id, name, address, phone) VALUES (6, 'Epic Store', '762 Epic Ave', '9095557777');


--
-- TOC entry 4890 (class 2606 OID 16969)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4904 (class 2606 OID 17115)
-- Name: game_availability game_availability_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_availability
    ADD CONSTRAINT game_availability_pkey PRIMARY KEY (game_id, platform_id);


--
-- TOC entry 4888 (class 2606 OID 16961)
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (game_id);


--
-- TOC entry 4898 (class 2606 OID 17030)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (store_id, game_id, platform_id);


--
-- TOC entry 4902 (class 2606 OID 17093)
-- Name: order_item order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (order_id, game_id, platform_id);


--
-- TOC entry 4892 (class 2606 OID 16977)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4894 (class 2606 OID 16990)
-- Name: platform platform_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.platform
    ADD CONSTRAINT platform_pkey PRIMARY KEY (platform_id);


--
-- TOC entry 4900 (class 2606 OID 17051)
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (review_id);


--
-- TOC entry 4896 (class 2606 OID 16998)
-- Name: store store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (store_id);


--
-- TOC entry 4914 (class 2606 OID 17116)
-- Name: game_availability game_availability_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_availability
    ADD CONSTRAINT game_availability_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.game(game_id);


--
-- TOC entry 4915 (class 2606 OID 17121)
-- Name: game_availability game_availability_platform_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_availability
    ADD CONSTRAINT game_availability_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES public.platform(platform_id);


--
-- TOC entry 4906 (class 2606 OID 17036)
-- Name: inventory inventory_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.game(game_id) NOT VALID;


--
-- TOC entry 4907 (class 2606 OID 17041)
-- Name: inventory inventory_platform_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES public.platform(platform_id) NOT VALID;


--
-- TOC entry 4908 (class 2606 OID 17031)
-- Name: inventory inventory_store_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_store_id_fkey FOREIGN KEY (store_id) REFERENCES public.store(store_id);


--
-- TOC entry 4911 (class 2606 OID 17099)
-- Name: order_item order_item_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.game(game_id);


--
-- TOC entry 4912 (class 2606 OID 17094)
-- Name: order_item order_item_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- TOC entry 4913 (class 2606 OID 17104)
-- Name: order_item order_item_platform_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT order_item_platform_id_fkey FOREIGN KEY (platform_id) REFERENCES public.platform(platform_id);


--
-- TOC entry 4905 (class 2606 OID 16978)
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- TOC entry 4909 (class 2606 OID 17052)
-- Name: review review_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- TOC entry 4910 (class 2606 OID 17057)
-- Name: review review_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.game(game_id);


-- Completed on 2025-12-12 22:14:13

--
-- PostgreSQL database dump complete
--

\unrestrict OEoLr2js890LL94wgvlLZFI8ajc40LOesLpxYeRvtfFhp9lTBCZxhhJjGv1Fb4X

