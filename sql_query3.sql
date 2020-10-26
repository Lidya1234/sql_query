--Show the name, continent and population of all countries
SELECT name, continent, population FROM world
--Show the name for the countries that have a population of at least 200 million
SELECT name FROM world WHERE population > 200000000
--Give the name and the per capita GDP for those countries with a population of at least 200 million.
select name ,gdp/population from world where population >= 200000000
--Show the name and population in millions for the countries of the continent 'South America'
select name ,population/1000000 from world where continent='south America'
--Show the name and population for France, Germany, Italy
select name, population from world where name IN ('France', 'Germany','Italy')
--Show the countries which have a name that includes the word 'United'
select name from world where name LIKE '%United%'
SELECT name ,population FROM  world WHERE polulation BETWEEN 1,000,000 AND 1,250,000;
SELECT name ,population FROM world WHERE name LIKE 'Al%';
SELECT name FROM world WHERE name LIKE '%a' name LIKE '%l';
SELECT name ,length(name) FROM world WHERE length(name)=5 and region='EUROPE';
SELECT name ,area*2 FROM world WHERE population=64000;
SELECT name ,area,population FROM world WHERE area >5000 and population < 10,000,000;
SELECT name ,population/area FROM world WHERE name IN ('china',)