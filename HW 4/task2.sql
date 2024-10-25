-- Exercise 1: Inserting new values into the table
INSERT  INTO petEvent VALUES("Fluffy", '2020-10-15', "vet", "antibiotics");

-- Exercise 2: Inserting new values into the table
INSERT INTO petPet VALUES("Hammy", "Diane", "hamster", "M", '2010-10-30', NULL);

INSERT  INTO petEvent VALUES("Hammy", '2020-10-15', "vet", "antibiotics");

-- Exercise 3: Updating values in the table
UPDATE petEvent 
SET remark= "5 kittens, 3 females, 2 males"
WHERE eventdate= "1995-05-15";

-- Exercise 4: Updating values in the table
UPDATE petEvent 
SET petname= "Claws"
WHERE eventdate= "1997-08-03";

-- Exercise 5: Updating values in the table
UPDATE petPet 
SET death= "2020-09-01"
WHERE petname= "Puffball";

-- Exercise 6: Deleting elements from the table

-- To delete from the parent row, the foreign key constraint needs to be removed, hence needing to disable the foreign key check and then deleting the element
SET FOREIGN_KEY_CHECKS=0;

DELETE FROM petPet WHERE petname= "Buffy";

SET FOREIGN_KEY_CHECKS=1;