import psycopg2

HOST="34.244.154.112"

conn = psycopg2.connect(database="pokemon_db",
                        host=HOST,
                        user="kkherrazi",
                        password="khalid",
                        port="5432")


def rexecuteRequest(title, request, fetch_response= True):
    
    print(title)
    print("\nRequest:\n"+request)
       
    cur = conn.cursor()
    cur.execute(request)

    if fetch_response :
        print("\nResultat:")
        rows = cur.fetchall()
        for row in rows:
            print(row)
    cur.close()
    print("\n-------------------------------------")


#Requete 1
TITLE="OBJECIF 1: Compter le nombre de Pokémon par type dans l'ordre décroissant."
REQUEST = "SELECT T.name_type AS Tape, COUNT(*) FROM PokemonType P INNER JOIN Types T  USING(type_id) GROUP BY T.type_id ORDER BY count(*) DESC ;"
rexecuteRequest(TITLE, REQUEST) 


#Requete 2 ------------------
TITLE="OBJECIF 2: Lister les Pokémon avec un nombre de base de points supérieur à 600, triés de manière décroissante"
REQUEST = "SELECT name, base_total FROM Pokemon WHERE  base_total > 600 ORDER BY base_total DESC ;"
rexecuteRequest(TITLE, REQUEST)  


#Requete 3 ------------------
TITLE="OBJECIF 3: Afficher les types de Pokémon avec la base de points moyenne dans l'ordre croissant"
REQUEST = "SELECT T.name_type, AVG(P.base_total) FROM PokemonType PT JOIN Types T USING(type_id) JOIN Pokemon P USING(pokedex_number) GROUP BY T.type_id ORDER BY AVG(P.base_total);"
print(TITLE)
print(REQUEST)
rexecuteRequest(TITLE, REQUEST)  
 

#Requete 4 ------------------
TITLE="OBJECIF 4: Trouver les Pokémon qui ont la capacité spéciale 'Overgrow' et trier par la base de points dans un ordre décroissant."
REQUEST = "SELECT P.name , P.base_total FROM PokemonAbility PA JOIN Pokemon P USING(pokedex_number) JOIN Abilities A USING(ability_id) WHERE A.name_ability = 'Overgrow' ORDER BY P.base_total DESC;"
rexecuteRequest(TITLE, REQUEST)  


#Requete 5 ------------------
TITLE="OBJECIF 5: Lister les noms des Pokémon, leur type principal et leur type secondaire (s'ils en ont un). Trier par le nom"
REQUEST = "Je n'ai pas trouvé/compris la notion de type principal et type secondaire dans la base de données"

#rexecuteRequest(TITLE, REQUEST)  


#Requete 6 ------------------
TITLE="OBJECIF 6: (1/3) Suppression de la Vue Stats_AVG s'elle existe, (Une nouvelle VUE qui affiche la moyen des stats par generation)"
REQUEST = "DROP VIEW IF EXISTS  Stats_AVG; "
rexecuteRequest(TITLE, REQUEST, False) 


TITLE="OBJECIF 6: (1/3) CREATION de la Vue Stats_AVG"
REQUEST = "CREATE VIEW Stats_AVG AS SELECT P.generation,  AVG(attack + defense + speed + sp_attack + sp_defense +hp) AS moyen FROM Stats S JOIN Pokemon P USING(pokedex_number) GROUP BY P.generation ;"
rexecuteRequest(TITLE, REQUEST, False) 


TITLE="OBJECIF 6: (2/3) Suppression de la Vue Stats_SUM  s'elle existe, (Une nouvelle VUE qui calcule et affiche la somme des satats des Pokemon)"
REQUEST = "DROP VIEW IF EXISTS  Stats_SUM;"
rexecuteRequest(TITLE, REQUEST, False) 


TITLE="OBJECIF 6: (2/3) CREATION de la Vue Stats_SUM"
REQUEST = "CREATE VIEW Stats_SUM AS SELECT P.pokedex_number, P.generation, P.name, (S.attack + S.defense + S.speed + S.sp_attack + S.sp_defense + S.hp) AS total_stats FROM Stats S JOIN Pokemon P USING(pokedex_number);"
rexecuteRequest(TITLE, REQUEST, False) 

#Requete 6
TITLE="OBJECIF 6: (3/3) Afficher les Pokémon avec un total de stats supérieur à la moyenne par génération."
REQUEST = "SELECT SSUM.name, SSUM.generation, SSUM.total_stats FROM Stats_SUM SSUM JOIN Stats_AVG SAVG USING(generation) WHERE SSUM.total_stats > SAVG.moyen;"
rexecuteRequest(TITLE, REQUEST)  


#Requete 7 ------------------
TITLE= "OBJECTIF 7: Trouver les Pokémon de type 'fire' avec une attaque supérieure à 100."
REQUEST = "SELECT P.name , S.attack FROM Stats S JOIN Pokemon P USING(pokedex_number)  WHERE S.attack > 100 AND P.pokedex_number IN (SELECT pokedex_number FROM PokemonType PT JOIN Types T USING(type_id) WHERE T.name_type = 'fire');"
rexecuteRequest(TITLE, REQUEST) 


#Requete 8 ------------------
TITLE="OBJECIF 8: Indiquer si le total des stats d'un Pokémon est supérieur ou inférieur à la moyenne par génération."
REQUEST = " SELECT SSUM.name, SSUM.generation, SSUM.total_stats, (CASE WHEN SSUM.total_stats <= SAVG.moyen THEN 'Inférieur ou égal à la moyenne' ELSE 'Supérieur à la moyenne' END ) AS total_stats_comparaison FROM Stats_SUM SSUM JOIN Stats_AVG SAVG USING(generation) ;"
rexecuteRequest(TITLE, REQUEST)  

conn.close()
