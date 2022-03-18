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

-- object: public.pelicula | type: TABLE --
-- DROP TABLE IF EXISTS public.pelicula CASCADE;
CREATE TABLE public.pelicula(
	id integer NOT NULL,
	nombre varchar NOT NULL,
	puntuacion int2 NOT NULL,
	CONSTRAINT pk_pelicula PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.pelicula OWNER TO postgres;
-- ddl-end --

-- object: public.empleado | type: TABLE --
-- DROP TABLE IF EXISTS public.empleado CASCADE;
CREATE TABLE public.empleado(
	id integer NOT NULL,
	nombre varchar NOT NULL,
	fecha_inicio date NOT NULL,
	salario integer NOT NULL,
	rol_id integer NOT NULL,
	sede_id integer NOT NULL,
	CONSTRAINT pk_empleado PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.empleado OWNER TO postgres;
-- ddl-end --

-- object: public.rol | type: TABLE --
-- DROP TABLE IF EXISTS public.rol CASCADE;
CREATE TABLE public.rol(
	id integer NOT NULL,
	cargo varchar NOT NULL,
	CONSTRAINT pk_rol PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.rol OWNER TO postgres;
-- ddl-end --

-- object: public.cliente | type: TABLE --
-- DROP TABLE IF EXISTS public.cliente CASCADE;
CREATE TABLE public.cliente(
	id integer NOT NULL,
	nombre varchar NOT NULL,
	identificacion varchar NOT NULL,
	puntos integer NOT NULL,
	CONSTRAINT pk_cliente PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.cliente OWNER TO postgres;
-- ddl-end --

-- object: public.sede | type: TABLE --
-- DROP TABLE IF EXISTS public.sede CASCADE;
CREATE TABLE public.sede(
	id integer NOT NULL,
	nombre varchar NOT NULL,
	CONSTRAINT pk_sede PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.sede OWNER TO postgres;
-- ddl-end --

-- object: public.snack | type: TABLE --
-- DROP TABLE IF EXISTS public.snack CASCADE;
CREATE TABLE public.snack(
	id integer NOT NULL,
	nombre varchar NOT NULL,
	precio integer NOT NULL,
	CONSTRAINT pk_snack PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.snack OWNER TO postgres;
-- ddl-end --

-- object: fk_empleado_rol | type: CONSTRAINT --
-- ALTER TABLE public.empleado DROP CONSTRAINT IF EXISTS fk_empleado_rol CASCADE;
ALTER TABLE public.empleado ADD CONSTRAINT fk_empleado_rol FOREIGN KEY (rol_id)
REFERENCES public.rol (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_empleado_sede | type: CONSTRAINT --
-- ALTER TABLE public.empleado DROP CONSTRAINT IF EXISTS fk_empleado_sede CASCADE;
ALTER TABLE public.empleado ADD CONSTRAINT fk_empleado_sede FOREIGN KEY (sede_id)
REFERENCES public.sede (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


