-- Table structure for table Animes

DROP TABLE IF EXISTS Animes;
CREATE TABLE Animes (
  IdAnime serial PRIMARY KEY,
  Nom varchar(45) NOT NULL,
  Score decimal(3,2) DEFAULT NULL,
  IdType int NOT NULL,
  Episodes int DEFAULT NULL,
  AiredStart date DEFAULT NULL,
  AiredEnd date DEFAULT NULL,
  Premiered boolean DEFAULT false,
  IdStudio int DEFAULT NULL,
  IdSource int NOT NULL,
  Duration interval DEFAULT NULL,
  IdRating int DEFAULT NULL,
  Ranked decimal(10,1) DEFAULT NULL,
  Popularity int DEFAULT NULL
);

-- Table structure for table Types

DROP TABLE IF EXISTS Types;
CREATE TABLE Types (
  IdType serial PRIMARY KEY,
  Nom varchar(45) NOT NULL
);

-- Table structure for table Sources

DROP TABLE IF EXISTS Sources;
CREATE TABLE Sources (
  IdSource serial PRIMARY KEY,
  Nom varchar(45) NOT NULL
);

-- Table structure for table Ratings

DROP TABLE IF EXISTS Ratings;
CREATE TABLE Ratings (
  IdRating serial PRIMARY KEY,
  Nom varchar(45) NOT NULL,
  MinimumAge int NOT NULL
);

-- Table structure for table Studios

DROP TABLE IF EXISTS Studios;
CREATE TABLE Studios (
  IdStudio serial PRIMARY KEY,
  Nom varchar(45) NOT NULL
);

-- Table structure for table Genres

DROP TABLE IF EXISTS Genres;
CREATE TABLE Genres (
  IdGenre serial PRIMARY KEY,
  Nom varchar(45) NOT NULL
);

-- Table structure for table AnimesGenres

DROP TABLE IF EXISTS AnimesGenres;
CREATE TABLE AnimesGenres (
  IdGenre int NOT NULL,
  IdAnime int NOT NULL
);


-- Table structure for table Producers

DROP TABLE IF EXISTS Producers;
CREATE TABLE Producers (
  IdProducer serial PRIMARY KEY,
  Nom varchar(45) NOT NULL
);

-- Table structure for table AnimesProducers

DROP TABLE IF EXISTS AnimesProducers;
CREATE TABLE AnimesProducers (
  IdProducer int NOT NULL,
  IdAnime int NOT NULL
);

-- Insert data to table Type

INSERT INTO Types (Nom) VALUES 
  ('TV'),
  ('Movie');

-- Insert data to table Spurces

INSERT INTO Sources (Nom) VALUES 
  ('Original'),
  ('Manga');

  -- Insert data to table Ratings

INSERT INTO Ratings (Nom, MinimumAge) VALUES 
  ('R - 17+ (violence & profanity)',17),
  ('PG-13 - Teens 13 or older',13);

  -- Insert data to table Animes

INSERT INTO Animes (Nom, Score, IdType, Episodes,  AiredStart, AiredEnd,  Premiered, IdStudio,  IdSource,  Duration,  IdRating, Ranked ,  Popularity) VALUES 
  ('Cowboy Bebop', 8.78, 1, 26, '1998-04-03','1999-04-24', true, 1, 1, '24 M', 1, 28.0, 39),
  ('Cowboy Bebop:The Movie', 8.39, 2, 1, '2001-09-01', NULL, false, 2, 1, '1 H 55 M', 1, 159.0, 518),
  ('Naruto', 7.91, 2, 220, '2002-10-03', '2007-02-08', true, 3, 2, '23 M', 1, 159.0, 518),
  ('One Piece', 8.52, 2, NULL, '1999-10-20', NULL, true, 4, 2, '24 M', 1, 159.0, 518),
  ('Mobile Suit Gundam SEED	', 7.79, 2, 50, '2002-10-05', '2003-09-20', true, 1, 1, '24 M', 1, 159.0, 518),
  ('Mobile Suit Gundam SEED Destiny', 7.22, 2, 50, '2004-10-09', '2005-10-09', true, 1, 1, '24 M', 1, 159.0, 518);

 
-- Insert data to table Studios

INSERT INTO Studios (Nom) VALUES 
  ('Sunrise'),
  ('Bones'),
  ('Studio Pierrot'),
  ('Toei Animation');

  -- Insert data to table Genres

INSERT INTO Genres (Nom) VALUES 
  ('Action'),
  ('Adventure'),
  ('Drama'),
  ('SCi-Fi'),
  ('Space'),
  ('Shounen'),
  ('Military');


  -- Insert data to table Genres

INSERT INTO AnimesGenres (IdAnime, IdGenre) VALUES 
  (1,1),
  (1,2),
  (1,3),
  (1,4),
  (1,5),
  (2,1),
  (2,3),
  (2,4),
  (2,5),
  (3,1),
  (3,2),
  (3,6),
  (4,1),
  (4,2),
  (4,6),
  (5,1),
  (5,3),
  (5,4),
  (5,5),
  (5,7),
  (6,1),
  (6,3),
  (6,4),
  (6,5),
  (6,7);

  
  -- Insert data to table Producers

INSERT INTO Producers (Nom) VALUES 
  ('Bandai Visual'),
  ('Sunrise'),
  ('TV Tokyo'),
  ('Shueisha'),
  ('Fuji TV'),
  ('Sotsu'),
  ('Sony Music Entertainment');


-- Insert data to table AnimesProducers

INSERT INTO AnimesProducers (IdAnime, IdProducer) VALUES 
  (1,1),
  (2,1),
  (2,2),
  (3,3),
  (3,4),
  (4,5),
  (4,4),
  (5,6),
  (5,7),
  (6,6),
  (6,7);


