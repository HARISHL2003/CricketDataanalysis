SELECT*FROM odi ;
-- creating a working sql sheet--
CREATE TABLE odi_1
LIKE odi;
INSERT odi_1
SELECT * FROM odi;
SELECT * FROM odi_1;
		
ALTER TABLE odi_1
DROP COLUMN MyUnknownColumn;

SELECT * FROM odi_1;

ALTER TABLE odi_1 
DROP COLUMN `Unnamed: 13`;

SELECT*,
ROW_NUMBER() OVER(PARTITION BY Player,Span) AS row_num
FROM odi_1;
    
ALTER TABLE odi_1 ADD COLUMN Country VARCHAR(255);
UPDATE odi_1
SET 
	Country=substring_index(Player,"(",-1);
UPDATE odi_1
SET 
	Player=substring_index(Player,"(",1);
SELECT*
FROM odi_1;

SELECT*
FROM odi_1;
UPDATE odi_1
SET Country=
	CASE  
        WHEN country LIKE 'IND%' THEN 'India'  
        WHEN country LIKE '%INDIA)' THEN 'India'
        WHEN country LIKE '%AUS%'  THEN 'Australia'  
        WHEN country LIKE 'ICC/ENG%'THEN 'England'  
        WHEN country LIKE 'ENG)'THEN 'England'
        WHEN country LIKE 'ENG/ICC)'THEN 'England'  
        WHEN country LIKE '%%KENYA%'THEN 'Kenya'  
        WHEN country LIKE '%NZ%' OR country = 'NZ' THEN 'New Zealand'  
        WHEN country LIKE 'Afr/ZIM%' THEN'Zimbabwe'
        WHEN country LIKE 'ZIM%' THEN'Zimbabwe'
        WHEN country LIKE 'Afr/%SA%' THEN'South Africa'
        WHEN country LIKE 'SA%' THEN'South Africa'
        WHEN country LIKE '%BDESH%' THEN'Bangladesh'
        WHEN country LIKE '%PAK%' THEN 'Pakistan'  
        WHEN country LIKE '%SL%'  THEN 'Sri Lanka'  
		WHEN country LIKE '%IRE%'THEN 'IRELAND'
        WHEN country LIKE '%WI)'  THEN 'West Indies'
        WHEN country LIKE '(WI)'  THEN 'West Indies'
        WHEN country LIKE '%BMUDA%'THEN 'Bermuda'  
        WHEN country LIKE '%AFG%'THEN 'Afganistan' 
        WHEN country LIKE '%CAN%'THEN 'Canada'
        WHEN country LIKE 'NL)'THEN 'Netherland'
        WHEN country LIKE 'HKG)'THEN 'Hongkong'
        WHEN country LIKE 'UAE)'THEN 'UnitedStatesArab'
        
        ELSE country 
	END;

Select* FROM odi_1;

SELECT Span, COUNT(*)  
FROM odi_1  
GROUP BY Span  
ORDER BY Span;

Select Player,Ave,Country from odi_1
where Ave>50
Order by Country ASC;

SELECT Span, GROUP_CONCAT(Player ORDER BY Player) AS Players  
FROM odi_1  
GROUP BY Span  
HAVING COUNT(*) > 1  
ORDER BY Span;

SELECT * 
FROM odi_1 o1  
JOIN (  
    SELECT Span  
    FROM odi_1  
    GROUP BY Span  
    HAVING COUNT(*) > 1  
) o2  
ON o1.Span = o2.Span  
ORDER BY o1.Span, o1.Player;

Select * from odi_1;
SELECT COUNT(*) AS Player_count
From odi_1
Where Mat<100 AND Runs<1000;
Delete from odi_1
Where Mat<100 AND Runs<1000;
Select * from odi_1;
select count(*)
From odi_1
where Mat>100 and Runs>1000;





