


CALL login("username","password");
CALL listCharacters("username");
CALL createCharacter("username","Bilbo","Hobbit");
CALL createCharacter("username","Sam","Hobbit");
CALL CreateCharacter("uname","Frodo","Hobbit");
CALL createCharacter("username","Pippin","Hobbit");
CALL createCharacter("shot","DOOMGUY","Human");
CALL createCharacter("shot","Master Chief","Human");
CALL deleteCharacter("Pippin","username");
CALL createCharacter("username","Pippin","Hobbit");


Call selectCharacter("username","Bilbo");
CALL selectCharacter("shot",";Drop Table Item");
Call selectCharacter("username","Sam");
CALL createCharacter("shot",""";Drop Table Item","Hobbit");

CALL north("shot");

CALL displayMarket();

CALL buyItem("shot","Bilbo","Shield",6 );
call displayEquipment("shot");
call displayInventory("shot");
CALL equip("shot","Shield");
CALL equip ("uname","broken sword");
call unequip("shot","Shield");


call selectCharacter("shot", "DOOMGUY");
call selectCharacter("uname", "Frodo");
call sellItem("shot", "Broken Sword", 1);

call displayInventory("shot");
call sellItem("shot", "Fleeting Shoes", 2);
call displayMarket();

-- Guilds 
CALL createguild(2,"small folk");
CALL createguild(3,"FPS club");
CALL createguild(1,"Potato Farmers");
CALL createguild(1,"The Jedi Council");
CALL createguild(4,"The Empire Business");
CALL createguild(5,"Los Pollos Hermanos");


-- alliances 
CALL joinAlliance("CrystalBlue","Breaking Bad");
CALL joinAlliance("ChickenMan","Breaking Bad");


-- character creation

CALL createCharacter("CrystalBlue","Heisenberg","Human");
CALL createCharacter("CrystalBlue","Jessie","Human");
CALL createCharacter("CrystalBlue","Skyler","Human");
CALL createCharacter("CrystalBlue","Walter Jr.","Human");



CALL createCharacter("ChickenMan","Gus Fring","Human");
CALL createCharacter("ChickenMan","Mike ","Human");
CALL createCharacter("ChickenMan","Gus Fring","Human");
CALL createCharacter("ChickenMan","Mike Ehrmantraut","Human");
CALL createCharacter("ChickenMan","Victor","Human");
CALL createCharacter("ChickenMan","Tyrus Kitt","Human");


CALL createCharacter("username","Mace Windu","Human");
CALL createCharacter("username","Kit Fisto","Human");

CALL createCharacter("uname","Anakin","Human");
CALL createCharacter("uname","Obi-Wan","Human");
CALL createCharacter("uname","Yoda","Unknown");

CALL createCharacter("Asmongold","Fury Warrior","Human");
CALL createCharacter("Asmongold","Survival Hunter","Human");
CALL createCharacter("Asmongold","Holy Paladin","Human");
CALL createCharacter("Asmongold","Marksmen Hunter","Human");





-- Testing log
CALL listCharacters("shot");

CALL listCharacters("username");
CALL deleteCharacter("Bilbo","username");

CALL deleteCharacter("Yoda","uname");

CALL prompt("shot");
CALL prompt("uname");
CALL north("uname");

CALL joinGuild("uname","The fellowship");
CALL selectCharacter("username","Sam");
CALL joinGuild("username","The fellowship");
CALL joinGuild("CrystalBlue","The Empire Business");

CALL listGuildMembers("uname");

CALL listGuilds();
CALL listAlliances();

CALL north("ChickenMan");
CALL who(5);
















