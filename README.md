# chiens_pour_tous_bd

Gestion d'une BD relationelle avec PostgreSQL, pgAdmin et Python

## Installation

Lancez le serveur avec la commande:

```bash
docker-compose up -d
```
Vérifez que tous les conteneurs tournent avec la commande:

```bash
docker ps
```

## Usage

Accédez au CLI PostgreSQL qui s'exécute à l'intérieur du conteneur Docker avec cette commande:

```bash
docker exec -it pg_container bash
```
Se connecter à la base de données PostgreSQL

```bash
psql -h localhost -U kkherrazi dst_db
```

Vous pouvez regarder les bases de données déjà présentes avec la commande:

```bash
 \l
```

creation des BDs:

```bash
 #A executer dans la console PostgreSQL
CREATE DATABASE kkherrazi_v3;
CREATE DATABASE kkherrazi_v4;
```

Restauration des des BDs à partire de la sauvegarde :

```bash
docker exec -i pg_container psql -U kkherrazi -d kkherrazi_v4 < ./dump/kkherrazi_v4.sql
```
 
Se connecter à PostgreSQL et acceder aux bases de données :

```bash
docker exec -it pg_container bash

#Acceder à la base kkherrazi_v4
psql -h localhost -U khalid -d kkherrazi_v4

#Afficher les tables de la base kkherrazi_v4
SELECT * FROM Chiens;

#Aller dans d'autre bases 
\c kkherrazi_v3
```

## pgAdmin

Connexion [pgAdmin](http://pgadmin.org/) à Postgres

L'interface utilisateur pgAdmin est disponible à l'adresse : _vm_ip_adress:5050_


## Requêtes avec Python

Utiliser la librairie [psycopg2](https://pypi.org/project/psycopg2/) pour interagir avec les bases de données PostgreSQL.

Installer la librairie.
```bash
sudo apt-get install libpq-dev
pip install psycopg2
```
 
Lancer le script Python:
```bash
python3 graph.py 
```
