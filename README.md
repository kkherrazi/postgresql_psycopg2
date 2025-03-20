# SQL exemples (PostgresSQL, Psycopg et pgAdmin )

Exemples d'implementations de BD relationelle avec PostgreSQL et [pgAdmin](https://www.pgadmin.org/) avec utilisation de la librairie Python [Psycopg2](https://pypi.org/project/psycopg2/) pour interagir avec les bases de données PostgreSQL.

## Installation

Lancer le serveur avec la commande:

```bash
docker-compose up -d
```
Vérifer que tous les conteneurs tournent avec la commande:

```bash
docker ps
```
 
Installer la librairie _psycopg_: 

```bash
sudo apt-get install libpq-dev
pip install psycopg2
```

## Usage

Accéder au CLI PostgreSQL qui s'exécute à l'intérieur du conteneur Docker avec cette commande:

```bash
docker exec -it pg_container bash
```
Se connecter à la base de données PostgreSQL

```bash
psql -h localhost -U kkherrazi kkherrazi_db
```

```bash
 \l
```

Créer les base de données:

```bash
 #A executer dans la console PostgreSQL
DROP DATBASE IF EXISTS kkherrazi_db_v1;
CREATE DATABASE -U khalid kkherrazi_db_v1;
```

Restaurer les base de donnée à partire d'une sauvegarde :

```bash
docker exec -i pg_container psql -U kkherrazi -d kkherrazi_db < ./dump/kkherrazi_db.sql
```
 
Se connecter à PostgreSQL et accéder aux bases de données :

```bash
docker exec -it pg_container bash

#Acceder à la base kkherrazi_v4
psql -h localhost -U khalid -d kkherrazi_db

#Lister les utilisateu: 
\du

#Lister les base données disponibles: 
\l

#Aller dans d'autre bases: 
\c kkherrazi_db_v1

#Afficher les table Chienss qui constituent cette base de données 
\dt

#Afficher la description d'une table : 
\d+ nom_table;

#Et afficher le contenu d'une table : 
SELECT * FROM nom_table;

#quiter la base: 
\q
```

Effectuer une sauvegarde de la base de données, en utilisant l'utilitaire [pg_dump](https://www.postgresql.org/docs/current/app-pgdump.html):

```bash
pg_dump -U kkherrazi -d kkherrazi_db_v2 -f kkherrazi_db_backup.sql
```

Effectuer une sauvegarde de toutes les bases disponibles sur Postgres, en utilisant l'utilitaire [pg_dumpall](hhttps://docs.postgresql.fr/12/app-pg-dumpall.html):

```bash
pg_dumpall -U kkherrazi -f backup_all.sql

```
Taper _ls_ dans le même shell pour voir le fichier backup dans le conteneur. Pour l'extraire dans la machine virtuelle il faut utiliser la commande Docker _cp_ :

```bash
docker cp pg_container:backup_all.sql .dump/

```

Il est possible aussi de restaurer une base de données en utilisant la commande (psgl)[https://docs.postgresql.fr/13/app-psql.html] depuis le CLI PostgresSQL : 

```bash
createdb -U kkherrazi new_db_v4
psql -U khalid -d new_db_v4 -f backup_db_v4.sql
```

## pgAdmin

Connexion [pgAdmin](http://pgadmin.org/) à Postgres

L'interface utilisateur pgAdmin est disponible à l'adresse : _vm_ip_adress:5050_


## Requêter avec Python

La librairie [Psycopg2](https://pypi.org/project/psycopg2/) permet d'interagir avec les bases de données PostgreSQL.

Lancer le script Python:
```bash
python3 pokemon.py 
```
