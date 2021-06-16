use rpg_fever_dream;

-- ACCOUNT DATA
INSERT INTO account_ (PaymentInfo_FirstName,PaymentInfo_LastName,PaymentInfo_CreditCard,PaymentInfo_Address_Street,PaymentInfo_Address_City,PaymentInfo_Adresss_State,PaymentInfo_address_ZipCode,AccountType,UserName,password_,Email,ServerName)
VALUES ("John","Doe",65118,"Random Street Drive","Kansas City","Missouri","55555","User","username","password","JohnDoe@gmail.com","World1");

INSERT INTO account_ (PaymentInfo_FirstName,PaymentInfo_LastName,PaymentInfo_CreditCard,PaymentInfo_Address_Street,PaymentInfo_Address_City,PaymentInfo_Adresss_State,PaymentInfo_address_ZipCode,AccountType,UserName,password_,Email,ServerName)
 VALUES ("Jane","Doe",67412,"Whack Street Drive","Kansas City","Missouri","12345","Admin","uname","passw","JaneDoe@gmail.com","World1");
 
 INSERT INTO account_ (PaymentInfo_FirstName,PaymentInfo_LastName,PaymentInfo_CreditCard,PaymentInfo_Address_Street,PaymentInfo_Address_City,PaymentInfo_Adresss_State,PaymentInfo_address_ZipCode,AccountType,UserName,password_,Email,ServerName)
 VALUES ("Han","Solo",54725,"Far away drive","New York","New York","65623","Designer","shot","first","HanSolo@gmail.com","World1");
 
  INSERT INTO account_ (PaymentInfo_FirstName,PaymentInfo_LastName,PaymentInfo_CreditCard,PaymentInfo_Address_Street,PaymentInfo_Address_City,PaymentInfo_Adresss_State,PaymentInfo_address_ZipCode,AccountType,UserName,password_,Email,ServerName)
 VALUES ("Walter","White",4578-4562-5643-9173,"308 Negra Arroyo Lane","Albuquerque","New Mexico","87101","User","CrystalBlue","SayMyName","Heisenberg@gmail.com","World1");
 
 INSERT INTO account_ (PaymentInfo_FirstName,PaymentInfo_LastName,PaymentInfo_CreditCard,PaymentInfo_Address_Street,PaymentInfo_Address_City,PaymentInfo_Adresss_State,PaymentInfo_address_ZipCode,AccountType,UserName,password_,Email,ServerName)
 VALUES ("Gus","Fring",4278-4593-5643-9142,"1213 Jefferson St","Albuquerque","New Mexico","87101","User","ChickenMan","Empire","LosPollosHermanos@gmail.com","World1");
 
 INSERT INTO account_ (PaymentInfo_FirstName,PaymentInfo_LastName,PaymentInfo_CreditCard,PaymentInfo_Address_Street,PaymentInfo_Address_City,PaymentInfo_Adresss_State,PaymentInfo_address_ZipCode,AccountType,UserName,password_,Email,ServerName)
 VALUES ("Zack","Rawr",5678-4593-5643-9142,"121 Hillcrest Dr","Austin","Texas","79563","User","Asmongold","SupBois","Asmongold@gmail.com","World1");
 
-- CHARACTER DATA Prob not necessary use createCharacter prodecure
/*
INSERT INTO character_ VALUES (1,"Gollum",0,1,NULL,"Hobbit",0,0,0);
INSERT INTO character_ VALUES (2,"Sam",0,1,NULL,"Hobbit",0,0,0);
INSERT INTO character_ VALUES (3,"Frodo",0,1,NULL,"Hobbit",0,0,0);

INSERT INTO character_ VALUES (4,"Doomguy",0,2,NULL,"Human",0,10,10);

INSERT INTO character_ VALUES (5,"MasterChief",0,3,NULL,"Human",0,10,10);
 -- delete from character_
 -- where CharacterID in (4,5);
*/

-- Land Data (Delete this and I will destroy you >:D)
INSERT INTO land VALUES (-5,4,5,"NW Mount DOOM");
INSERT INTO land VALUES (-4,4,6,"NE Mount DOOM");
INSERT INTO land VALUES (-3,-4,7,"East Mount DOOM");
INSERT INTO land VALUES (-2,-4,8,"Orgrimmar");
INSERT INTO land VALUES (-1,-4,9,"Wampa Caves");
INSERT INTO land VALUES (0,4,10,"Windhelm");
INSERT INTO land VALUES (1,4,11,"East of Windhelm");
INSERT INTO land VALUES (2,4,12,"Khan's Domain");
INSERT INTO land VALUES (3,4,13,"NW World Tree");
INSERT INTO land VALUES (4,4,14,"NE World Tree");
INSERT INTO land VALUES (5,4,15,"THE WALL");

INSERT INTO land VALUES (-5,3,16,"SW Mount DOOM");
INSERT INTO land VALUES (-4,3,17,"SE Mount DOOM");
INSERT INTO land VALUES (-3,3,18,"East of mt DOOM,SW Orgrimmar");
INSERT INTO land VALUES (-2,3,19,"Direct South of Orgrimmar");
INSERT INTO land VALUES (-1,3,20,"Direct S Wampa Caves");
INSERT INTO land VALUES (0,3,21,"Direct S Windhelm");
INSERT INTO land VALUES (1,3,22,"SE of Windhelm,SW Khan");
INSERT INTO land VALUES (2,3,23,"Direct S Khan's Domain");
INSERT INTO land VALUES (3,3,24,"SW world tree");
INSERT INTO land VALUES (4,3,25,"SE world tree");
INSERT INTO land VALUES (5,3,26,"THE WALL");

INSERT INTO land VALUES (-5,2,27,"W of Land o spiders");
INSERT INTO land VALUES (-4,2,28,"Land o spiders ahhhhhhhhhhh");
INSERT INTO land VALUES (-3,2,29,"East of Land o spiders");
INSERT INTO land VALUES (-2,2,30,"West of The Imperial City");
INSERT INTO land VALUES (-1,2,31,"The Imperial City");
INSERT INTO land VALUES (0,2,32,"East of The Imperial City");
INSERT INTO land VALUES (1,2,33,"Land of untouchables");
INSERT INTO land VALUES (2,2,34,"Land of the fairy fountain");
INSERT INTO land VALUES (3,2,35,"NW Dark Forest");
INSERT INTO land VALUES (4,2,36,"NE Dark Forest");
INSERT INTO land VALUES (5,2,37,"THE WALL");

INSERT INTO land VALUES (-5,1,38,"NW Jungle of Xandar");
INSERT INTO land VALUES (-4,1,39,"NE Jungle of Xandar");
INSERT INTO land VALUES (-3,1,40,"East of jungle of Xandar");
INSERT INTO land VALUES (-2,1,41,"The Crystal Forest");
INSERT INTO land VALUES (-1,1,42,"Imperial Mines");
INSERT INTO land Values (0,1,3,"The Shire");
INSERT INTO land Values (1,1,43,"NE of The Shire");
INSERT INTO land Values (2,1,44,"N Hobbiton Mountains");
INSERT INTO land Values (3,1,45,"SW Dark Forest");
INSERT INTO land Values (4,1,46,"SE Dark Forest");
INSERT INTO land Values (5,1,47,"THE WALL");

INSERT INTO land Values (-5,0,48,"SW Jungle of Xandar");
INSERT INTO land Values (-4,0,49,"SE Jungle of Xandar");
INSERT INTO land Values (-3,0,50,"SW of Crystal Forest");
INSERT INTO land Values (-2,0,51,"E of mushroom forest");
INSERT INTO land Values (-1,0,52,"mushroom forest");
INSERT INTO land VALUES (0,0,1,"The Shire");
INSERT INTO land Values (1,0,53,"Northern Shire Farms");
INSERT INTO land Values (2,0,54,"Southern Hobbiton mountains");
INSERT INTO land Values (3,0,55,"Abandoned Village");
INSERT INTO land Values (4,0,56,"Necromancer Tower");
INSERT INTO land Values (5,0,57,"THE WALL");


INSERT INTO land Values (-5,-1,58,"Far NW The Citadel");
INSERT INTO land Values (-4,-1,59,"Far NE The Citadel");
INSERT INTO land Values (-3,-1,60,"West of Lake Hyrule");
INSERT INTO land Values (-2,-1,61,"Lake Hyrule");
INSERT INTO land Values (-1,-1,62,"S of mushroom forest");
INSERT INTO land Values (0,-1,63,"S of The Shire");
INSERT INTO land Values (1,-1,64,"Southern Shire Farms");
INSERT INTO land Values (2,-1,65,"N bank Lake Fevor Dream");
INSERT INTO land Values (3,-1,66,"NW Alduin's Domain");
INSERT INTO land Values (4,-1,67,"NE Alduin's Domain");
INSERT INTO land Values (5,-1,68,"THE WALL");


INSERT INTO land Values (-5,-2,69,"NW Citadel");
INSERT INTO land Values (-4,-2,70,"NE Citadel");
INSERT INTO land Values (-3,-2,71,"N of THE Great Chasm");
INSERT INTO land Values (-2,-2,72,"Southern bank of Lake Hyrule");
INSERT INTO land Values (-1,-2,73,"W of Rivendell");
INSERT INTO land Values (0,-2,74,"Rivendell");
INSERT INTO land Values (1,-2,75,"E of Rivendell");
INSERT INTO land Values (2,-2,76,"Lake Fevor Dream");
INSERT INTO land Values (3,-2,77,"SW Alduin's domain");
INSERT INTO land Values (4,-2,78,"SE Alduin's domain");
INSERT INTO land Values (5,-2,79,"THE WALL");


INSERT INTO land Values (-5,-3,80,"SW Citadel");
INSERT INTO land Values (-4,-3,81,"SE Citadel");
INSERT INTO land Values (-3,-3,82,"The Great Chasm");
INSERT INTO land Values (-2,-3,83,"East of The Great Chasm");
INSERT INTO land Values (-1,-3,84,"West of Mount Hyrule");
INSERT INTO land Values (0,-3,85,"Mount Hyrule");
INSERT INTO land Values (1,-3,86,"East of Mount Hyrule");
INSERT INTO land Values (2,-3,87,"Southern bank Lake Fevor Dream");
INSERT INTO land Values (3,-3,88,"Far West of THE WALL");
INSERT INTO land Values (4,-3,89,"West of THE WALL");
INSERT INTO land Values (5,-3,90,"THE WALL");

-- Ban Zone >:D
INSERT INTO land VALUES (10,10,2,"Wasteland");


 -- Fixes for errors during map making don't delete if you want backup map to work :)
 /*
UPDATE land
SET land.Description_ = "Rolling Hills"
WHERE (land.Location_X,land.location_Y) = (0,1);

UPDATE land
SET land.Location_X =-5 
WHERE (land.Location_X,land.location_Y) = (0,-4);

UPDATE land
SET land.Location_y =4 
WHERE (land.Location_X,land.location_Y) = (-5,-4);

UPDATE land
SET land.Location_y =4 
WHERE (land.Location_X,land.location_Y) = (-4,-4);

UPDATE land
SET land.Description_ = "W of mushroom forest"
WHERE (land.Location_X,land.location_Y) = (-2,0);

UPDATE land
SET land.landID =80
WHERE (land.Location_X,land.location_Y) = (-2,0);

*/

-- Item Data
insert Item values("Head",1,0,10,"Helmet of Nefelheim");
insert Item value("Feet",2,0,5,"Fleeting Shoes");
insert Item values("Hands",3,4,1,"Spiked gloves");
insert Item values("Hands",4,100,100,"Broken Sword");
insert Item values("Hands",5,0,10,"Shield");
insert Item values("Fists",7,1,0,"Fists");


-- inserting equipment into character
insert has values(True,False,1,1,NULL);
insert has values(True,False,1,2,NULL);
insert has values(True,False,1,3,NULL);
insert has values(True,False,1,7,NULL);
insert has values(True,False,1,6,NULL);
insert has values(True,False,1,5,NULL);
insert has values(True,False,2,7,NULL);
insert has values(True,False,2,6,NULL);
insert has values(True,False,2,5,NULL);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, False, 3, 5, 5);

-- Inserting data for items being sold
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, False, 1, 5, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, False, 1, 5, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 1, 5, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 1, 5, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 1, 5, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 1, 5, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, False, 1, 6, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, False, 1, 6, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, False, 1, 6, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, False, 1, 6, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 1, 6, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 1, 6, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, False, 2, 5, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, False, 2, 5, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 2, 5, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 2, 5, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, False, 2, 6, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, False, 2, 6, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, False, 2, 6, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 2, 6, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 2, 6, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 3, 5, Null);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 3, 5, 2);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 3, 3, 2);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 4, 3, 2);
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 5, 3, 5);

Update Has set Price = 8 Where ItemId = 1 and IsSell = true Limit 1;
Insert Has (IsON,IsSell,ItemID,CharacterID,price) values(False, True, 5, 1, 5);



-- Guild data
INSERT INTO guild VALUES ("Frodo",1,"The Fellowship");

-- Alliance data
INSERT INTO alliance VALUES ("Middle earth fighters",1);
INSERT INTO alliance VALUES ("Fantasy fighters",2);
INSERT INTO alliance VALUES ("Small folk",3);
INSERT INTO alliance VALUES ("Breaking Bad",4);

INSERT INTO belongs_to  VALUES  ("2021-04-30",1,1);
INSERT INTO belongs_to  VALUES  ("2021-04-30",2,1);


-- land owning data
INSERT INTO owns VALUES ("2021-04-30",1,0,0);















