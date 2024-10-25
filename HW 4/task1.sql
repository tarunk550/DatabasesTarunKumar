-- DROP DATABASE IF EXISTS pet_database;
-- CREATE DATABASE pet_database;
-- USE pet_database;

-- DROP TABLE IF EXISTS petPet, petEvent;

-- Up to the next CUTOFF POINT should be in task1.sql

CREATE TABLE petPet(
  petname varchar(255),
  owner varchar(255),
  species varchar(255),
  gender varchar(1),
  birth DATE,
  death DATE,
  PRIMARY KEY (petname)
);

CREATE TABLE petEvent (
  petname varchar(255),
  eventdate DATE,
  eventtype varchar(255),
  remark varchar(255),
  FOREIGN KEY (petname) REFERENCES petPet (petname) 
);
