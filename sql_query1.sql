SELECT population FROM world WHERE name='Germany';
SELECT name ,populaTion FROM world WHERE name IN ('Brazil', 'Russia','India', 'China') ;
SELECT name  FROM world WHERE  population BETWEEN 200,000 AND 250,000 ;
SELECT name ,population FROM  world WHERE polulation BETWEEN 1,000,000 AND 1,250,000;
SELECT name ,population FROM world WHERE name LIKE 'Al%';
SELECT name FROM world WHERE name LIKE '%a' name LIKE '%l';
