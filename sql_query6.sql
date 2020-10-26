--Show the total population of the world.
SELECT SUM(population)
FROM world
--List all the continents - just once each
select DISTINCT continent from world
--Give the total GDP of Africa
select sum(gdp) from world where continent='Africa'
--How many countries have an area of at least 1000000
select count(name) from world where area >= 1000000
--What is the total population of ('Estonia', 'Latvia', 'Lithuania')
select sum(population) from world where name IN ('Estonia', 'Latvia', 'Lithuania')
--For each continent show the continent and number of countries.
select continent,count(name) from world GROUP BY continent
--For each continent show the continent and number of countries with populations of at least 10 million.
select continent,count(name) from world where population >= 10000000 GROUP BY CONTINENT
--List the continents that have a total population of at least 100 million.
select continent from world  GROUP BY CONTINENT HAVING SUM(population) >= 100000000 
