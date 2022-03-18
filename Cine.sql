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

-- object: fk_funcion_pelicula | type: CONSTRAINT --
-- ALTER TABLE public.funcion DROP CONSTRAINT IF EXISTS fk_funcion_pelicula CASCADE;
ALTER TABLE public.funcion ADD CONSTRAINT fk_funcion_pelicula FOREIGN KEY (pelicula_id)
REFERENCES public.pelicula (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_funcion_sala | type: CONSTRAINT --
-- ALTER TABLE public.funcion DROP CONSTRAINT IF EXISTS fk_funcion_sala CASCADE;
ALTER TABLE public.funcion ADD CONSTRAINT fk_funcion_sala FOREIGN KEY (sala_id)
REFERENCES public.sala (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_sala_sede | type: CONSTRAINT --
-- ALTER TABLE public.sala DROP CONSTRAINT IF EXISTS fk_sala_sede CASCADE;
ALTER TABLE public.sala ADD CONSTRAINT fk_sala_sede FOREIGN KEY (sede_id)
REFERENCES public.sede (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_orden_cliente | type: CONSTRAINT --
-- ALTER TABLE public.orden DROP CONSTRAINT IF EXISTS fk_orden_cliente CASCADE;
ALTER TABLE public.orden ADD CONSTRAINT fk_orden_cliente FOREIGN KEY (cliente_id)
REFERENCES public.cliente (id) MATCH FULL
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

-- object: fk_pedido_snack | type: CONSTRAINT --
-- ALTER TABLE public.pedidos_snacks DROP CONSTRAINT IF EXISTS fk_pedido_snack CASCADE;
ALTER TABLE public.pedidos_snacks ADD CONSTRAINT fk_pedido_snack FOREIGN KEY (snack_id)
REFERENCES public.snack (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_pedido_orden | type: CONSTRAINT --
-- ALTER TABLE public.pedidos_snacks DROP CONSTRAINT IF EXISTS fk_pedido_orden CASCADE;
ALTER TABLE public.pedidos_snacks ADD CONSTRAINT fk_pedido_orden FOREIGN KEY (orden_id)
REFERENCES public.orden (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


