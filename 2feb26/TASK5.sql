SELECT COUNT(*) AS total_no_of_students FROM STUDENTS;
SELECT COUNT(*) AS total_no_of_students ,COUNT(active_flag) AS no_of_active_students FROM STUDENTS WHERE active_flag=1;



SELECT SUM(fees) AS total_fees FROM COURSES;
SELECT AVG(fees) AS average_fees FROM COURSES;
SELECT SUM(fees) FROM COURSES WHERE fees>2000;
SELECT MIN(age) AS min_age FROM STUDENTS;
SELECT MAX(age) AS max_age FROM STUDENTS;
SELECT TOP(1) * FROM STUDENTS ORDER BY registration_date ASC ;
SELECT TOP(1) * FROM STUDENTS ORDER BY registration_date DESC ;
SELECT active_flag,COUNT(*) AS no_of_students FROM STUDENTS GROUP BY active_flag;
SELECT age,COUNT(*) AS student_count FROM STUDENTS GROUP BY age ORDER BY AGE;
SELECT course_name,SUM(fees) FROM COURSES GROUP BY course_name;
SELECT course_id,COUNT(*) FROM ENROLLEMENTS GROUP BY course_id HAVING COUNT(*)>2;
SELECT student_id ,AVG(age) AS AGE FROM STUDENTS GROUP BY student_id HAVING AVG(AGE)>21;
SELECT course_id ,COUNT(*) FROM ENROLLEMENTS GROUP BY course_id HAVING COUNT(*)>2;