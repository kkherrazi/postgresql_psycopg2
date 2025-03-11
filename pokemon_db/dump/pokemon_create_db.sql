DROP TABLE IF EXISTS Stats;
CREATE TABLE Stats(
   pokedex_number INTEGER  NOT NULL PRIMARY KEY 
  ,hp             INTEGER  NOT NULL
  ,attack         INTEGER  NOT NULL
  ,defense        INTEGER  NOT NULL
  ,speed          INTEGER  NOT NULL
  ,sp_attack      INTEGER  NOT NULL
  ,sp_defense     INTEGER  NOT NULL
);

DROP TABLE IF EXISTS Types;
CREATE TABLE Types(
   name_type   VARCHAR(45) NOT NULL
  ,type_id INTEGER  NOT NULL PRIMARY KEY 
);
DROP TABLE IF EXISTS PokemonType;
CREATE TABLE PokemonType(
   pokedex_number INTEGER  NOT NULL
  ,type_id        INTEGER  NOT NULL
);

DROP TABLE IF EXISTS Abilities;
CREATE TABLE Abilities(
   name_ability VARCHAR(45) NOT NULL
  ,ability_id   INTEGER  NOT NULL PRIMARY KEY 
);
DROP TABLE IF EXISTS PokemonAbility;
CREATE TABLE PokemonAbility(
   pokedex_number INTEGER  NOT NULL
  ,ability_id     INTEGER  NOT NULL
);

DROP TABLE IF EXISTS Classification;
CREATE TABLE Classification(
   classification_id   INTEGER  NOT NULL PRIMARY KEY 
  ,name_classification VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS Pokemon;
CREATE TABLE Pokemon(
   base_egg_steps    INTEGER  NOT NULL
  ,base_happiness    INTEGER  NOT NULL
  ,base_total        INTEGER  NOT NULL
  ,capture_rate      VARCHAR(24) NOT NULL
  ,classification_id INTEGER  NOT NULL
  ,experience_growth INTEGER  NOT NULL
  ,height_m          NUMERIC(4,1)
  ,name              VARCHAR(45) NOT NULL
  ,percentage_male   NUMERIC(5,1)
  ,pokedex_number    INTEGER  NOT NULL PRIMARY KEY 
  ,weight_kg         NUMERIC(5,1)
  ,generation        INTEGER  NOT NULL
  ,is_legendary      BOOLEAN  NOT NULL
);