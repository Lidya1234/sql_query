--Show noble of 1950
SELECT yr, subject, winner FROM nobel WHERE yr = 1950
--Show who won the 1962 prize for Literature.
SELECT winner FROM nobel WHERE yr = 1962 AND subject = 'Literature'
--Show the year and subject that won 'Albert Einstein' his prize.
select yr ,subject from nobel where winner= 'Albert Einstein'
--Give the name of the 'Peace' winners since the year 2000, including 2000
select winner from nobel where yr >= 2000 AND subject='Peace'
--Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
select yr ,subject,winner from nobel where subject='Literature' AND yr BETWEEN 1980 and 1989
--Show all details of the presidential winners:Theodore Roosevelt,Woodrow Wilson,Jimmy Carter,Barack Obama
SELECT * FROM nobel WHERE subject ='Peace' and winner IN ('Theodore Roosevelt','Woodrow Wilson','Jimmy Carter','Barack Obama')
--Show the winners with first name John
select winner from nobel where winner LIKE 'john%'
--Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
select yr,subject,winner from nobel where subject='physics' AND yr =1980 OR subject='chemistry' AND yr=1984
--Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
select yr,subject,winner from nobel where yr=1980 AND subject NOT IN ('Chemistry','Medicine')
--Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
select yr,subject ,winner from nobel where subject='Medicine' AND yr< 1910 OR subject='Literature' AND yr >= 2004
--Find all details of the prize won by PETER GRÜNBERG
select * from nobel where winner ='PETER GRÜNBERG'
--Find all details of the prize won by EUGENE O'NEILL
select * from nobel where winner = 'EUGENE O''NEILL'
--List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
select winner,yr ,subject  from nobel where winner LIKE 'Sir%' 
--Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
  ORDER BY CASE WHEN subject IN ('Physics','Chemistry') THEN 1 ELSE 0 END, subject,winner
