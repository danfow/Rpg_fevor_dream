use rpg_fever_dream;


-- PROCEDURES
DROP PROCEDURE IF EXISTS rpg_fever_dream.login;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.login(IN uname VARCHAR(30), IN passw VARCHAR(30))
BEGIN

	SELECT account_.UserName,account_.Password_,account_.AccountType,account_.UserID
	FROM account_
	WHERE account_.UserName = uname and account_.Password_ = passw;

END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS rpg_fever_dream.listCharacters;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.listCharacters(IN uname VARCHAR(30))
BEGIN

	SELECT character_.CharacterName,character_.Race,character_.Level_ as Level
	FROM account_ join character_ on account_.UserID = character_.UserID
	WHERE account_.userID = character_.UserID and account_.UserName = uname;

END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS rpg_fever_dream.createCharacter;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.createCharacter(IN uusername VARCHAR(30) ,IN nname VARCHAR(30),IN rrace VARCHAR(30))
BEGIN
	set @userID =
	(SELECT account_.UserID
    FROM account_
    WHERE account_.UserName = uusername);
    
    
    

    
	INSERT INTO character_ (CharacterName,Gold,UserID,GuildID,Race,Level_,Location_X,Location_Y,isSelected)
    VALUES (nname,0,@userID,NULL,rrace,0,0,0,False);
    
    set @charID =
	(SELECT character_.CharacterID
    FROM character_
    WHERE character_.CharacterName = nname and character_.UserID = @userID);
    
	
    
    INSERT  HAS (IsON,IsSell,ItemID,CharacterID,price) VALUES (1,0,7,@charID,0);

END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS rpg_fever_dream.deleteCharacter;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.deleteCharacter(IN ccharacterName VARCHAR(100), IN uusername VARCHAR(30))
BEGIN
	set @uuserID =
	(SELECT account_.UserID
    FROM account_
    WHERE account_.UserName = uusername);
    
	set @charID =
	(SELECT character_.CharacterID
    FROM character_
    WHERE character_.CharacterName = ccharacterName and character_.UserID = @uuserID);

	
    DELETE
    FROM has
    WHERE has.CharacterID = @charID;
    
	DELETE 
    FROM character_
    WHERE character_.CharacterName = ccharacterName and character_.UserID = @uuserID;
END$$
DELIMITER ;




DROP PROCEDURE IF EXISTS rpg_fever_dream.prompt;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.prompt(IN uusername VARCHAR(30))
BEGIN
	set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);

Select Description_, gold, level_, attack, defense
    From Land
    Join
(Select gold,level_, location_X,Location_Y, attack, defense
    FROM Character_
        Join
(Select  sum(Stats_Attack) as attack, sum(Stats_Defense) as defense,CharacterID 
    From Item join (SELECT ItemID,CharacterID
    From Has where CharacterID = @charID and isOn = True) as Derp on Item.ItemID = Derp.ItemID) as fastasy on fastasy.characterID = Character_.characterID) as hell on (hell.Location_X,hell.Location_Y) = (Land.Location_X, Land.Location_Y);
    
    
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS rpg_fever_dream.selectCharacter;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.selectCharacter(IN uusername VARCHAR(30),IN CCharacterName VARCHAR(30))
BEGIN
	set @uuserID =
	(SELECT account_.UserID
    FROM account_
    WHERE account_.UserName = uusername);
    
    Update Character_
    Set isSelected = False
    Where UserID = @uuserID;
    
    
    set@selectedCount = (select count(isSelected) from Character_ where UserID=@uuserID and isSelected=True);
    
   Update Character_ 
   Set isSelected = if(@selectedCount = 0,True,False) 
   where CharacterName = CCharacterName and UserID = @uuserID; 
   
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS rpg_fever_dream.north;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.north(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_Y = Location_Y + 1
    Where Character_.CharacterID = @charID;
    
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS rpg_fever_dream.south;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.south(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_Y = Location_Y - 1
    Where Character_.CharacterID = @charID;
    
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS rpg_fever_dream.east;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.east(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_X = Location_X + 1
    Where Character_.CharacterID = @charID;
    
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS rpg_fever_dream.west;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.west(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_X = Location_X - 1 
    Where Character_.CharacterID = @charID;
    
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS rpg_fever_dream.northwest;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.northwwest(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_X = Location_X - 1 and Location_Y = Location_Y + 1
    Where Character_.CharacterID = @charID;
    
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS rpg_fever_dream.northeast;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.northeast(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_X = Location_X + 1 and Location_Y = Location_Y + 1
    Where Character_.CharacterID = @charID;
    
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS rpg_fever_dream.southeast;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.southeast(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_X = Location_X + 1 and Location_Y = Location_Y - 1
    Where Character_.CharacterID = @charID;
    
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS rpg_fever_dream.southwest;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.southwwest(IN uusername VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
	Update Character_
    Set Location_X = Location_X - 1 and Location_Y = Location_Y - 1
    Where Character_.CharacterID = @charID;
    
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS rpg_fever_dream.quit;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.quit(IN uusername VARCHAR(30))
BEGIN
	set @uuserID =
	(SELECT account_.UserID
    FROM account_
    WHERE account_.UserName = uusername);
    
    Update Character_
    Set isSelected = False
    Where UserID = @uuserID;

   
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS rpg_fever_dream.displayInventory;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.displayInventory(In uusername VARCHAR(30))
BEGIN 

	set @charID = (Select character_.CharacterID
			From Character_
				Join
		(Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	Select Name_, ItemType, Stats_Attack, Stats_Defense, Price
    From Item
    Join
    (Select ItemID, Price
    From Has
    Where Has.CharacterID = @charID and IsOn = false and IsSell = false) as inter1 on inter1.ItemID = Item.ItemID;
    
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS rpg_fever_dream.displayEquipment;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.displayEquipment(In uusername VARCHAR(30))
BEGIN 

	set @charID = (Select character_.CharacterID
			From Character_
				Join
		(Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	Select Name_, ItemType, Stats_Attack, Stats_Defense, Price
    From Item
    Join
    (Select ItemID, Price
    From Has
    Where Has.CharacterID = @charID and IsOn = true and IsSell = false) as inter1 on inter1.ItemID = Item.ItemID;
    
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS rpg_fever_dream.sellItem;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.sellItem(IN uusername VARCHAR(30), IN itemName varchar(30), In amount int)
BEGIN

	set @charID = (Select character_.CharacterID
			From Character_
				Join
		(Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	set @itemID = (Select ItemID From Item Where itemName = Item.Name_);
            
	Update Has
    Set Has.IsSell = true
    Where Has.CharacterID = @charID and @itemID = Has.ItemID and Has.IsOn = false and Has.IsSell = false
    Limit amount;

END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS rpg_fever_dream.displayMarket;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.displayMarket()
BEGIN
            
	Select Name_, ItemType, Stats_Attack, Stats_Defense, Price
    From Item
    Join
    (Select ItemID, Price
    From Has
    Where Has.IsSell = true) as inter1 on Item.ItemID = inter1.ItemID;
           
END $$
DELIMITER ;


-- New display market that also displays the character that is selling the item
DROP PROCEDURE IF EXISTS rpg_fever_dream.displayMarket;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.displayMarket()
BEGIN
	Select Name_, ItemType, Stats_Attack, Stats_Defense, Price,characterName From  
    
	(Select Name_, ItemType, Stats_Attack, Stats_Defense, Price,characterID
    From Item
    Join
    (Select ItemID, Price,CharacterID
    From Has
    Where Has.IsSell = true) as inter1 on Item.ItemID = inter1.ItemID
    
    ) as q join character_ on q.CharacterID = character_.characterID ;
           
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS rpg_fever_dream.buyItem;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.buyItem(IN uusername VARCHAR(30),IN itemName varchar(30), In ggold int, IN amount int)
BEGIN 

	set @charID = (Select character_.CharacterID
			From Character_
				Join
		(Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
    set @iitemID = (Select ItemID 
		   From Item 
		   Where  Item.Name_ = itemName);
								       
					
	/* Need to start loop here*/	
	set @counter := 0;
   myloop: while @counter < amount   do
    set @counter := @counter + 1;
    
    set @CharGold = (select gold
		     From Character_
		     Where Character_.CharacterID = @charID);

    set @SurrogateID = 0;
    set @SellerID = 0;
    set @BuyPrice = 0;	
	
   start transaction;	
    Select HasID, CharacterID, Price INTO @SurrogateID, @SellerID, @BuyPrice 
	FROM Has 
	where Has.ItemID = @iitemID and Has.Price <= ggold and Has.isSell = true 
    limit 1; 								       
								       
	IF @CharGold < @BuyPrice then
		Leave myloop;
	END IF;
    
    SET @cnt = (select count(ItemID)
    from has
    where Has.ItemID = @iitemID and Has.Price <= ggold and Has.isSell = true);
    
    IF @cnt < 1 then leave myloop;
	END If;
	
    Update Has
    Set Has.CharacterID = @charID 
    Where Has.HasID = @SurrogateID  limit 1;
    
    
    
    Update Has
    Set Has.IsSell = false
    Where Has.HasID = @SurrogateID  limit 1;
	
    
    
    Update Character_
    Set Character_.gold = Character_.gold - @BuyPrice
    Where Character_.CharacterID = @CharID limit 1;							       
    
    
	
    Update Character_
    Set Character_.gold = Character_.gold + @BuyPrice
    Where Character_.CharacterID = @SellerID limit 1;
	commit;
	end while;
							       
    /* End Loop here*/
    
								      
 END $$
 DELIMITER ; 

    DROP PROCEDURE IF EXISTS rpg_fever_dream.equip;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.equip(IN uusername VARCHAR(30), IN iitemname VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
    set @itemID = (select Item.ItemID
		from Item
        where Item.Name_ = iitemname); 
    
    
    set @isOn = (select count(ItemID)
    from has
    where @itemID = has.ItemID and @charID = has.CharacterID and isOn=true);
    
	
	
	set @TypeCheck1 = (select ItemType from Item where Item.ItemID = @itemID);
								       
	set @TypeCheck2 = (select count(ItemType) from Item join (select ItemID from has where CharacterID = @CharID and isOn = true)
								       as inter1 on inter1.ItemID = Item.ItemID and Item.ItemType = @TypeCheck1);							       
								       
	
	set @hasItem = (select count(ItemID)
    from has
    where @itemID = has.ItemID and @charID = has.CharacterID);
    
    set @currentStatus = (select isOn from Has where @itemID = has.ItemID and @charID = has.CharacterID limit 1);
    
	update has
    set isOn = if (@hasItem > 0 and @isOn = 0 and @TypeCheck2 = 0,true,@currentStatus) 
    where @itemID = has.ItemID and @charID = has.CharacterID limit 1;
        
    
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS rpg_fever_dream.unequip;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.unequip(IN uusername VARCHAR(30), IN iitemname VARCHAR(30))
BEGIN
	
    set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
	
    set @itemID = (select Item.ItemID
		from Item
        where Item.Name_ = iitemname); 
    
    /*
    set @isOn = (select count(ItemID)
    from has
    where @itemID = has.ItemID and @charID = has.CharacterID and isOn=true);
    
	set @hasItem = (select count(ItemID)
    from has
    where @itemID = has.ItemID and @charID = has.CharacterID);
    */
    -- make sure character is left with more than 0 equipment
    set @itemCheck = (select count(hasID)
	from has
    where @charID = has.CharacterID and isOn = true);
    
    set @currentStatus = (select isOn from Has where @itemID = has.ItemID and @charID = has.CharacterID limit 1);
    
	update has
    set isOn = if (@itemCheck > 1,false,@currentStatus)
    where @itemID = has.ItemID and @charID = has.CharacterID;
        
    
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS rpg_fever_dream.joinGuild;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.joinGuild(IN uusername VARCHAR(30), IN gguildName VARCHAR(30))
BEGIN

 set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	set @guildID = (Select guild.GuildID
			        From guild
                    WHERE guild.GuildName = gguildName);
                    
	update character_
    set character_.GuildID = @guildID
    where character_.CharacterID = @charID;
	
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS rpg_fever_dream.listGuildMembers;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.listGuildMembers(IN uusername VARCHAR(30))
BEGIN

 set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);

 set @guildID = (Select character_.guildID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	
                    
	select character_.characterName
    from character_
    INNER JOIN guild on character_.GuildID = guild.GuildID
    WHERE character_.GuildID = @guildID;
END $$
DELIMITER ;



DROP PROCEDURE IF EXISTS rpg_fever_dream.listGuilds;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.listGuilds()
BEGIN

 Select guild.GuildName,guild.GuildLeader
 From guild;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS rpg_fever_dream.listAlliances;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.listAlliances()
BEGIN

 Select alliance.Name_
 From alliance;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS rpg_fever_dream.joinAlliance;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.joinAlliance(IN uusername VARCHAR(30), IN aallianceName VARCHAR(30))
BEGIN


set @charID = (Select character_.CharacterID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
set @charName = (Select character_.CharacterName
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
set @allianceID = (Select alliance.AllianceID
				   From alliance
                   where alliance.Name_ = aallianceName);
		
            
set @charGuildID = (Select character_.GuildID
			From Character_
				Join
        (Select userID
			From account_
			Where account_.username = uusername) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            

                    
	set @guildLeader = (select guild.GuildLeader
						From guild
                        where guild.GuildID = @charGuildID);
                        
	
                        
	IF @guildLeader = @charName THEN
		INSERT INTO belongs_to VALUES ("2021-04-30",@allianceID,@charGuildID);
	END IF;
	
END $$
DELIMITER ;




-- New display market that also displays the character that is selling the item
DROP PROCEDURE IF EXISTS rpg_fever_dream.createGuild;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.createGuild(IN uuserID INT, IN gguildName Varchar(30))
BEGIN
	start transaction;
    
    set @charName = (Select character_.CharacterName
			From character_
				Join
        (Select userID
			From account_
			Where account_.userID = uuserID) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	 set @charGold = (Select character_.Gold
			From character_
				Join
        (Select userID
			From account_
			Where account_.userID = uuserID) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	
            
	
	IF @charGold >= 10000 THEN
    UPDATE character_
    Set  character_.GuildID = NULL
    WHERE character_.UserID = uuserID;
    END IF;
    
    IF @charGold >= 10000 THEN
    UPDATE character_
    Set character_.gold = @charGold -10000 
    WHERE character_.CharacterName = @charName;
    
  
    
    
    INSERT INTO GUILD (GuildLeader,GuildName) VALUES  (@charname,gguildName);
    
    
    set @guildID = (select guild.GuildID
						From guild
                        where guild.GuildName =gguildName );
    
	update character_
    Set character_.guildID = @guildID
	WHERE character_.CharacterName = @charName ;
	END IF;
	
 
    commit;       
END $$
DELIMITER ;




DROP PROCEDURE IF EXISTS rpg_fever_dream.accountCreation;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.accountCreation(IN first VARCHAR(30), IN last VARCHAR (30), IN credit int(16), IN street VARCHAR(30),IN city VARCHAR(30),IN state VARCHAR(30),IN zipcode INT(10),IN uusername VARCHAR(30), IN pass VARCHAR(30), IN e_mail VARCHAR(100))
BEGIN
	INSERT INTO Account_(PaymentInfo_FirstName, PaymentInfo_LastName, PaymentInfo_CreditCard, PaymentInfo_Address_Street, PaymentInfo_Address_City,PaymentInfo_Address_State, PaymentInfo_Address_ZipCode, UserName, Password_, Email, ServerName)
		VALUES(first,last,credit,street,city,state,zipcode,uusername,pass,e_mail,"Test Sever Please Ignore");
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS rpg_fever_dream.Who;
DELIMITER $$
CREATE PROCEDURE rpg_fever_dream.Who(IN uuserID INT)
BEGIN
	
    set @charLocation_X = (Select character_.Location_X
			From character_
				Join
        (Select userID
			From account_
			Where account_.userID = uuserID) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	 set @charLocation_Y = (Select character_.Location_Y
			From character_
				Join
        (Select userID
			From account_
			Where account_.userID = uuserID) as transition on transition.UserID = Character_.UserID and Character_.isSelected = True);
            
	SELECT c.CharacterName,c.Location_X,c.Location_Y,l.Description_
    From character_ as c INNER JOIN land as l on (c.Location_X,c.Location_Y) = (l.Location_X,l.Location_Y)
    WHERE (c.Location_X,c.Location_Y) = (@charLocation_X,@charLocation_Y);
           
END $$
DELIMITER ;


	
  

    





    
    
    
    
    
   
    
  
    
    


    
    
