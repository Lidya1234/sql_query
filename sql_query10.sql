--How many stops are in the database
select count(id) from stops
--Find the id value for the stop 'Craiglockhart'
select id from stops where name='Craiglockhart'