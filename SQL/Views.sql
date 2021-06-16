-- VIEWS
	DROP VIEW Who;
	CREATE VIEW Who AS
    SELECT c.CharacterName,c.Location_X,c.Location_Y,l.Description_
    From character_ as c INNER JOIN land as l
    WHERE (c.Location_X,c.Location_Y) = (l.Location_X,l.Location_Y);
    
    SELECT * from Who