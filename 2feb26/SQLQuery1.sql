CREATE DATABASE CollegeDB;
USE CollegeDB;
create table students(
rollno Numeric,student_name varchar(50),
course varchar(50),CGPA float);
insert into students values(225,'Sushanth Reddy','Computer Science',8);
insert into students values(226,'Rishanth Reddy','Computer Science',8);
insert into students values(227,'Navaneeth Reddy','Computer Science',8.);
select * from students;