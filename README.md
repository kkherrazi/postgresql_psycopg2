# chiens_pour_tous_bd

Gestion d'une BD avec PostgPostgreSQL et pgAdmin. 

## Installation

Lancer le serveur:

```bash
pdocker-compose up -d
```
Vérifer que tous les conteneurs tournent:

```bash
docker ps
```

## Usage

Accéder au CLI PostgreSQL qui s'exécute à l'intérieur du conteneur Docker:

```bash
docker exec -it pg_container bash
```
Se connecter à la base de données PostgreSQL

```bash
psql -h localhost -U kkherrazi dst_db
```

Consulter les bases de données déjà présentes avec la commande:

```bash
 \l
```

Créer des BDs:

```bash
 #A executer dans la console PostgreSQL
CREATE DATABASE kkherrazi_v1;
CREATE DATABASE kkherrazi_v2;
CREATE DATABASE kkherrazi_v3;
CREATE DATABASE kkherrazi_v4;
```

Restaurer des des BDs à partire des sauvegarde :

```bash
docker exec -i pg_container psql -U kkherrazi -d chenil_v1 < ./dump/kkherrazi_v1.sql
docker exec -i pg_container psql -U kkherrazi -d chenil_v2 < ./dump/kkherrazi_v2.sql
docker exec -i pg_container psql -U kkherrazi -d chenil_v3 < ./dump/kkherrazi_v3.sql
docker exec -i pg_container psql -U kkherrazi -d chenil_v4 < ./dump/kkherrazi_v4.sql
```
 
 Se connecter à PostgreSQL et acceder aux bases de données :

```bash
docker exec -it pg_container bash

#Acceder à la base kkherrazi_v1
psql -h localhost -U khalid -d kkherrazi_v1

#Afficher les tables de la base kkherrazi_v1
SELECT * FROM Chiens;

#Aller dans autre base 
\c kkherrazi_v2
```

Connecter pgAdmin à Postgres

Acceder à pgAdmin via le navigateur à l'adresse : _vm_ip_adress:5050_

 
## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)