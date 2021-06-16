-- DROP DATABASE rpg_fever_dream;
CREATE DATABASE rpg_fever_dream;
use rpg_fever_dream;

CREATE TABLE Account_(

	PaymentInfo_FirstName		varchar(30),
	PaymentInfo_LastName		varchar(30),
	PaymentInfo_CreditCard		int,
	PaymentInfo_Address_Street	varchar(30),
	PaymentInfo_Address_City	varchar(30),
	PaymentInfo_Adresss_State	varchar(30),
	PaymentInfo_Address_ZipCode	int,
    AccountType                 varchar(30),
	UserID						int						UNIQUE  AUTO_INCREMENT,
	UserName					varchar(30)				UNIQUE,
	Password_					varchar(30),
	Email						varchar(30),
    ServerName					varchar(30),
    

	PRIMARY KEY(UserID)

);


CREATE TABLE Guild(

	GuildLeader				varchar(30),
    GuildID					int,
    GuildName				varchar(30)			UNIQUE,
    
	PRIMARY KEY(GuildID)
    


);


ALTER TABLE Guild
MODIFY GuildID INT NOT NULL auto_increment;
CREATE TABLE Alliance(
	Name_				varchar(30)				UNIQUE,
    AllianceID				int,
	
    PRIMARY KEY(AllianceID)



);

CREATE TABLE Belongs_to(

	StartDate			datetime,
    AllianceID				int,
    GuildID					int ,
    
	CONSTRAINT BELONGs_TOToGUILD FOREIGN KEY Belongs_to(GuildID) REFERENCES Guild(GuildID),
	CONSTRAINT BELONGs_TOtoAlliance FOREIGN KEY Belongs_to(AllianceID) REFERENCES Alliance(AllianceID)

);


ALTER TABLE Belongs_to
ADD PRIMARY KEY (AllianceID,GuildID);

CREATE TABLE Land(

	Location_X          int,
	location_Y          int,
    LandID				int				unique,
    Description_		varchar(30),			
   
    PRIMARY KEY (Location_X,Location_Y)

);

CREATE TABLE Owns(

	StartDate     datetime,
    AllianceID		int,
    Location_X		int,
    Location_Y		int,
    PRIMARY KEY (Location_X,Location_Y),
    
    
	CONSTRAINT OwnsToAlliance FOREIGN KEY Owns(AllianceID) REFERENCES Alliance(AllianceID),
	CONSTRAINT OwntoLand FOREIGN KEY Owns(Location_X,Location_Y) REFERENCES Land(Location_X,Location_Y)
    

);









CREATE TABLE Character_(

	CharacterID					int AUTO_INCREMENT,
    CharacterName				varchar(100) UNIQUE,
    Gold						int,
    UserID						int,
    GuildID						int,
    Race						varchar(30),
    Level_						int,
    Location_X					int,
    Location_Y					int,
    isSelected					bool,
    
    PRIMARY KEY (CharacterID),
	
   
	CONSTRAINT characterstoguild FOREIGN KEY character_(GuildID) REFERENCES Guild(GuildID),
    CONSTRAINT charactertoAccount FOREIGN KEY character_(UserID) REFERENCES Account_(UserID),
	CONSTRAINT charactertoLand FOREIGN KEY character_(Location_X,Location_Y) REFERENCES Land(Location_X,Location_Y)
	
);
ALTER TABLE Character_
ADD CONSTRAINT  characterstoguild FOREIGN KEY character_(GuildID) REFERENCES Guild(GuildID);



CREATE TABLE Item(

	ItemType 			varchar(30),
	ItemID 				int,
	Stats_Attack 		int,	
	Stats_Defense 		int,
	Name_				varchar(30),
   

PRIMARY KEY (ItemID)

);




CREATE TABLE Has(

	IsOn				bool,
    IsSell				bool,
	ItemID 				int,
	CharacterID			int,
	Price		   		int,
    
	CONSTRAINT Hastocharacter FOREIGN KEY Has(CharacterID)  REFERENCES character_(CharacterID),
	CONSTRAINT HastoItem FOREIGN KEY Has(ItemID)  REFERENCES Item(ItemID)
    
);

ALTER TABLE Has
ALTER PRICE SET DEFAULT 1;





UPDATE Has
SET price = 0
WHERE price is NULL;

/*  Code below was to modify the has table to have a surrogate key that autoincremented. Is currently still needed until table is dropped and had these changes made
ALTER TABLE Has
ADD hasID int;  -- surrogate key that has not business logic.

UPDATE Has
SET hasID = 0
WHERE hasID IS NULL;

ALTER TABLE has
MODIFY COLUMN hasID
INT NOT NULL;

ALTER TABLE has
ADD PRIMARY KEY (hasID);

ALTER TABLE has
MODIFY hasID INT NOT NULL auto_increment;

code above added the surregate key for has
/*













