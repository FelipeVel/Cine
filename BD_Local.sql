-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: new_database | type: DATABASE --
-- -- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- -- ddl-end --
-- 

-- object: public.funcion | type: TABLE --
-- DROP TABLE IF EXISTS public.funcion CASCADE;
CREATE TABLE public.funcion(
	id integer NOT NULL,
	pelicula_id integer NOT NULL,
	sala_id integer NOT NULL,
	CONSTRAINT pk_funcion PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.funcion OWNER TO postgres;
-- ddl-end --

-- object: public.sala | type: TABLE --
-- DROP TABLE IF EXISTS public.sala CASCADE;
CREATE TABLE public.sala(
	id integer NOT NULL,
	sillas_general integer NOT NULL DEFAULT 40,
	sillas_preferencial integer NOT NULL DEFAULT 20,
	sede_id integer NOT NULL,
	CONSTRAINT pk_sala PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.sala OWNER TO postgres;
-- ddl-end --

-- object: public.orden | type: TABLE --
-- DROP TABLE IF EXISTS public.orden CASCADE;
CREATE TABLE public.orden(
	id integer NOT NULL,
	cliente_id integer NOT NULL,
	CONSTRAINT pk_orden PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.orden OWNER TO postgres;
-- ddl-end --

-- object: public.boleta | type: TABLE --
-- DROP TABLE IF EXISTS public.boleta CASCADE;
CREATE TABLE public.boleta(
	id integer NOT NULL,
	orden_id integer NOT NULL,
	funcion_id integer NOT NULL,
	CONSTRAINT pk_boleta PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.boleta OWNER TO postgres;
-- ddl-end --

-- object: public.pedidos_snacks | type: TABLE --
-- DROP TABLE IF EXISTS public.pedidos_snacks CASCADE;
CREATE TABLE public.pedidos_snacks(
	id integer NOT NULL,
	snack_id integer NOT NULL,
	orden_id integer NOT NULL,
	CONSTRAINT pk_pedidos_snacks PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.pedidos_snacks OWNER TO postgres;
-- ddl-end --

-- object: fk_funcion_sala | type: CONSTRAINT --
-- ALTER TABLE public.funcion DROP CONSTRAINT IF EXISTS fk_funcion_sala CASCADE;
ALTER TABLE public.funcion ADD CONSTRAINT fk_funcion_sala FOREIGN KEY (sala_id)
REFERENCES public.sala (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_boleta_orden | type: CONSTRAINT --
-- ALTER TABLE public.boleta DROP CONSTRAINT IF EXISTS fk_boleta_orden CASCADE;
ALTER TABLE public.boleta ADD CONSTRAINT fk_boleta_orden FOREIGN KEY (orden_id)
REFERENCES public.orden (id) MATCH FULL
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_funcion_pelicula | type: CONSTRAINT --
-- ALTER TABLE public.boleta DROP CONSTRAINT IF EXISTS fk_funcion_pelicula CASCADE;
ALTER TABLE public.boleta ADD CONSTRAINT fk_funcion_pelicula FOREIGN KEY (funcion_id)
REFERENCES public.funcion (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_pedido_orden | type: CONSTRAINT --
-- ALTER TABLE public.pedidos_snacks DROP CONSTRAINT IF EXISTS fk_pedido_orden CASCADE;
ALTER TABLE public.pedidos_snacks ADD CONSTRAINT fk_pedido_orden FOREIGN KEY (orden_id)
REFERENCES public.orden (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


