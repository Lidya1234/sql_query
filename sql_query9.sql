--List the teachers who have NULL for their department.
select name from teacher where dept IS NULL
--INNER JOIN misses the teachers with no department and the departments with no teacher
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
--Use a different JOIN so that all teachers are listed.
select teacher.name ,dept.name FROM teacher LEFT JOIN dept ON(teacher.dept=dept.id)           
--Use a different JOIN so that all departments are listed.
select teacher.name ,dept.name FROM teacher RIGHT JOIN dept ON(teacher.dept=dept.id)
--Show teacher name and mobile number or '07986 444 2266'
select name , COALESCE(mobile,'07986 444 2266')  from teacher 
--Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department
select teacher.name,COALESCE(dept.name,'None') from teacher LEFT JOIN dept ON dept=dept.id
--Use COUNT to show the number of teachers and the number of mobile phones.
select COUNT(name), COUNT(mobile) from teacher 
--Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.
select dept.name,COUNT(teacher.dept) from teacher RIGHT JOIN dept ON dept=dept.id GROUP BY dept.name
--Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
select teacher.name, 
CASE WHEN dept=1 OR dept=2 
     THEN 'Sci'
      ELSE 'Art'
END
from teacher LEFT JOIN dept ON teacher.id =dept.id
--Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.
select teacher.name,
CASE WHEN dept=1 OR dept=2
     THEN 'Sci'
     WHEN dept=3
     THEN 'Art'
     ELSE 'None'
END 
from teacher