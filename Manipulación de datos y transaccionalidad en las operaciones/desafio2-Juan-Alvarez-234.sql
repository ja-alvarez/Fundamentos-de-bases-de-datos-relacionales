-- Database: desafio2-Juan-Alvarez-234

-- DROP DATABASE IF EXISTS "desafio2-Juan-Alvarez-234";

CREATE DATABASE "desafio2-Juan-Alvarez-234"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Chile.1252'
    LC_CTYPE = 'Spanish_Chile.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );

-- ¿Cuántos registros hay?
SELECT COUNT(*) AS total_registro FROM inscritos;

-- ¿Cuántos inscritos hay en total?
SELECT SUM (cantidad) AS total_inscritos FROM inscritos;

-- ¿Cuál o cuáles son los registros de mayor antigüedad?
SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) FROM inscritos);

-- ¿Cuántos inscritos hay por día? 
SELECT fecha, SUM (cantidad) AS inscritos_por_dia FROM inscritos GROUP BY fecha ORDER BY fecha;

-- ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?
SELECT fecha, SUM(cantidad) AS inscritos_por_dia FROM inscritos 
GROUP BY fecha ORDER BY SUM(cantidad) DESC LIMIT 1;