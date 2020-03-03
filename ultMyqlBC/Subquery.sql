USE om;

-- select average
#1 -- get outter query working
SELECT
    AVG(unit_price) AS avgPrice
FROM items;

 #2   -- get second query working and HARDCODE data
SELECT 
	unit_price
FROM items
WHERE unit_price > 16.52;

#3  -- combine 
SELECT 
	unit_price
FROM items
WHERE unit_price > 
	(SELECT
    AVG(unit_price) AS avgPrice
	FROM items);
    
    # USE IN TO RETURN A LIST
    
    