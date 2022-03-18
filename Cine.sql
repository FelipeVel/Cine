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

-- object: central | type: SCHEMA --
-- DROP SCHEMA IF EXISTS central CASCADE;
CREATE SCHEMA central;
-- ddl-end --
ALTER SCHEMA central OWNER TO postgres;
-- ddl-end --

-- object: local | type: SCHEMA --
-- DROP SCHEMA IF EXISTS local CASCADE;
CREATE SCHEMA local;
-- ddl-end --
ALTER SCHEMA local OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,central,local;
-- ddl-end --

-- object: local.pelicula | type: TABLE --
-- DROP TABLE IF EXISTS local.pelicula CASCADE;
CREATE TABLE local.pelicula(
	id integer NOT NULL,
	nombre varchar NOT NULL,
	puntuacion int2 NOT NULL,
	CONSTRAINT pk_pelicula PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE local.pelicula OWNER TO postgres;
-- ddl-end --

-- object: local.funcion | type: TABLE --
-- DROP TABLE IF EXISTS local.funcion CASCADE;
CREATE TABLE local.funcion(
	id integer NOT NULL,
	pelicula_id integer NOT NULL,
	sala_id integer NOT NULL,
	CONSTRAINT pk_funcion PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE local.funcion OWNER TO postgres;
-- ddl-end --

-- object: local.sala | type: TABLE --
-- DROP TABLE IF EXISTS local.sala CASCADE;
CREATE TABLE local.sala(
	id integer NOT NULL,
	sillas_general integer NOT NULL DEFAULT 40,
	sillas_preferencial integer NOT NULL DEFAULT 20,
	sede_id integer NOT NULL,
	CONSTRAINT pk_sala PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE local.sala OWNER TO postgres;
-- ddl-end --

-- object: local.orden | type: TABLE --
-- DROP TABLE IF EXISTS local.orden CASCADE;
CREATE TABLE local.orden(
	id integer NOT NULL,
	cliente_id integer NOT NULL,
	CONSTRAINT pk_orden PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE local.orden OWNER TO postgres;
-- ddl-end --

-- object: local.boleta | type: TABLE --
-- DROP TABLE IF EXISTS local.boleta CASCADE;
CREATE TABLE local.boleta(
	id integer NOT NULL,
	orden_id integer NOT NULL,
	funcion_id integer NOT NULL,
	silla_id integer NOT NULL,
	CONSTRAINT pk_boleta PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE local.boleta OWNER TO postgres;
-- ddl-end --

-- object: central.empleado | type: TABLE --
-- DROP TABLE IF EXISTS central.empleado CASCADE;
CREATE TABLE central.empleado(
	id integer NOT NULL,
	nombre varchar NOT NULL,
	fecha_inicio date NOT NULL,
	salario integer NOT NULL,
	rol_id integer NOT NULL,
	sede_id integer NOT NULL,
	CONSTRAINT pk_empleado PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE central.empleado OWNER TO postgres;
-- ddl-end --

-- object: central.rol | type: TABLE --
-- DROP TABLE IF EXISTS central.rol CASCADE;
CREATE TABLE central.rol(
	id integer NOT NULL,
	cargo varchar NOT NULL,
	CONSTRAINT pk_rol PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE central.rol OWNER TO postgres;
-- ddl-end --

-- object: central.cliente | type: TABLE --
-- DROP TABLE IF EXISTS central.cliente CASCADE;
CREATE TABLE central.cliente(
	id integer NOT NULL,
	nombre varchar NOT NULL,
	identificacion varchar NOT NULL,
	puntos integer NOT NULL,
	CONSTRAINT pk_cliente PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE central.cliente OWNER TO postgres;
-- ddl-end --

-- object: central.sede | type: TABLE --
-- DROP TABLE IF EXISTS central.sede CASCADE;
CREATE TABLE central.sede(
	id integer NOT NULL,
	nombre varchar NOT NULL,
	CONSTRAINT pk_sede PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE central.sede OWNER TO postgres;
-- ddl-end --

-- object: local.pedidos_snacks | type: TABLE --
-- DROP TABLE IF EXISTS local.pedidos_snacks CASCADE;
CREATE TABLE local.pedidos_snacks(
	id integer NOT NULL,
	snack_id integer NOT NULL,
	orden_id integer NOT NULL,
	CONSTRAINT pk_pedidos_snacks PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE local.pedidos_snacks OWNER TO postgres;
-- ddl-end --

-- object: central.snack | type: TABLE --
-- DROP TABLE IF EXISTS central.snack CASCADE;
CREATE TABLE central.snack(
	id integer NOT NULL,
	nombre varchar NOT NULL,
	precio integer NOT NULL,
	CONSTRAINT pk_snack PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE central.snack OWNER TO postgres;
-- ddl-end --

-- object: local.silla | type: TABLE --
-- DROP TABLE IF EXISTS local.silla CASCADE;
CREATE TABLE local.silla(
	id integer NOT NULL,
	tipo varchar,
	sala_id integer NOT NULL,
	CONSTRAINT pk_silla PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE local.silla OWNER TO postgres;
-- ddl-end --

-- object: local.inventario_snacks | type: TABLE --
-- DROP TABLE IF EXISTS local.inventario_snacks CASCADE;
CREATE TABLE local.inventario_snacks(
	id integer NOT NULL,
	cantidad integer NOT NULL,
	snack_id integer NOT NULL,
	CONSTRAINT pk_inventario_snacks PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE local.inventario_snacks OWNER TO postgres;
-- ddl-end --

-- object: fk_funcion_pelicula | type: CONSTRAINT --
-- ALTER TABLE local.funcion DROP CONSTRAINT IF EXISTS fk_funcion_pelicula CASCADE;
ALTER TABLE local.funcion ADD CONSTRAINT fk_funcion_pelicula FOREIGN KEY (pelicula_id)
REFERENCES local.pelicula (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_funcion_sala | type: CONSTRAINT --
-- ALTER TABLE local.funcion DROP CONSTRAINT IF EXISTS fk_funcion_sala CASCADE;
ALTER TABLE local.funcion ADD CONSTRAINT fk_funcion_sala FOREIGN KEY (sala_id)
REFERENCES local.sala (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_sala_sede | type: CONSTRAINT --
-- ALTER TABLE local.sala DROP CONSTRAINT IF EXISTS fk_sala_sede CASCADE;
ALTER TABLE local.sala ADD CONSTRAINT fk_sala_sede FOREIGN KEY (sede_id)
REFERENCES central.sede (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_orden_cliente | type: CONSTRAINT --
-- ALTER TABLE local.orden DROP CONSTRAINT IF EXISTS fk_orden_cliente CASCADE;
ALTER TABLE local.orden ADD CONSTRAINT fk_orden_cliente FOREIGN KEY (cliente_id)
REFERENCES central.cliente (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_boleta_orden | type: CONSTRAINT --
-- ALTER TABLE local.boleta DROP CONSTRAINT IF EXISTS fk_boleta_orden CASCADE;
ALTER TABLE local.boleta ADD CONSTRAINT fk_boleta_orden FOREIGN KEY (orden_id)
REFERENCES local.orden (id) MATCH FULL
ON DELETE CASCADE ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_funcion_pelicula | type: CONSTRAINT --
-- ALTER TABLE local.boleta DROP CONSTRAINT IF EXISTS fk_funcion_pelicula CASCADE;
ALTER TABLE local.boleta ADD CONSTRAINT fk_funcion_pelicula FOREIGN KEY (funcion_id)
REFERENCES local.funcion (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_boleta_silla | type: CONSTRAINT --
-- ALTER TABLE local.boleta DROP CONSTRAINT IF EXISTS fk_boleta_silla CASCADE;
ALTER TABLE local.boleta ADD CONSTRAINT fk_boleta_silla FOREIGN KEY (silla_id)
REFERENCES local.silla (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_empleado_rol | type: CONSTRAINT --
-- ALTER TABLE central.empleado DROP CONSTRAINT IF EXISTS fk_empleado_rol CASCADE;
ALTER TABLE central.empleado ADD CONSTRAINT fk_empleado_rol FOREIGN KEY (rol_id)
REFERENCES central.rol (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_empleado_sede | type: CONSTRAINT --
-- ALTER TABLE central.empleado DROP CONSTRAINT IF EXISTS fk_empleado_sede CASCADE;
ALTER TABLE central.empleado ADD CONSTRAINT fk_empleado_sede FOREIGN KEY (sede_id)
REFERENCES central.sede (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_pedido_snack | type: CONSTRAINT --
-- ALTER TABLE local.pedidos_snacks DROP CONSTRAINT IF EXISTS fk_pedido_snack CASCADE;
ALTER TABLE local.pedidos_snacks ADD CONSTRAINT fk_pedido_snack FOREIGN KEY (snack_id)
REFERENCES central.snack (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_pedido_orden | type: CONSTRAINT --
-- ALTER TABLE local.pedidos_snacks DROP CONSTRAINT IF EXISTS fk_pedido_orden CASCADE;
ALTER TABLE local.pedidos_snacks ADD CONSTRAINT fk_pedido_orden FOREIGN KEY (orden_id)
REFERENCES local.orden (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_silla_sala | type: CONSTRAINT --
-- ALTER TABLE local.silla DROP CONSTRAINT IF EXISTS fk_silla_sala CASCADE;
ALTER TABLE local.silla ADD CONSTRAINT fk_silla_sala FOREIGN KEY (sala_id)
REFERENCES local.sala (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: fk_inventario_snack | type: CONSTRAINT --
-- ALTER TABLE local.inventario_snacks DROP CONSTRAINT IF EXISTS fk_inventario_snack CASCADE;
ALTER TABLE local.inventario_snacks ADD CONSTRAINT fk_inventario_snack FOREIGN KEY (snack_id)
REFERENCES central.snack (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


