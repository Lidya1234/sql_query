--List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962
--Give year of 'Citizen Kane'
select yr from movie where title='Citizen Kane'
--List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
select id, title, yr from movie where title LIKE '%Star Trek%' ORDER BY yr
--What id number does the actor 'Glenn Close' have?
select id from actor where name='Glenn Close'
--What is the id of the film 'Casablanca'
select id from movie where title= 'Casablanca' 
--Obtain the cast list for 'Casablanca'.
select name from casting JOIN actor ON actorid=id where movieid=11768
--Obtain the cast list for the film 'Alien'
select name from casting JOIN actor ON actorid=id where movieid=(select id from movie where title='Alien')
--List the films in which 'Harrison Ford' has appeared
select title from movie JOIN casting ON movie.id =casting.movieid JOIN actor ON casting.actorid=actor.id where name= 'Harrison Ford'
--List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
select title from movie JOIN casting ON movie.id =casting.movieid JOIN actor ON casting.actorid=actor.id where name= 'Harrison Ford' AND ord !=1
--List the films together with the leading star for all 1962 films.
select title,name from movie JOIN casting ON movie.id =casting.movieid JOIN actor ON casting.actorid=actor.id where yr=1962 and ord=1
--Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
--List the film title and the leading actor for all of the films 'Julie Andrews' played in.
select title,name from movie JOIN casting ON casting.movieid=movie.id and ord=1
 JOIN actor ON casting.actorid=actor.id where movie.id IN(                  
SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews')
)
--
--List the films released in the year 1978 ordered by the number of actors in the cast, then by title
select title,COUNT(actorid) from movie JOIN casting ON movieid=id where yr=1978 GROUP BY title ORDER BY COUNT(actorid) desc,title
--List all the people who have worked with 'Art Garfunkel'
select name from actor JOIN casting ON id=actorid where movieid IN (select movieid from casting JOIN actor  ON id=actorid  where name= 'Art Garfunkel')