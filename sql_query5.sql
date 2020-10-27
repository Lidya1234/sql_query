--List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
--Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
select name from world where continent ='Europe' AND gdp/population > (select gdp/population from world where name='United Kingdom' )
--List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country. 
select name,continent from world where continent =(select continent from world where name='Argentina') OR continent =(select continent from world where name='Australia') ORDER BY name
--Which country has a population that is more than Canada but less than Poland? Show the name and the population.
select name, population from world where population > (select population from world where name='Canada')AND population < (select population from world where name='Poland')
--Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
select name, CONCAT(ROUND(100*population/(select population from world where name='Germany')),'%')from world where continent='Europe'
--Which countries have a GDP greater than every country in Europe?
select name from world where gdp >ALL(SELECT gdp from world where continent='Europe' and gdp>0)
--Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
--List each continent and the name of the country that comes first alphabetically.
select continent ,name from world x where name <= ALL(select name from world y where x.continent = y.continent) 
--Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population
select name,continent,population from world where continent IN
(select continent from world x where 25000000>=
(select MAX(population) from world y where x.continent=y.continent))
--Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
select name,continent from world x where population > ALL(select 3*population from world y where x.continent =y.continent AND x.name <> y.name)        

