Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]: postgres
Contraseña para usuario postgres:
psql (16.2)
ADVERTENCIA: El código de página de la consola (850) difiere del código
            de página de Windows (1252).
            Los caracteres de 8 bits pueden funcionar incorrectamente.
            Vea la página de referencia de psql «Notes for Windows users»
            para obtener más detalles.
Digite «help» para obtener ayuda.

postgres=#

postgres=# create database peliculas;
CREATE DATABASE
postgres=# create table peliculas;
ERROR:  error de sintaxis en o cerca de «;»
LÍNEA 1: create table peliculas;
                               ^

postgres=# \c peliculas;
Ahora está conectado a la base de datos «peliculas» con el usuario «postgres».
peliculas=# create table peliculas (id serial primary key, pelicula varchar (125) not null, anio_estreno varchar (4) not null, director varchar (125));
CREATE TABLE
peliculas=# select * from peliculas;
 id | pelicula | anio_estreno | director
----+----------+--------------+----------
(0 filas)

peliculas=# create table reparto (id_pelicula int references peliculas(id) not null, actor varchar (125) not null);
CREATE TABLE

peliculas=# \copy peliculas from 'D:\Altaexperticia - JavaScript\Github\Modulo 5 - Fundamentos de Bases de Datos Relacionales\Definicion de tablas\peliculas.csv' DELIMITER ',' CSV HEADER;
COPY 100
peliculas=# \copy reparto from 'D:\Altaexperticia - JavaScript\Github\Modulo 5 - Fundamentos de Bases de Datos Relacionales\Definicion de tablas\reparto.csv' DELIMITER ',' CSV HEADER;
COPY 1051
peliculas=# select * from peliculas;
 id  |                       pelicula                        | anio_estreno |       director
-----+-------------------------------------------------------+--------------+-----------------------
   1 | Forest Gump                                           | 1994         | Robert Zemeckis
   2 | Titanic                                               | 1997         | James Cameron
   3 | El Padrino                                            | 1972         | Francis Ford Coppola
   4 | Gladiator                                             | 2000         | Ridley Scott
   5 | El Se├▒or de los anillos: El retorno del rey          | 2003         | Peter Jackson
   6 | El caballero oscuro                                   | 2008         | Christopher Nolan
   7 | Cadena perpetua                                       | 1994         | Frank Darabont
   8 | Piratas del Caribe: La maldici├│n de la Perla Negra   | 2003         | Gore Verbinski
   9 | Braveheart                                            | 1995         | Mel Gibson
  10 | La lista de Schindler                                 | 1993         | Steven Spielberg
  11 | Toy Story                                             | 1995         | John Lasseter
  12 | Eduardo Manostijeras                                  | 1990         | Tim Burton
  13 | El Se├▒or de los anillos: La comunidad del anillo     | 2001         | Peter Jackson
  14 | Salvar al soldado Ryan                                | 1998         | Steven Spielberg
  15 | Regreso al futuro                                     | 1985         | Robert Zemeckis
  16 | Monstruos S.A.                                        | 2001         | Pete Docter
  17 | Buscando a Nemo                                       | 2003         | Andrew Stanton
  18 | El Se├▒or de los anillos: Las dos torres              | 2002         | Peter Jackson
  19 | Harry Potter y el Prisionero de Azkaban               | 2004         | Alfonso Cuar├│n
  20 | American History X                                    | 1998         | Tony Kaye
  21 | 300                                                   | 2007         | Zack Snyder
  22 | El sexto sentido                                      | 1999         | M. Night Shyamalan
  23 | Pulp Fiction                                          | 1994         | Quentin Tarantino
  24 | V de Vendetta                                         | 2005         | James McTeigue
  25 | El silencio de los corderos                           | 1991         | Jonathan Demme
  26 | Rocky                                                 | 1976         | John G. Avildsen
  27 | El club de la pelea                                   | 1999         | David Fincher
  28 | E.T                                                   | 1982         | Steven Spielberg
  29 | Parque Jur├ísico                                      | 1993         | Steven Spielberg
  30 | Matrix                                                | 1999         | Andy y Lana Wachowski
  31 | La milla verde                                        | 1999         | Frank Darabont
  32 | Ratatouille                                           | 2007         | Brad Bird
  33 | Grease                                                | 1978         | Randal Kleiser
  34 | El Padrino. Parte II                                  | 1974         | Francis Ford Coppola
  35 | Wall-E                                                | 2008         | Andrew Stanton
  36 | Iron Man                                              | 2008         | Jon Favreau
  37 | El exorcista                                          | 1973         | William Friedkin
  38 | Piratas del Caribe: El cofre del hombre muerto        | 2006         | Gore Verbinski
  39 | Seven                                                 | 1995         | David Fincher
  40 | Terminator 2: el juicio final                         | 1991         | James Cameron
  41 | El resplandor                                         | 1980         | Stanley Kubrick
  42 | Hombres de negro                                      | 1997         | Barry Sonnenfeld
  43 | Spider-Man                                            | 2002         | Sam Raimi
  44 | Regreso al futuro II                                  | 1989         | Robert Zemeckis
  45 | El show de Truman                                     | 1998         | Peter Weir
Petición de cancelación enviada
peliculas=# select * from reparto;
 id_pelicula |            actor
-------------+-----------------------------
           1 | Tom Hanks
           1 | Robin Wright Penn
           1 | Gary Sinise
           1 | Mykelti Williamson
           1 | Sally Field
           1 | Rebecca Williams
           1 | Michael Conner Humphreys
           1 | Harold G. Herthum
           1 | Haley Joel Osment
           1 | George Kelly
           1 | Bob Penny
           1 | John Randall
           1 | Sam Anderson
           1 | Margo Moorer
           1 | Ione M. Telech
           1 | Christine Seabrook
           2 | Leonardo DiCaprio
           2 | Kate Winslet
           2 | Billy Zane
           2 | Kathy Bates
           2 | Frances Fisher
           2 | Bernard Hill
           2 | Jonathan Hyde
           2 | Danny Nucci
           2 | David Warner
           2 | Bill Paxton
           2 | Gloria Stuart
^CPetición de cancelación enviada

peliculas=# select id from peliculas where pelicula = 'Titanic';
 id
----
  2
(1 fila)


peliculas=# select actor from reparto where id_pelicula = 2;
       actor
-------------------
 Leonardo DiCaprio
 Kate Winslet
 Billy Zane
 Kathy Bates
 Frances Fisher
 Bernard Hill
 Jonathan Hyde
 Danny Nucci
 David Warner
 Bill Paxton
 Gloria Stuart
 Victor Garber
 Suzy Amis
(13 filas)


peliculas=# select count(*) from reparto where actor = 'Harrison Ford';
 count
-------
     8
(1 fila)


peliculas=# select * from peliculas where anio_estreno between 1990 and 1999 order by pelicula asc;
ERROR:  el operador no existe: character varying >= integer
LÍNEA 1: select * from peliculas where anio_estreno between 1990 and ...
                                                    ^
SUGERENCIA:  Ningún operador coincide en el nombre y tipos de argumentos. Puede ser necesario agregar conversión explícita de tipos.
peliculas=# alter table peliculas column anio_estreno type int;
ERROR:  error de sintaxis en o cerca de «column»
LÍNEA 1: alter table peliculas column anio_estreno type int;
                               ^
peliculas=# alter table peliculas alter column anio_estreno type integer using anio_estreno::integer;
ALTER TABLE

peliculas=# select * from peliculas where anio_estreno between 1990 and 1999 order by pelicula asc;
 id |                  pelicula                  | anio_estreno |       director
----+--------------------------------------------+--------------+-----------------------
 76 | American Beauty                            |         1999 | Sam Mendes
 20 | American History X                         |         1998 | Tony Kaye
  9 | Braveheart                                 |         1995 | Mel Gibson
  7 | Cadena perpetua                            |         1994 | Frank Darabont
 12 | Eduardo Manostijeras                       |         1990 | Tim Burton
 27 | El club de la pelea                        |         1999 | David Fincher
 68 | El Padrino. Parte III                      |         1990 | Francis Ford Coppola
 75 | El profesional                             |         1994 | Luc Besson
 22 | El sexto sentido                           |         1999 | M. Night Shyamalan
 45 | El show de Truman                          |         1998 | Peter Weir
 25 | El silencio de los corderos                |         1991 | Jonathan Demme
 61 | Entrevista con el vampiro                  |         1994 | Neil Jordan
  1 | Forest Gump                                |         1994 | Robert Zemeckis
 42 | Hombres de negro                           |         1997 | Barry Sonnenfeld
 10 | La lista de Schindler                      |         1993 | Steven Spielberg
 31 | La milla verde                             |         1999 | Frank Darabont
 30 | Matrix                                     |         1999 | Andy y Lana Wachowski
 89 | Mejor... imposible                         |         1997 | James L. Brooks
 29 | Parque Jur├ísico                           |         1993 | Steven Spielberg
 47 | Pesadilla antes de navidad                 |         1993 | Henry Selick
 23 | Pulp Fiction                               |         1994 | Quentin Tarantino
 14 | Salvar al soldado Ryan                     |         1998 | Steven Spielberg
 39 | Seven                                      |         1995 | David Fincher
 86 | Star Wars. Episodio I: La amenaza fantasma |         1999 | George Lucas
 40 | Terminator 2: el juicio final              |         1991 | James Cameron
  2 | Titanic                                    |         1997 | James Cameron
 11 | Toy Story                                  |         1995 | John Lasseter
 46 | Toy Story 2                                |         1999 | John Lasseter
 79 | Trainspotting                              |         1996 | Danny Boyle
 98 | Uno de los nuestros                        |         1990 | Martin Scorsese
(30 filas)

peliculas=#
peliculas=# select pelicula, length(pelicula) as longitud_titulo from peliculas;
                       pelicula                        | longitud_titulo
-------------------------------------------------------+-----------------
 Forest Gump                                           |              11
 Titanic                                               |               7
 El Padrino                                            |              10
 Gladiator                                             |               9
 El Se├▒or de los anillos: El retorno del rey          |              44
 El caballero oscuro                                   |              19
 Cadena perpetua                                       |              15
 Piratas del Caribe: La maldici├│n de la Perla Negra   |              51
 Braveheart                                            |              10
 La lista de Schindler                                 |              21
 Toy Story                                             |               9
 Eduardo Manostijeras                                  |              20
 El Se├▒or de los anillos: La comunidad del anillo     |              49
 Salvar al soldado Ryan                                |              22
 Regreso al futuro                                     |              17
 Monstruos S.A.                                        |              14
 Buscando a Nemo                                       |              15
 El Se├▒or de los anillos: Las dos torres              |              40
 Harry Potter y el Prisionero de Azkaban               |              39
 American History X                                    |              18
 300                                                   |               3
 El sexto sentido                                      |              16
 Pulp Fiction                                          |              12
 V de Vendetta                                         |              13
 El silencio de los corderos                           |              27
 Rocky                                                 |               5
 El club de la pelea                                   |              19
 E.T                                                   |               3
 Parque Jur├ísico                                      |              16
 Matrix                                                |               6
 La milla verde                                        |              14
 Ratatouille                                           |              11
 Grease                                                |               6
 El Padrino. Parte II                                  |              20
 Wall-E                                                |               6
 Iron Man                                              |               8
 El exorcista                                          |              12
 Piratas del Caribe: El cofre del hombre muerto        |              46
 Seven                                                 |               5
 Terminator 2: el juicio final                         |              29
 El resplandor                                         |              13
 Hombres de negro                                      |              16
 Spider-Man                                            |              10
 Regreso al futuro II                                  |              20
 El show de Truman                                     |              17
 Toy Story 2                                           |              11
 Pesadilla antes de navidad                            |              26
 Star Wars. Episodio IV: Una nueva esperanza           |              43
 Saw                                                   |               3
 Terminator                                            |              10
 Kill Bill Vol. 1                                      |              16
 Lo que el viento se llev├│                            |              26
 El Laberinto del Fauno                                |              22
 Los incre├¡bles                                       |              15
 El viaje de Chihiro                                   |              19
 El precio del poder                                   |              19
 King Kong                                             |               9
 Ben-Hur                                               |               7
 Indiana Jones y la ├║ltima cruzada                    |              34
 Infiltrados                                           |              11
 Entrevista con el vampiro                             |              25
 Batman Begins                                         |              13
 En busca del arca perdida                             |              25
 Star Wars. Episodio III: La venganza de los Sith      |              48
 Alien                                                 |               5
 El bueno el feo y el malo                             |              25
 Star Wars. Episodio V: El imperio contraataca         |              45
 El Padrino. Parte III                                 |              21
 Star Wars. Episodio VI: El retorno del Jedi           |              43
 Escuela de Rock                                       |              15
 El planeta de los simios                              |              24
 Rambo                                                 |               5
 Full Metal Jacket                                     |              17
 Tibur├│n                                              |               8
 El profesional                                        |              14
 American Beauty                                       |              15
 Casablanca                                            |              10
 Am├®lie                                               |               7
 Trainspotting                                         |              13
 axi driver                                            |              10
 Alguien vol├│ sobre el nido del cuco                  |              36
 Kill Bill Vol. 2                                      |              16
 Spider-Man 2                                          |              12
 X-Men 2                                               |               7
 Transformers                                          |              12
 Star Wars. Episodio I: La amenaza fantasma            |              42
 Blade Runner                                          |              12
 Apocalypse Now                                        |              14
 Mejor... imposible                                    |              18
 La vida de Brian                                      |              16
 El libro de la selva                                  |              20
 Los cazafantasmas                                     |              17
 Sweeney Todd: El barbero diab├│lico de la calle Fleet |              53
 Ocean's Eleven                                        |              14
 Blancanieves y los siete enanitos                     |              33
 Predator                                              |               8
 Indiana Jones y el templo maldito                     |              33
 Uno de los nuestros                                   |              19
 Mouling Rouge                                         |              13
 Psicosis                                              |               8
(100 filas)

peliculas=# select pelicula, length(peliculas.pelicula) as longitud_titulo from peliculas order by longitud_titulo desc limit 1;
                       pelicula                        | longitud_titulo
-------------------------------------------------------+-----------------
 Sweeney Todd: El barbero diab├│lico de la calle Fleet |              53
(1 fila)

peliculas=#