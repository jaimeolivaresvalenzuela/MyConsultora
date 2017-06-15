-- Database: consultora

-- DROP DATABASE consultora;

CREATE DATABASE consultora
    WITH 
    OWNER = jaimeolivares
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Chile.1252'
    LC_CTYPE = 'Spanish_Chile.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	
-- Table: public.cliente

-- DROP TABLE public.cliente;

CREATE TABLE public.cliente
(
    cliid integer NOT NULL DEFAULT nextval('cliente_id'::regclass),
    clinombre character(50) COLLATE pg_catalog."default",
    clirazonsocial character(50) COLLATE pg_catalog."default",
    clidireccion character(50) COLLATE pg_catalog."default",
    clirut numeric,
    clidv character(1) COLLATE pg_catalog."default",
    cliestado character(20) COLLATE pg_catalog."default",
    clifechacreacion date,
    CONSTRAINT pk_cliente PRIMARY KEY (cliid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.cliente
    OWNER to jaimeolivares;

-- Index: cliente_pk

-- DROP INDEX public.cliente_pk;

CREATE UNIQUE INDEX cliente_pk
    ON public.cliente USING btree
    (cliid)
    TABLESPACE pg_default;
	
	
-- Table: public.comentario

-- DROP TABLE public.comentario;

CREATE TABLE public.comentario
(
    comid integer NOT NULL DEFAULT nextval('comentario_id'::regclass),
    ettaid integer,
    proid integer,
    pretid integer,
    comcomentario text COLLATE pg_catalog."default",
    comestado character(20) COLLATE pg_catalog."default",
    comfechacreacion date,
    CONSTRAINT pk_comentario PRIMARY KEY (comid),
    CONSTRAINT fk_comentar_relations_etapatar FOREIGN KEY (ettaid)
        REFERENCES public.etapatarea (ettaid) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT fk_comentar_relations_proyecto FOREIGN KEY (pretid)
        REFERENCES public.proyectoetapa (pretid) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.comentario
    OWNER to jaimeolivares;

-- Index: comentario_pk

-- DROP INDEX public.comentario_pk;

CREATE UNIQUE INDEX comentario_pk
    ON public.comentario USING btree
    (comid)
    TABLESPACE pg_default;

-- Index: relationship_20_fk

-- DROP INDEX public.relationship_20_fk;

CREATE INDEX relationship_20_fk
    ON public.comentario USING btree
    (ettaid)
    TABLESPACE pg_default;

-- Index: relationship_21_fk

-- DROP INDEX public.relationship_21_fk;

CREATE INDEX relationship_21_fk
    ON public.comentario USING btree
    (pretid)
    TABLESPACE pg_default;

-- Index: relationship_22_fk

-- DROP INDEX public.relationship_22_fk;

CREATE INDEX relationship_22_fk
    ON public.comentario USING btree
    (proid)
    TABLESPACE pg_default;
	
-- Table: public.contacto

-- DROP TABLE public.contacto;

CREATE TABLE public.contacto
(
    conid integer NOT NULL DEFAULT nextval('contacto_id'::regclass),
    cliid integer,
    connombre character(30) COLLATE pg_catalog."default",
    conapellidopaterno character(30) COLLATE pg_catalog."default",
    conapellidomaterno character(30) COLLATE pg_catalog."default",
    concargo character(30) COLLATE pg_catalog."default",
    contelefono numeric,
    conmail character(30) COLLATE pg_catalog."default",
    conestado character(20) COLLATE pg_catalog."default",
    confechacreacion date,
    CONSTRAINT pk_contacto PRIMARY KEY (conid),
    CONSTRAINT fk_contacto_relations_cliente FOREIGN KEY (cliid)
        REFERENCES public.cliente (cliid) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.contacto
    OWNER to jaimeolivares;

-- Index: contacto_pk

-- DROP INDEX public.contacto_pk;

CREATE UNIQUE INDEX contacto_pk
    ON public.contacto USING btree
    (conid)
    TABLESPACE pg_default;

-- Index: relationship_13_fk

-- DROP INDEX public.relationship_13_fk;

CREATE INDEX relationship_13_fk
    ON public.contacto USING btree
    (cliid)
    TABLESPACE pg_default;
	
	
-- Table: public.cuentum

-- DROP TABLE public.cuentum;

CREATE TABLE public.cuentum
(
    cueid integer NOT NULL DEFAULT nextval('cuenta_id'::regclass),
    ropeid integer,
    cliid integer,
    cuenombre character(30) COLLATE pg_catalog."default",
    cueestado character(20) COLLATE pg_catalog."default",
    cuefechacreacion date,
    CONSTRAINT pk_cuenta PRIMARY KEY (cueid),
    CONSTRAINT fk_cuenta_relations_cliente FOREIGN KEY (cliid)
        REFERENCES public.cliente (cliid) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT fk_cuenta_relations_rolperso FOREIGN KEY (ropeid)
        REFERENCES public.rolpersona (ropeid) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.cuentum
    OWNER to jaimeolivares;

-- Index: cuenta_pk

-- DROP INDEX public.cuenta_pk;

CREATE UNIQUE INDEX cuenta_pk
    ON public.cuentum USING btree
    (cueid)
    TABLESPACE pg_default;

-- Index: relationship_17_fk

-- DROP INDEX public.relationship_17_fk;

CREATE INDEX relationship_17_fk
    ON public.cuentum USING btree
    (ropeid)
    TABLESPACE pg_default;

-- Index: relationship_5_fk

-- DROP INDEX public.relationship_5_fk;

CREATE INDEX relationship_5_fk
    ON public.cuentum USING btree
    (cliid)
    TABLESPACE pg_default;
	
	
-- Table: public.etapa

-- DROP TABLE public.etapa;

CREATE TABLE public.etapa
(
    etaid integer NOT NULL DEFAULT nextval('etapa_id'::regclass),
    etanombre character(30) COLLATE pg_catalog."default",
    etaestado character(20) COLLATE pg_catalog."default",
    etafechacreacion date,
    CONSTRAINT pk_etapa PRIMARY KEY (etaid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.etapa
    OWNER to jaimeolivares;

-- Index: etapa_pk

-- DROP INDEX public.etapa_pk;

CREATE UNIQUE INDEX etapa_pk
    ON public.etapa USING btree
    (etaid)
    TABLESPACE pg_default;
	
	
-- Table: public.etapatarea

-- DROP TABLE public.etapatarea;

CREATE TABLE public.etapatarea
(
    ettaid integer NOT NULL DEFAULT nextval('etapatarea_id'::regclass),
    pretid integer,
    tarid integer,
    ropeid integer,
    ettaestado character(20) COLLATE pg_catalog."default",
    ettafechacreacion date,
    ettadescripcion text COLLATE pg_catalog."default",
    CONSTRAINT pk_etapatarea PRIMARY KEY (ettaid),
    CONSTRAINT fk_etapatar_relations_proyecto FOREIGN KEY (pretid)
        REFERENCES public.proyectoetapa (pretid) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT fk_etapatar_relations_rolperso FOREIGN KEY (ropeid)
        REFERENCES public.rolpersona (ropeid) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT fk_etapatar_relations_tarea FOREIGN KEY (tarid)
        REFERENCES public.tarea (tarid) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.etapatarea
    OWNER to jaimeolivares;

-- Index: etapatarea_pk

-- DROP INDEX public.etapatarea_pk;

CREATE UNIQUE INDEX etapatarea_pk
    ON public.etapatarea USING btree
    (ettaid)
    TABLESPACE pg_default;

-- Index: relationship_10_fk

-- DROP INDEX public.relationship_10_fk;

CREATE INDEX relationship_10_fk
    ON public.etapatarea USING btree
    (tarid)
    TABLESPACE pg_default;

-- Index: relationship_16_fk

-- DROP INDEX public.relationship_16_fk;

CREATE INDEX relationship_16_fk
    ON public.etapatarea USING btree
    (ropeid)
    TABLESPACE pg_default;

-- Index: relationship_9_fk

-- DROP INDEX public.relationship_9_fk;

CREATE INDEX relationship_9_fk
    ON public.etapatarea USING btree
    (pretid)
    TABLESPACE pg_default;
	
	
-- Table: public.persona

-- DROP TABLE public.persona;

CREATE TABLE public.persona
(
    perid integer NOT NULL DEFAULT nextval('persona_id'::regclass),
    perrut numeric(10),
    perdv character(1) COLLATE pg_catalog."default",
    pernombre character(50) COLLATE pg_catalog."default",
    perapellidopaterno character(50) COLLATE pg_catalog."default",
    perapellidomaterno character(50) COLLATE pg_catalog."default",
    perfechanacimiento date,
    perfechaingreso date,
    perestado character(20) COLLATE pg_catalog."default",
    perfechacreacion date,
    percargo character(50) COLLATE pg_catalog."default",
    CONSTRAINT pk_persona PRIMARY KEY (perid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.persona
    OWNER to jaimeolivares;

-- Index: persona_pk

-- DROP INDEX public.persona_pk;

CREATE UNIQUE INDEX persona_pk
    ON public.persona USING btree
    (perid)
    TABLESPACE pg_default;
	
	
-- Table: public.proyecto

-- DROP TABLE public.proyecto;

CREATE TABLE public.proyecto
(
    proid integer NOT NULL DEFAULT nextval('proyecto_id'::regclass),
    ropeid integer,
    cueid integer,
    pronombre character(50) COLLATE pg_catalog."default",
    proestado character(20) COLLATE pg_catalog."default",
    profechacreacion date,
    prodescripcion text COLLATE pg_catalog."default",
    CONSTRAINT pk_proyecto PRIMARY KEY (proid),
    CONSTRAINT fk_proyecto_relations_cuenta FOREIGN KEY (cueid)
        REFERENCES public.cuentum (cueid) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT fk_proyecto_relations_rolperso FOREIGN KEY (ropeid)
        REFERENCES public.rolpersona (ropeid) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.proyecto
    OWNER to jaimeolivares;

-- Index: proyecto_pk

-- DROP INDEX public.proyecto_pk;

CREATE UNIQUE INDEX proyecto_pk
    ON public.proyecto USING btree
    (proid)
    TABLESPACE pg_default;

-- Index: relationship_14_fk

-- DROP INDEX public.relationship_14_fk;

CREATE INDEX relationship_14_fk
    ON public.proyecto USING btree
    (ropeid)
    TABLESPACE pg_default;

-- Index: relationship_6_fk

-- DROP INDEX public.relationship_6_fk;

CREATE INDEX relationship_6_fk
    ON public.proyecto USING btree
    (cueid)
    TABLESPACE pg_default;
	
	
-- Table: public.proyectoetapa

-- DROP TABLE public.proyectoetapa;

CREATE TABLE public.proyectoetapa
(
    pretid integer NOT NULL DEFAULT nextval('proyectoetapa_id'::regclass),
    etaid integer,
    ropeid integer,
    proid integer,
    pretestado character(20) COLLATE pg_catalog."default",
    pretfechacreacion date,
    pretdescripcion text COLLATE pg_catalog."default",
    CONSTRAINT pk_proyectoetapa PRIMARY KEY (pretid),
    CONSTRAINT fk_proyecto_relations_etapa FOREIGN KEY (etaid)
        REFERENCES public.etapa (etaid) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT fk_proyecto_relations_proyecto FOREIGN KEY (proid)
        REFERENCES public.proyecto (proid) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT fk_proyecto_relations_rolperso FOREIGN KEY (ropeid)
        REFERENCES public.rolpersona (ropeid) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.proyectoetapa
    OWNER to jaimeolivares;

-- Index: proyectoetapa_pk

-- DROP INDEX public.proyectoetapa_pk;

CREATE UNIQUE INDEX proyectoetapa_pk
    ON public.proyectoetapa USING btree
    (pretid)
    TABLESPACE pg_default;

-- Index: relationship_15_fk

-- DROP INDEX public.relationship_15_fk;

CREATE INDEX relationship_15_fk
    ON public.proyectoetapa USING btree
    (ropeid)
    TABLESPACE pg_default;

-- Index: relationship_7_fk

-- DROP INDEX public.relationship_7_fk;

CREATE INDEX relationship_7_fk
    ON public.proyectoetapa USING btree
    (etaid)
    TABLESPACE pg_default;

-- Index: relationship_8_fk

-- DROP INDEX public.relationship_8_fk;

CREATE INDEX relationship_8_fk
    ON public.proyectoetapa USING btree
    (proid)
    TABLESPACE pg_default;
	
	
-- Table: public.rol

-- DROP TABLE public.rol;

CREATE TABLE public.rol
(
    rolid integer NOT NULL DEFAULT nextval('rol_id'::regclass),
    rolnombre character(30) COLLATE pg_catalog."default",
    rolestado character(20) COLLATE pg_catalog."default",
    rolfechacreacion date,
    CONSTRAINT pk_rol PRIMARY KEY (rolid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.rol
    OWNER to jaimeolivares;

-- Index: rol_pk

-- DROP INDEX public.rol_pk;

CREATE UNIQUE INDEX rol_pk
    ON public.rol USING btree
    (rolid)
    TABLESPACE pg_default;
	
	
-- Table: public.rolpersona

-- DROP TABLE public.rolpersona;

CREATE TABLE public.rolpersona
(
    ropeid integer NOT NULL DEFAULT nextval('rolpersona_id'::regclass),
    perid integer,
    rolid integer,
    ropeestado character(20) COLLATE pg_catalog."default",
    ropefechacreacion date,
    ropedescripcion text COLLATE pg_catalog."default",
    CONSTRAINT pk_rolpersona PRIMARY KEY (ropeid),
    CONSTRAINT fk_rolperso_relations_persona FOREIGN KEY (perid)
        REFERENCES public.persona (perid) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,
    CONSTRAINT fk_rolperso_relations_rol FOREIGN KEY (rolid)
        REFERENCES public.rol (rolid) MATCH SIMPLE
        ON UPDATE RESTRICT
        ON DELETE RESTRICT
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.rolpersona
    OWNER to jaimeolivares;

-- Index: relationship_11_fk

-- DROP INDEX public.relationship_11_fk;

CREATE INDEX relationship_11_fk
    ON public.rolpersona USING btree
    (rolid)
    TABLESPACE pg_default;

-- Index: relationship_12_fk

-- DROP INDEX public.relationship_12_fk;

CREATE INDEX relationship_12_fk
    ON public.rolpersona USING btree
    (perid)
    TABLESPACE pg_default;

-- Index: rolpersona_pk

-- DROP INDEX public.rolpersona_pk;

CREATE UNIQUE INDEX rolpersona_pk
    ON public.rolpersona USING btree
    (ropeid)
    TABLESPACE pg_default;
	
	
-- Table: public.schema_migrations

-- DROP TABLE public.schema_migrations;

CREATE TABLE public.schema_migrations
(
    version character varying COLLATE pg_catalog."default" NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.schema_migrations
    OWNER to jaimeolivares;

-- Index: unique_schema_migrations

-- DROP INDEX public.unique_schema_migrations;

CREATE UNIQUE INDEX unique_schema_migrations
    ON public.schema_migrations USING btree
    (version COLLATE pg_catalog."default")
    TABLESPACE pg_default;
	
	
-- Table: public.tarea

-- DROP TABLE public.tarea;

CREATE TABLE public.tarea
(
    tarid integer NOT NULL DEFAULT nextval('tarea_id'::regclass),
    tarnombre character(30) COLLATE pg_catalog."default",
    tarestado character(20) COLLATE pg_catalog."default",
    tarfechacreacion date,
    CONSTRAINT pk_tarea PRIMARY KEY (tarid)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.tarea
    OWNER to jaimeolivares;

-- Index: tarea_pk

-- DROP INDEX public.tarea_pk;

CREATE UNIQUE INDEX tarea_pk
    ON public.tarea USING btree
    (tarid)
    TABLESPACE pg_default;
	
	
	
CREATE SEQUENCE public.cliente_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9999999999
    CACHE 1;

ALTER SEQUENCE public.cliente_id
    OWNER TO postgres;
	
	
CREATE SEQUENCE public.comentario_id
    INCREMENT 1
    START 7
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.comentario_id
    OWNER TO postgres;
	
	
CREATE SEQUENCE public.contacto_id
    INCREMENT 1
    START 4
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.contacto_id
    OWNER TO postgres;
	
	
CREATE SEQUENCE public.cuenta_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.cuenta_id
    OWNER TO postgres;
	
	
CREATE SEQUENCE public.etapa_id
    INCREMENT 1
    START 4
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.etapa_id
    OWNER TO postgres;
	
	
CREATE SEQUENCE public.etapatarea_id
    INCREMENT 1
    START 6
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.etapatarea_id
    OWNER TO postgres;
	
	
CREATE SEQUENCE public.persona_id
    INCREMENT 1
    START 3
    MINVALUE 1
    MAXVALUE 999999999999
    CACHE 1;

ALTER SEQUENCE public.persona_id
    OWNER TO jaimeolivares;
	
	
CREATE SEQUENCE public.proyecto_id
    INCREMENT 1
    START 2
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.proyecto_id
    OWNER TO postgres;
	
	
CREATE SEQUENCE public.proyectoetapa_id
    INCREMENT 1
    START 6
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.proyectoetapa_id
    OWNER TO postgres;
	
	
CREATE SEQUENCE public.rol_id
    INCREMENT 1
    START 5
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.rol_id
    OWNER TO postgres;
	
	
CREATE SEQUENCE public.rolpersona_id
    INCREMENT 1
    START 2
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.rolpersona_id
    OWNER TO postgres;
	
	
CREATE SEQUENCE public.tarea_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.tarea_id
    OWNER TO postgres;
	
	