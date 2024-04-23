-- Database: desafio-Juan-Alvarez-123

-- DROP DATABASE IF EXISTS "desafio-Juan-Alvarez-123";

CREATE DATABASE "desafio-Juan-Alvarez-123"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Chile.1252'
    LC_CTYPE = 'Spanish_Chile.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE clientes (
	email varchar (50),
	nombre varchar,
	telefono varchar (16),
	empresa varchar (50),
	prioridad smallint
);

INSERT INTO clientes (email, nombre, telefono, empresa, prioridad) VALUES
('andrea@lahoguera.cl', 'Andrea Correa', '+56914725874', 'La hoguera', 4 ),
('miguel@gmail.com', 'Miguel Soto', '+56914748574', 'Miguel Soto eirl', 5 ),
('danielflores@buenasalud.cl', 'Daniel Flores', '+56914725874', 'Salud total ltda', 2 ),
('mariaTM@dental.cl', 'Maria Toro', '+56911111112', 'Sonrisas SPA', 7 ),
('irmadonoso@vet.cl', 'Irma Donoso', '+56925254168', 'Veterinaria Irma Donoso eirl', 10 );

SELECT * FROM clientes ORDER BY prioridad DESC limit 3;

SELECT * FROM clientes WHERE empresa = 'Sonrisas SPA'or empresa = 'La hoguera' ;
